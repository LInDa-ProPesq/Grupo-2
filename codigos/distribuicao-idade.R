library(readxl)
library(xlsx)
df <- read_excel("dados/umses_alunos_2018.xlsx")
#View(df)

jpeg("graficos/distribuicao-idade.jpeg")

idadeLbl = c("16-20", "21-25", "26-30", "31-35", "40+")
idadePercent = sprintf("%d%%", round(100 * table(df$idade) / sum(table(df$idade))))

pie(table(df$idade), labels=idadePercent, col=rainbow(5, s=.3), main="Faixa etária dos entrevistados")
legend("topright", idadeLbl, fill=rainbow(5, s=.3))

dev.off()

