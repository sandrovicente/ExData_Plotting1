#
# CourseWork 
#
# DATA Loading Step
#

# Location where to get data and the estimated amount to read

DATA.FILE <- "C:\\tmp\\data\\household_power_consumption.txt"
DATA.ROWS <- 2075260 # obtained from wc -l

# Load data using proper types, specified range of dates, and stores it on the parent environment 'DATA' variable
loader <- function(file, size) {

  # Determine classes 
  sample <- read.table(file, nrows = 100, comment.char="", sep=";", header=T)
  classes.sample <- sapply(sample, class)
  
  # read all data
  data.raw <- read.table(file, nrows = size, comment.char="", sep=";", colClasses=classes.sample, header=T, na.strings="?")
  
  # trim data refering to the desired period and store it in the parent environment 
  DATA <<- data.raw[data.raw$Date == "2/2/2007" | data.raw$Date == "2/1/2007",]
  
  # proceed with time/date conversions
  # create a timetamp column containing both date and time in POSIX format
  DATA$datetime <<- strptime(paste(DATA[,1],DATA[,2]), "%m/%d/%Y %H:%M:%S")
}

# Main loader: checks if data has already been loaded.
# Loading everything is very time consuming
# Therefore if the 'DATA' variable already exists and is reasonably consistent, uses the existing one
# Otherwise loads and select data using the loader function

if (exists("DATA") && dim(DATA)[1] >= 2880 && dim(DATA)[2] >= 10) { 
  message("Data exists: Using cached")
} else {
  message("Loading all data")
  loader(DATA.FILE, DATA.ROWS)
}
