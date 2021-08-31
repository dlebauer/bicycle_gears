# https://davidrroberts.wordpress.com/2016/04/06/cycling-gear-ratio-calculator-for-r-or-why-you-should-just-go-buy-a-sram-eagle-1x12-group-right-now/

# Function to generate standard cassette spreads
# Requires the file "data/cassettekey.csv" file
#' Title
#'
#' @param brand 
#' @param speeds 
#' @param small 
#' @param large 
#'
#' @return
#' @export
#'
#' @examples
#' # SRAM Eagle
#' getCogs(brand = "SRAM", speeds = 12, small = 10, large = 50)
#' # Campy 13-speed road
#' getCogs("Campy", 13, 9, 42)
#' # Shimano 13-speed (nope!)
#' getCogs("shimano", 13, 10, 51)
getCogs <- function(brand, speeds, small, large){
  # brand (character, not case sensitive) = one of "Shimano", "SRAM", "SunRace", "Campagnolo", or "Campy"
  # speeds (numeric) = number of speeds
  # small (numeric) = size of the smallest cog
  # large (numeric) = size of the largest cog
  output <- c()
  if(brand=="Campy"|brand=="campy"){brand <- "Campagnolo"}
  cogs <- cassetteKey %>% 
    filter(Manufact == tolower(brand) & 
             NSpeeds == speeds & 
             SmallCog == small & 
             LargeCog == large) %>% 
    select(-Manufact:-LargeCog)
  output <- as.numeric(c(output, cogs[!is.na(cogs)]))
  if(length(output)==0){
    print("No matching cassettes found. Sorry.")
  } else {
    print(output)
  }
}

# Function to calculate wheel size
#' Title
#'
#' @param rimSize 
#' @param tireSize 
#' @param tireUnits 
#'
#' @return
#' @export
#'
#' @examples
#' # For a typical 26" mountain bike setup with 2.1 tires
#' wheelSize(rimSize = 559, tireSize = 2.1, tireUnits = "inches")
#' # For a typical 700c road setup with 23c tires
#' wheelSize(622, 23, "mm")
wheelSize <- function(rimSize, tireSize, tireUnits){
  # rimSize   (numeric) = ISO rim size, see wheelKey table or measure in mm
  # tireSize  (numeric) = size of the tire
  # tireUnits (character) = units of tireSize, either "inches" or "mm"
  tireSize <- ifelse(tolower(tireUnits) == "inches", 
                     tireSize * 25.4, 
                     tireSize)
  diam <- rimSize + tireSize*2
  round(pi * diam)
}

# Function to generate gear ratio tables
#' Title
#'
#' @param chainrings 
#' @param cogs 
#' @param wheelCirc 
#'
#' @return
#' @export
#'
#' @examples
#' # Example for a typical road setup
#' # Standard 53-39 front
#' myRings <- c(39, 53)
#' 
#' # 11-speed 12-28 on the rear
#' myCogs <- getCogs("Shimano", 11, 12, 28)
#' 
#' # Running 700x23c
#' myWheel <- wheelSize(622, 23, "mm")
#' getGears(myRings, myCogs, myWheel)
getGears <- function(chainrings, cogs, wheelCirc){
  # chainrings (integer) = teeth count of front chainring(s); may be a vector
  # cogs (integer) = teeth count of rear cog(s); may be a vector
  # wheelCirc (integer) = circumference of the drive wheel in mm
  # crankLength (integer) = length of the crank arms
  for(i in chainrings){
    if(i==chainrings[1]){output <- list()}
    geartab <- tibble(chainring = i, cog = cogs)
    geartab$gearRatio   <- round(i / geartab$cog, 2)
    geartab$gearInches  <- round(geartab$gearRatio * wheelCirc / pi / 25.4, 2)
    geartab$develMetres <- round(geartab$gearRatio * wheelCirc / 1000, 2)
    geartab$KPH.50RPM   <- ((geartab$develMetres / 1000) *50) *60
    geartab$KPH.100RPM  <- ((geartab$develMetres / 1000) *100) *60
    output[[paste0(i, "T")]] <- geartab
  }
  output
}
