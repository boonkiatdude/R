library(dplyr)
library(tidyverse)
library(ggplot2)
order_brush_order.df <- read.csv("Desktop\data\\\order_brush_order.csv", header=TRUE)


order.df <- order_brush_order.df
userid_count <- order.df %>%
  group_by(userid) %>%
  summarise(
    count = n()
  )
userid_count <- userid_count %>%
  filter(count >= 5)
sus_orders.df <- order_brush_order.df[order_brush_order.df$userid %in% userid_count$userid, ]
test.df <- sus_orders.df %>%
  filter(userid %in% c(22184, 10322, 23231)) %>%
  arrange(userid, shopid)
