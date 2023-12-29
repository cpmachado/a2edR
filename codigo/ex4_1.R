t <- read.csv(file.path("dataset", "4_1.csv"))$t
df <- data.frame(media = mean(t), desvio = sd(t))
print(df)
