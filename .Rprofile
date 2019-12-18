local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cloud.r-project.org/"
  options(repos = r)
})

.is_daytime <- function() {
    curr_time <- Sys.time()
    after_7 <- strptime("07:00", "%H:%M") < curr_time
    before_6 <- strptime("18:00", "%H:%M") > curr_time

    after_7 & before_6
}

# If it's daytime set a light colorscheme for R console else go with 
# the default dark one
if (.is_daytime()) {
    colorout::setOutputColors(
        normal=12, negnum=13, zero=6, number=4, date=9, string=4, const=1,
        false=9, true=6, infinite=5, index=3, stderror=5, warn=c(1, 16, 1),
        error=c(7, 16, 1), verbose = FALSE
    )
} else {
    colorout::setOutputColors(
        normal=40, negnum=209, zero=226, number=214, date=179, string=85,
        const=35, false=203, true=78, infinite=39, index=30, stderror=213,
        warn=c(1, 16, 196), error=c(160, 231), verbose = FALSE
    )
}

