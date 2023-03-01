# Soil and vegetation water content identify main terrestrial ecosystem changes

# Abstract

Environmental change is a consequence of many interrelated factors. How vegetation responds to natural and human activity is yet not well established, quantified, and understood. Recent satellite missions providing hydrologic and ecological indicators enable better monitoring of Earth system changes, yet there is no automatic way to address this issue directly from observations. Here, we develop an observation-based methodology to capture evidence of changes in global terrestrial ecosystems and attribute these changes to natural or anthropogenic activity. We use \blue{the longest time record of} global microwave L-band soil moisture (SM) and vegetation optical depth (VOD) as satellite data and build spatially-explicit maps of change in soil and vegetation water content and biomass reflecting large ecosystem changes during the last decade, 2010-2020. Regions of prominent trends (from -8% to 9% per year) are observed, especially in humid and semi-arid climates. We further combine such trends with land cover change maps, vegetation greenness, and precipitation variability to assess their relationship with major documented ecosystem changes. Several regions emerge from our results. They cluster changes according to human activity drivers, including deforestation (Amazon, Central Africa) and wildfires (East Australia), artificial reforestation (South-East China), abandonment of farm fields (Central Russia), and climate shifts related to changes in precipitation variability (East Africa, North America, and Central Argentina). Using the high sensitivity of soil and vegetation water content to ecosystem changes, microwave satellite observations enable us to quantify and attribute global vegetation responses to climate or anthropogenic activities, as a direct measure of environmental changes and the mechanisms driving them.

# Results

![image](smvodtrends.png)
Top: The five identified clusters of SM and VOD trends globally, with their semantic attribution. Bottom: identified clusters represented in bivariate spaces between (left) trends of SM and VOD, (middle) trends in SM and mean annual SM, and (right) trends of VOD and mean annual VOD. Each cluster emerges as an independent group from the joint SM and VOD trend space (bottom-left): clusters A and D show a positive change in both SM and VOD, clusters B and E show negative SM and VOD changes -more pronounced in E-, cluster C shows a negative SM change and a positive VOD change. Estimated joint and marginal distributions for SM and VOD highlight the distinct monotonic trends of soil and vegetation water content in each cluster. The relation between the relative trend in VOD to its annual mean (right) shows how regions with low VOD levels on average are more sensitive to VOD changes. Using the SM trends alone (middle) allow us identifying all clusters but C, which is an exception due to artificial reforestation and the induced need for groundwater. Clusters A and D only become separable using the trends in VOD and rainfall, which are more pronounced in D. 

# Data and code availability

Data are available in zenodo (DOI:10.5281/zenodo.7660170). All the analyses were performed in MATLAB and code snippets are provided here [SM-VOD-Trends](https://github.com/IPL-UV/SM-VOD-Trends) for reproducibility. Code is structured in four folders: "SM_VOD_trend_significance_extraction", "sensitivity_analysis_code", "land_cover_change_code" and "main_figures_code". 

a)SM_VOD_trend_significance_extraction: contains the code to extract the main clusters using the Mann-Kendall test

b)sensitivity_analysis_code:
	- sensitivity_extraction.m --> Extract the files "NA_sens.mat" with the estimated slop by subcluster, variable (sm, vod, ndvi, prec), pixel, and month (nº de pixels x 12). 
	          In Prec slop is estimated using the cumulative rain by month. Inside each variable there is a "s" y "r", being "s" the estimated change per year and "r" the estimated square R.
	- pixel_mean_extraction.m -->  Extract the files   "NA_mean.mat" with mean value my subcluster, variable (sm, vod, ndvi, prec), pixel and month (nº de pixels x 12).
		  In Prec mean value is estimated using the cumulated rain by month.

c)land_cover_change_code:  
	- Picture "cluster_map_definition.png" describes the location of each cluster and sub-cluster.
	- Archives with .mat extension (AM_lcc.mat, AR_lcc.mat...) contain the land cover in the year 2011 and 2019 and the area for each cluster as a struct file: subcluster data is called (c1,c2,c3... see "cluster_map_definition.png"). Each subcluster contains: lcc_2011 (nº pixels x 1; Land cover in 2011) lcc_2019 (nº pixels x 1; Land cover in 2019) and area (nº pixels x 1; calculated area per pixel).
	- Area_land_cover.m --> extracts el area de cada region
 	- Land_cover_change.m --> Plots alluvial(flow) + LC map from 2011 and 2019 per cluster
	- LCC_cluster_extraction.m --> extracts LCC files per cluster (example: AM.mat --> AM_lcc.mat)
	- Calculo de land_cover_change usando los datos de Alvaro. Cada Cluster (ejemplo: AM.mat) tiene asociado un archivo output (ejemplo: AM_lcc.mat) tipo struct con la información de cada subcluster(c1, c2,c3...).

d)main_figures_code:
	- Code to generate the main figures of the paper. 


# How to cite our work

If you find this useful, consider citing our work:

><b>Soil and vegetation water content identify main terrestrial ecosystem changes</b>
Diego Bueso, Maria Piles, Philippe Ciais, Jean-Pierre Wigneron, Álvaro Moreno-Martínez and Gustau Camps-Valls
Natl Sci Rev, 2023

```
@article {Camps-Vallseabc7447,
  author = {Bueso, D. and Piles, M. and Ciais, P. and Wigneron, JP. and Moreno-Martinez, A. and Camps-Valls, G.},
  title = {Soil and vegetation water content identify main terrestrial ecosystem changes},
  volume = {},
  number = {},
  year = {2023},
  doi = {},
  publisher = {},
  URL = {},
  journal = {}
}
```
# Acknowledgements
MP was supported by the project LEAVES under grant RTI2018-096765-A-100 funded by MCIN/AEI/10.13039/501100011033 and by the European Regional Development Fund (ERDF, EU). GCV was supported by the European Research Council (ERC) Synergy Grant “Understanding and Modelling the Earth System with Machine Learning (USMILE)” under the Horizon 2020 research and innovation programme (Grant agreement No. 855187). The authors thank Miguel Mahecha from University of Leipzig for helpful comments. 
