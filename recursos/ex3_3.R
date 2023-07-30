irmaos <- read.csv("./dataset/irmaos.csv")$xi
media <- mean(irmaos)
desvio <- sd(irmaos)

print(paste0("media = ", media))
print(paste0("desvio = ", desvio))
print(paste0("desvio / media = ", desvio / media))

# Gráfico
png("ex3_3.png")
barplot(
    table(irmaos),
    xlab = "Nº de irmãos",
    main = "Nº de irmãos por pessoa",
    ylim = c(0, 20),
	space = 0
)

# index zero, temos de ajustar as linhas guia
abline(NULL, v = ceiling(media - desvio), col = "red")
abline(NULL, v = floor(media + desvio) + 1, col = "red")
