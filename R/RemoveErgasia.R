# ---
#
# clear the environment and import dependencies
#
# ---

rm(list = ls())
library(devtools)

# ---
# 
# remove functions
#
# ---

pkgName = "ergasia"

removeErgasia <- function() {
  required <- requireNamespace(pkgName, quietly = TRUE)
  print(paste(pkgName, required, sep = ": "))
  if (required) {
    remove.packages(pkgName)
  }
}

forceRemoveErgasia <- function() {
  tryCatch({
    devtools::unload(pkgName)
  }, error = function(e) {
    writeLines(paste0("COULD NOT UNLOAD PACKAGE: ", pkgName))
  })
  tryCatch({
    removeErgasia()
  }, error = function(e) {
    writeLines(paste0("COULD NOT REMOVE PACKAGE: ", pkgName))
  })
}

# ---
#
# run this to remove the ergasia package
#
# ---

forceRemoveErgasia()

# ---
#
# this should give an error
#
# ---

tryCatch({
    library(ergasia)
    stop("Library did not unload as expected.")
  }, error = function(e) {
    writeLines("Library did not load (this is expected).")
  }
)



