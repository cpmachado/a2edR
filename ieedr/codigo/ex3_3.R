xi <- read.csv(file.path("dataset", "ieedr", "irmaos.csv"))$x
df <- data.frame(media = mean(xi), desvio = sd(xi))
df <- transform(
  df,
  xmin = ceiling(media - desvio),
  xmax = floor(media + desvio)
)
print(df)

png(file.path("imagem", "ieedr", "ex3_3.png"))
barplot(
  table(xi),
  xlab = "Nº de irmãos",
  main = "Nº de irmãos por pessoa",
  ylim = c(0, 20),
  space = 0,
  yaxs = "i",
  xaxs = "i"
)
abline(NULL, v = df$xmin, col = "red")
abline(NULL, v = df$xmax + 1, col = "red")
