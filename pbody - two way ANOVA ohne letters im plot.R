rm(list = ls())

library(agricolae)
library(dplyr)
library(readxl)
library(multcompView)
library(ggplot2)
library(tidyverse)

dat <- read_excel("C:/Users/nickz/Desktop/Thesis/Master Data/Master Thesis/Pbody localization/overlap all reps.xlsx")

#Two-Way ANOVA code + plot, check console for information

mod <- aov(PbodyCount ~ Treatment*SampleName, data = dat)
Tukey <- TukeyHSD(mod, which = "Treatment:SampleName")
HSD.test(mod, trt = c("Treatment", "SampleName"), console = TRUE)

ggplot(dat) +
  aes(x = SampleName, y = PbodyCount, fill = Treatment) + 
  geom_boxplot() +
  theme_minimal() +
  labs(x = "P-body component/Protein", y = "P-body Count")
  #geom_text(data = Tk, aes(x = Treatment, y = quant, label = label),
            #vjust = -1, hjust = -1, size = 5)

  
  #facet_wrap(~SampleName, scale="free") #this makes many small images into a big one, 
#this creates a direct comparison between hepes and tradebut the scales are all different
  