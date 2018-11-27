library(readxl)
# Carrega os dados da planilha em um dataframe
df <- read_excel("dados/umses_alunos_2018.xlsx")

# Lê os dados pertinentes à questão "Os alunos terão melhores resultados
# se as mídias sociais estiverem integradas nas aulas"
melhoraresul <- table(df$melhoraresul)
png('graficos/midia-social-melhora-desempenho-aluno.png', width=600, height=600)
ylab = barplot(melhoraresul,
               names.arg = c("Não", "Sim", "Sem opinião"),
               col = rainbow(3, s=.3),
               ylab = "Quantidade de escolhas", 
               ylim = c(0, max(melhoraresul) + 5),
               main = "Os alunos terão melhores resultados\nse as mídias sociais estiverem integradas nas aulas")
text(ylab, melhoraresul+2, melhoraresul)
dev.off()
