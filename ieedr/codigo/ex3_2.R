png(file.path("imagem", "ieedr", "ex3_2.png"))
idas <- read.csv(file.path("dataset", "ieedr", "idas.csv"))
pie(
  table(idas$xi),
  main = "Distribuição de pessoas por idas ao supermercado"
)
