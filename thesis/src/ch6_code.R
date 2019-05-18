
## @knitr rocToy 

rand <- tibble(x = runif(4,0,0.02),
               y = runif(4,0,0.02))

toyRoc <- tibble(fallout = c(0.1,
                             0.3,
                             0.35,
                             0.8
                             ),
                 recall = c(0.75,
                            0.4,
                            0.85,
                            0.8
                             ),
                 label = c('a',
                           'b',
                           'c',
                           'd')) %>%

   mutate(fallout = fallout + rand$x,
          recall = recall + rand$y) %>%

   ggplot(aes(x = fallout, y = recall, label = label)) +
      geom_point(size = 10, color = 'forest green') +
      geom_text(color = 'white', size = 6) +
      geom_abline(intercept = 0, slope = 1) +
      scale_x_continuous(limits = c(0,1))+
      scale_y_continuous(limits = c(0,1)) +
      labs(x = 'Fallout', y = 'Recall')+
      theme(plot.margin = margin(0,5,0,0,unit = 'cm'))

toyRoc

## @knitr confMat

neg <- c('TN','FN')
pos <- c('FP','TP')
tot <- c('N','P')

data <- rbind(neg,pos,tot) %>% as.data.frame()

colnames(data) <- c('Actual N','Actual P')
rownames(data) <- c('Hypothesized N','Hypothesized P','Total')

xtable(data)
