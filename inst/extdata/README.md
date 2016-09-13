<!-- README.md is generated from README.Rmd. Please edit that file -->
TUIK raw data generation steps
==============================

This document describes the steps necessary to retrieve data that is cleaned up using this package. Raw data resides in the same folder with this document.

All steps start with entering [TUIK](http://www.turkstat.gov.tr/) and entering the menu [Statistics by theme](http://www.turkstat.gov.tr/UstMenu.do?metod=kategorist)

`town_population.csv`
---------------------

This is the population data of Turkey per each town in each city.

Later steps:

1.  Population and Demography
2.  Address Based Population Registration System
3.  Statistical Tables and Dynamic Search
4.  Dynamic Search
5.  Address Based Population Registration System Results (M)
6.  Variables:
    -   Measurements: Population Of SRE-1, SRE-2, Provinces and Districts
    -   Dimensions: Village/City (Select City)

7.  Click `Add Measurements`
8.  Period: Annual (Select last available year)
9.  Region: Subprovince Level (Select all provinces of all cities, takes time)
10. Generate report
11. Format:
    -   Rows: Region, Year (order is important)
    -   Column: Dimension, Month, Period, Measurment (in order) 12: Update and download as CSV.

Format of the rows are `City(Town) | Year | Population`

[Link to step 5](https://biruni.tuik.gov.tr/medas/?kn=73&locale=en)

`town_sales/`
-------------

This data is town housing sales in Turkey. These sales include both first hand and second hand sales.

Later steps:

1.  Construction and housing
2.  House sales statistics
3.  Statistical Tables and Dynamic Search
4.  Dynamic Search
5.  House sales statistics (M)
6.  Variables:
    -   Measurements: House sale statistics in district
    -   Dimensions: (Empty)

7.  Click add measurements
8.  Period is monthly, select months of only one year. Generate the data per year because doing it for multiple years result in a gateway error on the website. So for each year, create a `year.csv` file under the folder.
9.  Region level is subprovince level. Select all. (takes time)
10. Generate report
11. Format:
    -   Row: Region, Year, Month (in order)
    -   Column: Period, Dimension, Measurement (in order)

12. Update and download as CSV.

[Link to step 5](https://biruni.tuik.gov.tr/medas/?kn=73&locale=en)

`city_sales/`
-------------

This data is city housing sales in Turkey. Difference from `town_sales` data is that there is a category for each city stating whether the sales was first hand or second hand. This is an important distinction. Also the date range of data is wider.

Later steps:

1.  Construction and housing
2.  House sales statistics
3.  Statistical Tables and Dynamic Search
4.  Dynamic Search
5.  House sales statistics (M)
6.  Variables:
    -   Measurement: House sale statistics
    -   Dimensions: Sale State (Select all)

7.  Click add measurements
8.  Period is monthly, select months of only one year. Generate the data per year because doing it for multiple years result in a gateway error on the website. So for each year, create a `year.csv` file under the folder.
9.  Region level is NUTS3. Select all cities.
10. Generate report.
11. Format:
    -   Row: Region, Dimension, Year, Month (in order)
    -   Column: Period, Measurement (in order)

12. Update and download as CSV.

[Link to step 5](https://biruni.tuik.gov.tr/medas/?kn=73&locale=en)
