### CRA Forms  

> A small web app widget of CRA Forms listed by number in a central directory where tax filers can identify the forms they need and download them conveniently (if applicable).  

#### Objective  

The goal of this widget is to provide **a single screen where users can interact with an app to download the filings as they complete them vs. navigating the CRA website**.  I defer to a time savings chart that has justified the time spent on the project vs. the time savings.  

![](https://imgs.xkcd.com/comics/is_it_worth_the_time.png)

#### Dependencies  

The following are the libraries needed to render the `form.Rmd` Shiny html:  

```{r}

#Data manipulation library
if(!require("dplyr")){
  install.packages("dplyr")
  require("dplyr")
}

#Datatable library
if(!require("DT")){
  install.packages("DT")
  require("DT")
}

#Shiny application library
if(!require("shiny")){
  install.packages("shiny")
  require("shiny")
}

#Shiny application library
if(!require("DiagrammeR")){
  install.packages("DiagrammeR")
  require("DiagrammeR")
}


```  

##### Session Reference - YMMV  

```{r}

## R version 3.6.3 (2020-02-29)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 10 x64 (build 19042)
## 
## Matrix products: default
## 
## locale:
## [1] LC_COLLATE=English_Canada.1252  LC_CTYPE=English_Canada.1252   
## [3] LC_MONETARY=English_Canada.1252 LC_NUMERIC=C                   
## [5] LC_TIME=English_Canada.1252    
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] DiagrammeR_1.0.6.1 DT_0.19            dplyr_1.0.6        shiny_1.7.0       
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_1.0.7         RColorBrewer_1.1-2 bslib_0.3.0        compiler_3.6.3    
##  [5] pillar_1.6.2       later_1.3.0        jquerylib_0.1.4    tools_3.6.3       
##  [9] digest_0.6.27      jsonlite_1.7.2     evaluate_0.14      lifecycle_1.0.0   
## [13] tibble_3.1.2       pkgconfig_2.0.3    rlang_0.4.11       rstudioapi_0.13   
## [17] cli_3.0.1          DBI_1.1.1          crosstalk_1.1.1    yaml_2.2.1        
## [21] xfun_0.26          fastmap_1.1.0      stringr_1.4.0      knitr_1.34        
## [25] htmlwidgets_1.5.4  generics_0.1.0     sass_0.4.0         vctrs_0.3.8       
## [29] tidyselect_1.1.1   glue_1.4.2         R6_2.5.1           fansi_0.5.0       
## [33] rmarkdown_2.11     purrr_0.3.4        magrittr_2.0.1     promises_1.2.0.1  
## [37] ellipsis_0.3.2     htmltools_0.5.2    assertthat_0.2.1   mime_0.11         
## [41] xtable_1.8-4       httpuv_1.6.3       utf8_1.2.2         stringi_1.7.5     
## [45] visNetwork_2.1.0   cachem_1.0.6       crayon_1.4.1

```


#### How to run locally  

1. Open in RStudio  
2. Knit the document (Ctrl+Shift+K)  

#### Deployed  

[See the link where the widget is deployed](misura.harryrosen.com/ev/cra-forms/)
