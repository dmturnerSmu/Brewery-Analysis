setwd('./Analysis/Data')
getwd()

bears_data=read.csv('Beers.csv',  header = TRUE)

breweries_data=read.csv('Breweries.csv' , header = TRUE)

brew_count_by_state_data=aggregate(breweries_data$Brew_ID ~ breweries_data$State , breweries_data, length)

# summary(breweries_data$State) will also return number breweries per state 

merged_data= merge(bears_data, breweries_data, by.x='Brewery_id', by.y='Brew_ID' ,
                   all = TRUE, suffixes = c('_bear','_brewery'))

head(merged_data, 6)

tail(merged_data, 6)

for (name in names(merged_data)){
  print(cat("number of NA for ", name ,"::",  sum(is.na(merged_data[name])))
)
  
state_with_max_ABV <- merged_data[merged_data$ABV==max(merged_data$ABV,na.rm=TRUE) & ! is.na(merged_data$ABV),]$State

state_with_max_IBU <- merged_data[merged_data$IBU==max(merged_data$IBU,na.rm=TRUE) & ! is.na(merged_data$IBU),]$State

summary(merged_data$ABV)

scatter.smooth(merged_data$ABV,merged_data$IBU )

# we can plot the plot more fanciful 






  
  
}



