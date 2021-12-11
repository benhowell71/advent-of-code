require(tidyverse)
require(zoo)

# Part1
df <- tibble(df)

df <-  df %>%
  rename("current_depth" = "df") %>%
  mutate(prev_depth = lag(current_depth),
         bigger_than_prev = ifelse(current_depth > prev_depth, 1, 0))

answer <- sum(df$bigger_than_prev, na.rm = TRUE)

# Part 2

df <- df %>%
  mutate(next_one = lead(current_depth),
         next_two = lead(current_depth, 2),
         total_window = current_depth + next_one + next_two,
         prev_window = lag(total_window),
         bigger_than_prev_window = ifelse(total_window > prev_window, 1, 0))
  # mutate(rolling = rollsum(current_depth, 3, align = "left"))

answer_two <- sum(df$bigger_than_prev_window, na.rm = TRUE)
