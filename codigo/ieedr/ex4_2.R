df <- read.csv(file.path("dataset", "ieedr", "4_2.csv"), head = TRUE)
df <- transform(df, xi = as.numeric(xi))

# Exercício 4.2 a
n <- sum(df$ni)
print(paste0("N: ", n))

# Exercício 4.2 b
df <- transform(df, Ni = cumsum(ni), fi = prop.table(ni))
df <- transform(df, Fi = cumsum(fi))
write.csv(
  df,
  file.path("tabela", "ieedr", "ex4_2b.csv"),
  quote = FALSE
)

# Exercício 4.2 c
media <- sum(df$xi * df$ni) / n
dp <- sqrt(sum((df$xi - media)**2) / (n - 1))
print(paste0("média: ", media))
print(paste0("desvio padrão: ", dp))

# Exercício 4.2 d
png(file.path("imagem", "ieedr", "ex4_2d.png"))
barplot(
  df$ni,
  names.arg = as.character(df$xi),
  ylab = "Nº de Colaboradores",
  xlab = "Salários",
  main = "Distribuição de salários por colaboradores",
  ylim = c(0, 14),
  xaxs = "i",
  yaxs = "i",
  space = 0
)
