data <- read.csv("./dataset/4_2.csv")
n <- sum(data$ni)
media <- sum(data$xi * data$ni) / n
dp <- sqrt(sum((data$xi - media) ** 2) / n)
print(paste0("média: ", media))
print(paste0("desvio padrão: ", dp))
