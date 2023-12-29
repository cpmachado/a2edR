png(file.path("imagem", "ex3_2.png"))
idas <- read.csv(file.path("dataset", "idas.csv"))
pie(
  table(idas$xi),
  main = "Distribuição de pessoas por idas ao supermercado"
)
