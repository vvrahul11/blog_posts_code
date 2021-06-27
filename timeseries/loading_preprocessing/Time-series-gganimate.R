# Ref: https://github.com/JoachimGoedhart/Animate-Labeled-TimeSeries
#Animate time-series data - based on: https://github.com/thomasp85/gganimate/wiki/Temperature-time-series
#Takes a CSV in wide format with Time in the first column

require(tidyr)
require(ggplot2)
require(ggrepel)
require(gganimate)

#Read the data from a CSV file into a dataframe
df1 <-  read.csv("C:/RahulGit/anomaly_detection_fbprophet_matrixprofile/data/mpf-datasets-master/real/mfcc_vanilla_ice.csv")
df1$Time = 1:nrow(df1)
df1 <- df1[, c(2, 1)]
colnames(df1) = c("Time", "Value")

#Convert from long format to tidy format
#The conversion assumes that the first column is the Time data and remaining columns the measured Value of different Objects
df_tidy <- gather(df1, Object, Value,-Time)

#Define the aesthetics for the plot; x=Time, y=Value and each object is grouped and given a unique color
p1 <- ggplot(df_tidy, aes(Time, Value, group = Object, color = Object)) + 
  geom_line(size=1, color='darkblue') + 
  
  #Show a dot for the new datapoint that is added in a new frame (works well in the animation)
  geom_point(size = 2, color='darkblue') + 
  
  #Add labels, geom_label_repel from the ggrepel package is used to avoid overlap between the labels
  geom_label_repel(aes(x = Time, y=Value, label = Object, fill = Object), hjust = 0, direction    = "y", nudge_x = 20,
                   fontface = 'bold',
                   color = 'white', size=6,
                   segment.color = 'grey50',
                   segment.size = 0.5) +
  
  #This is where the magic happens       
  transition_reveal(Time) + 

  #Formatting of the figure layout  
#  coord_cartesian(xlim=c(0,290),clip = 'off') + 
  theme(plot.margin = margin(10, 40, 10, 10)) +
  theme_light(base_size = 30) +

  #Remove Legend
  theme(legend.position="none") +
  view_follow(fixed_y = TRUE)

animate(p1, nframes = 10, fps = 1)
anim_save("mfcc_vanila.gif", p1)
