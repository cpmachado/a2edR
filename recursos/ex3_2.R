png("ex3_2.png")
idas <- read.csv("./dataset/idas.csv")$xi
tabela <- table(idas)
pie(
    tabela,
    main = "Gráfico circular de idas"
)
