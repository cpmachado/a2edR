png("./ex4_2d.png")
data <- read.csv("./dataset/4_2.csv")
barplot(
  t(as.matrix(data$ni)),
  names.arg = as.character(data$xi),
  ylab = "Nº de Colaboradores",
  xlab = "Salários",
  main = "Distribuição de salários por colaboradores",
  ylim = c(0, 14)
)
