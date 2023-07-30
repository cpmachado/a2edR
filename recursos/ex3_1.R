irmaos <- read.csv("./dataset/irmaos.csv")$xi
n = length(irmaos)
print(transform(table(irmaos), f_i = Freq / n))
