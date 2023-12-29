df <- read.csv(file.path("dataset", "4_4.csv"))

# Exercício 4.4 a
png(file.path("imagem", "ex4_4a.png"))
barplot(
  df$taxa,
  names.arg = df$pais,
  ylab = "Taxa de inflacção",
  xlab = "País",
  main = "Taxa de inflacção por país",
  ylim = c(0, 2.5),
  space = 0,
  xaxs = "i",
  yaxs = "i"
)

# Exercício 4.4 b
png(file.path("imagem", "ex4_4b.png"))
pie(
  df$taxa,
  labels = df$pais,
  main = "Taxa de inflacção por país"
)

# Exercício 4.4 c
print(mean(df$taxa))
