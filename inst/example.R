library(readxl)

df_ex <- read_excel("extdata/example_figure_data.xlsx")
df_ex_2 <- read_excel("extdata/example_figure_data_2.xlsx")

dir.create("testdata", showWarnings=F, recursive=T)
save(df_ex, file="testdata/example.rda")
save(df_ex_2, file="testdata/example_2.rda")
