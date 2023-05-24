# Intro to GGPLOT2
# Eddie Ekpoh
# 2023-05-23
# edidionguekpoh@arizona.edu

# (Ctrl + Shift + R)
# Libraries ---------------------------------------------------------------
install.packages("ggplot2")
install.packages("tidyr")
install.packages("dplyr")
install.packages("gapminder")
library(ggplot2)
library(tidyr)
library(dplyr)
library(gapminder)
#library(emoGG)


# Making visualizations --------------------------------------------------
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(alpha = 0.5, col = "lightblue") +
  #geom_emoji(emoji = "")
  scale_x_log10() + 
  geom_smooth(method = "lm", linewidth = 3, col = "darkblue") 

ggplot(gapminder, aes(x = year, y = lifeExp, col = continent)) + 
  geom_point() 

# Categorical (year)
ggplot(gapminder, aes(x = year, y = lifeExp,  group = country)) + 
  geom_point() +
  geom_line(aes(color = continent)) 

gapminder <- gapminder

# Visualize Americas only
# unique(gapminder$continent)
americas <- gapminder %>% #ctrl + shift + m 
  filter(continent == "Americas")

# Plot Americas
ggplot(americas, aes(x = year, y = lifeExp, group = country)) +
  geom_line(col = "blue") + 
  facet_wrap(~country) + 
  labs(x = "Year",
       y = "Life Expectancy",
       title = "Life Expectancy By Year")


