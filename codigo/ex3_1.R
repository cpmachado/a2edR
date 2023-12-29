xi <- read.csv(file.path("dataset", "irmaos.csv"))$x
df <- as.data.frame(table(xi), responseName = "ni")
df <- transform(df, fi = prop.table(df$ni))
write.csv(
  df,
  file.path("tabela", "ex3_1.csv"),
  quote = FALSE
)
