# As of 2021 September 16, this file is located in 
# C:\users\jbullock\OneDrive\config. A hardlink  
# connects the file to its R-default location, 
# c:\users\jbullock. It is sourced from that 
# location by Rgui, StatET, and RStudio. [2021 09 16]


# Things you might want to change

# options(papersize="a4")
# options(editor="notepad")
# options(pager="internal")

# set the default help type
# options(help_type="text")
  options(help_type="html")

options(radian.color_scheme = "manni")  # not loaded

# set a site library
# .Library.site <- 'C:/Users/jbullock/appdata/Local/R/site-library'

# set a CRAN mirror
# local({r <- getOption("repos")
#       r["CRAN"] <- "http://my.local.cran"
#       options(repos=r)})
local({ 
  r <- getOption("repos")
  r["CRAN"] <- "https://cloud.r-project.org"
  options(repos = r) 
})


# SET PACKAGE-CONFLICT POLICY
# It offers some additional protection against function-name 
# conflicts. See ?conflictRules and 
# https://developer.r-project.org/Blog/public/2019/03/19/managing-search-path-conflicts/.
# [2020 06 26]
#
# The policy below is like options(conflicts.policy = "depends.ok"), except that it 
# adds, to "can.mask", the packages after "stats". The "mask.ok" argument means "it's 
# OK for this package's command to mask objects that are already on the search path."
# [2020 06 27, 2021 12 01]
options(conflicts.policy = list(
  error = TRUE,
  generics.ok = TRUE,
  can.mask = c("base", "methods", "utils", "grDevices", "graphics", "stats", "Hmisc", "Matrix"),
  depends.ok = TRUE))
conflictRules(
  pkg     = "dplyr",
  mask.ok = c("collapse", "combine", "filter", "lag", "intersect", "setdiff", "setequal", "union"))
conflictRules(
  pkg     = "RCurl",
  mask.ok = c("pop", "push"))
conflictRules(
  pkg     = "rstan",
  mask.ok = c("extract"))
conflictRules(
  pkg     = "tidyr",
  mask.ok = c("complete"))


# Don't let the following commands mask or conflict with the corresponding 
# tidyverse commands.  [2020 06 27]
conflictRules("arm",        exclude = "rescale")   
conflictRules("car",        exclude = "recode")                                  # use Recode() instead
conflictRules("gridExtra",  exclude = "combine")   
conflictRules("glue",       exclude = "collapse")  
conflictRules("Hmisc",      exclude = c("deff", "src", "subplot", "summarize"))  # exclude subplot b/c we want plotly::subplot
conflictRules("jsonlite",   exclude = "flatten")                                 # we'll more often want purrr::flatten
conflictRules("kableExtra", exclude = "group_rows")                              # use the pack_rows() alias instead
conflictRules("magrittr",   exclude = c("set_names", "extract"))
conflictRules("MASS",       exclude = "select")    
conflictRules("Matrix",     exclude = c("expand", "pack", "unpack"))
conflictRules("purrr",      exclude = "is_null")                                 # interferes with testthat::test_dir
conflictRules("scales",     exclude = c("discard", "col_factor", "rescale"))      
conflictRules("testthat",   exclude = c("equals", "is_less_than", "matches", "not", "test_file"))  # we'll get test_file() from dplyr and devtools


# FORMATTING OPTIONS
options(width = 210)  # for big monitors
  # Although this file is sourced by RGui at startup, 
  # options("width") is 80. In RStudio and StatET, I
  # don't have that problem.
  #   The problem with RGui is probably due to the 
  # options(width = XXX) command here being 
  # overwritten by the "columns" line in 
  # C:\Program Files\Microsoft\R Open\R-3.5.1\etc\Rconsole.
  # If that is the problem, I can solve it by 
  # copying Rconsole to my home directory and
  # changing the columns line to specify 155
  # columns.  [2020�01�16]
  #   See https://rdrr.io/r/utils/Rconsole.html
  # for details.  [2020�01�16]
options(digits = 3)
options(max.print = 1000)          # Never print more than 1000 values to the screen
options(scipen = 4)                # two-character bias against scientific notation
options(todor_patterns = "TO DO")  # For the todor package / RStudio add-in



# GET HELP WORKING WITHIN StatET
# Per 2018-11-19 email from Stephan Wahlbrink. But not needed or useful for StatET 4.02.
# registerS3method("print", "help_files_with_topic", rj::print.help_files_with_topic)


# MY COMPUTER IDENTITIES [2017 01 21]
# Start the variable names with a period so that rm(list=ls())
# doesn't wipe the variables out.  [2013 06 02]
# .PRECISION.T3600  <- Sys.info()['nodename']=='PS-GKHQ8V1'
.THINKPAD.X1 <- Sys.info()['nodename']=='JOHNTHINKPADX1'



# ELIMINATE THE "SAVE WORKSPACE IMAGE" QUESTION ON EXIT [2013 05 17]
# Set hook to be run when Defaults is attached
# setHook(
#   packageEvent("Defaults", "attach"),
#   function(...) { 
#     setDefaults(q, save="no")
#     useDefaults(q) 
#   }
# )
# Add Defaults to the default packages loaded on startup
# old <- getOption("defaultPackages");
# options(defaultPackages = c(old, "Defaults"))


# ADD AN ERROR-CHECKING OPTION
# If I assign a value to a list in a slot that the list doesn't 
# have, the slot will be added -- but with this option, a 
# warning message is also printed to the screen.
# options(check.bounds = TRUE)


# ADD CHECKING FOR PARALLEL CORES
# Recommended in a message that I get when I load rstan. rstan is slow
# by default; perhaps this will help.  [2020 08 17]
options(mc.cores = parallel::detectCores())
