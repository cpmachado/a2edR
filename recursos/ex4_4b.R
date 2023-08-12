png("ex4_4b.png")
data <- read.csv("./dataset/4_4.csv")
pie(
  t(as.matrix(data$taxa)),
  labels = data$pais,
  main = "Taxa de inflacção por país"
)
