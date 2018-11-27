library(readxl)

df <- read_excel("dados/umses_alunos_2018.xlsx")
#View(df)

png("graficos/distribuicao-idade.png", width=600, height=600)

idade <- table(df$idade)

nidade <- as.table(0)
names(nidade) <- 5

idades <- c(idade, nidade)

idadeOrdenada <- idades[order(names(idades))]

idadeLbl = c("16-20", "21-25", "26-30", "31-35", "36-40", "40+")

idadePercent = sprintf("%d%%", round(100 * idadeOrdenada / sum(idadeOrdenada)))

pie(idadeOrdenada, labels=idadePercent, col=rainbow(6, s=.3), main="Faixa etária dos entrevistados")
legend("topright", idadeLbl, fill=rainbow(6, s=.3))

dev.off()

