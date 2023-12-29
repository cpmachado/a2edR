p <- read.csv(file.path("dataset", "4_3.csv"))$p
df <- data.frame(media = mean(p), desvio = sd(p))
print(df)
