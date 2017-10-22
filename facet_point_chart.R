library(plyr)
library(gcookbook)
library(ggplot2)

tophit25 <- tophitters2001[1:25,]


nameorder <- tophit25$name[order(tophit25$lg, tophit25$name)]
tophit25$name <- factor(tophit25$name, levels = nameorder)
plot <- ggplot(tophit25, aes(x=avg,y=name))+
  geom_segment(aes(yend=name), xend=0,color='grey50')+
  geom_point(size=3, aes(color=lg)) + 
  scale_color_brewer(palette = 'Set1', limits=c('NL','AL'))+
  theme_bw()+ 
  theme(panel.grid.major.y = element_blank())+ 
  facet_grid(lg~., scales = 'free_y', space = 'free_y')
print(plot)