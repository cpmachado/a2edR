data <- read.csv("./dataset/4_2.csv")
n_i <- cumsum(data$ni)
f_i <- prop.table(data$ni)
print(transform(data, Ni = n_i, fi = f_i))
