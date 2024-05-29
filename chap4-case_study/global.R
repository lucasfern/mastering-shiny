library(shiny)
library(vroom)
library(tidyverse)

# path <- "mastering-shiny/chap4-case_study/neiss"
# 
# dir.create(path)
# 
# download <- function(name) {
#   url <- "https://github.com/hadley/mastering-shiny/raw/main/neiss/"
#   download.file(paste0(url, name), paste0(path, "/", name), quiet = TRUE)
# }
# 
# download("injuries.tsv.gz")
# download("population.tsv")
# download("products.tsv")

injuries <- vroom("neiss/injuries.tsv.gz", show_col_types = FALSE)

injuries

products <- vroom("neiss/products.tsv", show_col_types = FALSE)

products

population <- vroom("neiss/population.tsv", show_col_types = FALSE)

population

# population |> 
#   mutate(population = ifelse(sex == "female", -population, population)) |> 
#   ggplot(aes(x = age, y = population, fill = sex)) +
#   geom_col() +
#   coord_flip()

selected <- injuries |> filter(prod_code == 649)

selected |> count(location, wt = weight, sort = TRUE)

selected |> count(body_part, wt = weight, sort = TRUE)

selected |> count(diag, wt = weight, sort = TRUE)

summary <- selected |> count(age, sex, wt = weight)

summary |> 
  ggplot(aes(x = age, y = n, color = sex)) +
  geom_line() + 
  labs(y = "Estimated number of injuries")

summary <- selected |> 
  count(age, sex, wt = weight) |> 
  left_join(population, by = c("age", "sex")) |> 
  mutate(rate = n / population * 1e4)

summary |> 
  ggplot(aes(x = age, y = rate, color = sex)) +
  geom_line(na.rm = TRUE) +
  labs(y = "Injuries per 10,000 people")

selected |> 
  sample_n(10) |> 
  pull(narrative)

prod_codes <- setNames(products$prod_code, products$title)

selected |> 
  mutate(diag = fct_lump_n(fct_infreq(diag), n = 5)) |> 
  count(diag, wt = weight, sort = TRUE)

selected |> 
  mutate(diag = fct_lump(fct_infreq(diag), n = 5)) |> 
  group_by(diag) |> 
  summarise(n = as.integer(sum(weight)))

selected |> 
  mutate(diag = fct_lump(fct_infreq(diag), n = 5)) |> 
  group_by(diag) |> 
  summarise(n = n())

selected |> 
  group_by(diag) |> 
  summarise(n = n(), weighted_freq = as.integer(sum(weight))) |> 
  arrange(desc(weighted_freq))


fct_infreq(selected$diag, ordered = TRUE)

count_top <- function(df, var, n = 5) {
  df |> 
    mutate({{ var }} := fct_lump_n(fct_infreq({{ var }}), n = n)) |> 
    group_by({{ var }}) |> 
    summarise(n = n(), weighted_n = as.integer(sum(weight))) |> 
    arrange({{ var }})
}

