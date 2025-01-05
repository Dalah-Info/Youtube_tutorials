# تثبيت ggplot2
install.packages("ggplot2")
library(ggplot2)

# البيانات
airquality

# 1.Scatter Plot
ggplot(airquality, aes(x= Temp, y= Ozone)) +
  geom_point(color = "blue", size= 3) +
  coord_cartesian(xlim = c(60, 100), ylim = c(0,150)) +
  theme_minimal() +
  labs (
    title = "Relationship Between Temperature and Ozone Levels",
    x = "Temperature (F)",
    y = "Ozone (ppb)"
  )

# 2.Line Plot
ggplot(airquality, aes(x = Day, y = Ozone, group = Month, color = factor(Month))) +
  geom_line(linewidth = 1) +
  coord_cartesian(ylim = c(0,150)) +
  theme_classic() +
  labs(
    title = " Ozone Levels Over Days for Each Month",
    x = "Day of the Month",
    y = "Ozone (ppb)",
    color = "Month"
  )

# 3.Bar Plot
ggplot(airquality, aes(x = factor(Month))) +
  geom_bar(fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(title = "Number of Days Recorded per Month",
       x = "Month",
       y = "Number of Days")
































  

