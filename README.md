[![Build Status](https://travis-ci.org/SuperMayo/gonfig.svg?branch=master)](https://travis-ci.org/SuperMayo/config)
# R Config + Glue

The **gonfig** package makes it easy to manage project-wide configuration.

You can install the **gonfig** package from github as follow:

```r
library(devtools)
devtools::install_github("supermayo/gonfig")
```

## Usage

The usage is the same as [config](https://cran.r-project.org/web/packages/config/vignettes/introduction.html) except that it allows [glue](https://glue.tidyverse.org/) litterals.

For instance your config file could be:

***config.yml***
```yaml
default:
  year: 2000
  datafolder: "data"
  clean:
    input: "{datafolder}/data_{year}.csv"
    output: "{datafolder}/clean_{year}.csv"
  predict:
    input: "{clean$output}"
    output: "{datafolder}/forecast_{year+1}.csv"
```

Then you can load the configuratin as a list in R:

```r
config <- config::get()
config$clean$output
#> "data/data_2000.csv"
config$predict$input
#> "data/forecast_2001.csv"
```

You can load a sub-element from the configuration as follows:

```r
config <- config::get("predict")
config$input
#> "data/clean_2000.csv"
```


## See Also

Gonfig is pretty much just a wrapper around [config](https://cran.r-project.org/web/packages/config/vignettes/introduction.html) and [glue](https://glue.tidyverse.org/). So check their documentation for advanced usage.

## To Do
- [ ] Publish on CRAN.
- [ ] Maintain types.
- [ ] Allow recursive expressions.
