require(tidyverse)

df <- tibble(commands)

df <- df %>%
  mutate(distance = stringr::str_extract(commands, "[0-9]+"),
         movement = stringr::str_extract(commands, "[a-z]+"),
         value = ifelse(movement %in% c("up"), -1 * as.numeric(distance), as.numeric(distance)),
         type = ifelse(movement %in% c("forward"), "horizontal", "vertical")) 
  group_by(type) %>%
  summarise(n = n(),
            position = sum(value, na.rm = TRUE))

df %>%
  mutate(aim = 0)
