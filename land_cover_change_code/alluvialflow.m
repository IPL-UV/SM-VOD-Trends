function [color_h] = alluvialflow(data, left_labels, right_labels, chart_title)
% Copyright 2018 The MathWorks, Inc. 
%
% Plot an alluvial flow diagram.
% left_labels:  Names of categories to flow from.
% right_labels: Names of categories to flow to.
% data:         Matrix with size numel(left_labels) rows by
%               numel(right_labels) columns.
%
% Ideas for future work:
% 1. Get data from a MATLAB table, use table variable names and named rows
%    as labels.
% 2. Interface similar to the plot function, with name-value pairs, optional
%    parameters etc.
%     h = gcf;
%     clf
    % set(h, 'WindowStyle', 'Docked'); % DBG this helps reuse desktop space
    
    % Find axis dimensions and set them
    data_sum = sum(data(:));
    total_gap = 0.10 * data_sum;
    left_gap_size = total_gap / (size(data, 1)-1);
    right_gap_size = total_gap / (size(data, 2)-1);
    y_height = data_sum + total_gap;
    x_left = 0;
    x_right = 1;
    axis([x_left, x_right, 0, y_height]) % Set limits
    axis ij % origin is top left
    axis off
    
    % grid minor % DBG
    
    hold on
    patch([0 0 1 1], [0 y_height y_height 0], 'w');
    
    % Plot left categories - one per row
    left_category_sizes = sum(data, 2)';
    
    % These are the top points for each left category, 
    % with gaps added.
    left_category_points = [0 cumsum(left_category_sizes)] + ...
        (0:numel(left_category_sizes)) .* left_gap_size;
    left_category_points(end) = [];
    
    % plot left category bars
    plot(zeros(2, numel(left_category_points)), [left_category_points; (left_category_points + left_category_sizes)], 'k', 'LineWidth',4);
    
    % DBG plot left ticks
    %left_category_tick_starts = zeros(size(left_category_points)) - 0.01;
    %left_category_tick_ends = left_category_tick_starts + 0.02;
    %plot([left_category_tick_starts; left_category_tick_ends], ...
    %     [left_category_points; left_category_points], 'b-');
    
    % Plot right categories - one per column
    right_category_sizes = sum(data, 1);

    % These are the top points for each right category, 
    % with gaps added.
    right_category_points = [0 cumsum(right_category_sizes)] + ...
        (0:numel(right_category_sizes)) .* right_gap_size;
    right_category_points(end) = [];
    
    % plot right category bars
    plot(ones(2, numel(right_category_points)), [right_category_points; (right_category_points + right_category_sizes)], 'k', 'LineWidth',4);

    % DBG plot right ticks
    %right_category_tick_ends = ones(size(right_category_points)) + 0.01;
    %right_category_tick_starts = right_category_tick_ends - 0.02;
    %plot([right_category_tick_starts; right_category_tick_ends], ...
    %     [right_category_points; right_category_points], 'b-');
     
    %
    % Draw the patches, an entire left category at a time
    %
    
    % Color selection
    patch_colors = [ .5 .5 .5;
                      1  0  0;
                      0  1  0;
                      0  0  1;
                     .5 .5  0;
                      0 .5 .5;
                     .5  0 .5];
    num_colors = size(patch_colors, 1);

    right_columns_so_far = right_category_points(1:end); % Start at the beginning of each right category and stack as we go.
    patches_per_left_category = size(data, 2);
    color_h=ones(size(data, 1),3);
    for k_left = 1:size(data, 1) % for each row
        color = patch_colors(mod(k_left,num_colors)+1, :);
        color_h(k_left,:)=color; 
        %
        % Calculate the coordinates for all the patches split by the
        % current left category
        %
         
        % Split the left category
        left_patch_points = [0 cumsum(data(k_left, :))] + left_category_points(k_left);
        patch_top_lefts = left_patch_points(1:end-1);
        patch_bottom_lefts = left_patch_points(2:end);
         
        % Compute and stack up slice of each right category
        patch_top_rights = right_columns_so_far;
        patch_bottom_rights = patch_top_rights + data(k_left, :);
        right_columns_so_far = patch_bottom_rights;
         
        %
        % Plot the patches
        %
        
        % X coordinates of patch corners
        [bottom_curves_x, bottom_curves_y] = get_curves(0.1, patch_bottom_lefts, 0.9, patch_bottom_rights);
        [top_curves_x,    top_curves_y]    = get_curves(0.9, patch_top_rights,   0.1, patch_top_lefts);        
        X = [ ...
            repmat([0; 0], 1, patches_per_left_category); % Top left, bottom left
            bottom_curves_x;
            repmat([1; 1], 1, patches_per_left_category); % Bottom right, top right
            top_curves_x
            ];
        
         
        % Y coordinates of patch corners
        Y = [ ...
            patch_top_lefts; 
            patch_bottom_lefts; 
            bottom_curves_y;
            patch_bottom_rights; 
            patch_top_rights; 
            top_curves_y
            ];
         
        patch('XData', X, 'YData', Y, 'FaceColor', color, 'FaceAlpha', .8, 'EdgeColor', 'none');
    end % for each row
    
    % Place left labels
%     text(zeros(1, size(data, 1)) - 0.01, ...
%          left_category_points + left_category_sizes./2, ...
%          left_labels, 'FontSize', 12, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'Rotation', 80);
%      
    % Place right labels
    text(ones(1, size(data, 2)) + 0.06, ...
         right_category_points + right_category_sizes./2, ...
         right_labels, 'FontSize', 16, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', 'Rotation', 80);
    
    title(chart_title);
end % alluvialflow

function [x, y] = get_curves(x1, y1, x2, y2)
% x1, x2: scalar x coordinates of line start, end
% y1, y2: vectors of y coordinates of line start/ends
    Npoints = 15;
    t = linspace(0, pi, Npoints);
    c = (1-cos(t))./2; % Normalized curve
    
    Ncurves = numel(y1);
	% Starting R2016b, the following line could be written simply as:
    %   y = y1 + (y2 - y1) .* c';
    y = repmat(y1, Npoints, 1) + repmat(y2 - y1, Npoints,1) .* repmat(c', 1, Ncurves);
    x = repmat(linspace(x1, x2, Npoints)', 1, Ncurves);
end  % get_curve