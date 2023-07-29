png("ex4_4a.png")
data <- read.csv("./dataset/4_4.csv")
barplot(
    t(as.matrix(data$taxa)),
    names.arg = data$pais,
    ylab = "Taxa de inflacção",
    xlab = "País",
    main = "Taxa de inflacção por país",
    ylim = c(0, 2.5)
)
