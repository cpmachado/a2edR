p <- read.csv(file.path("dataset","ieedr","4_3.csv"))$p
df <- data.frame(media = mean(p), desvio = sd(p))
print(df)
