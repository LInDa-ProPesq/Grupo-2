library(readxl)
# Carrega os dados da planilha em um dataframe
df <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")

# Lê apenas os dados pertinentes à questão "A mídia social é a melhor 
# forma dos professores se aproximarem de seus alunos"
profchegaal <- table(df$profchegaal)

# Abre arquivo profchegaal.jpeg para escrita
jpeg('graficos/profchegaal.jpeg')
# Plota o gráfico
ylab = barplot(profchegaal, 
               names.arg = c('Não', 'Sim', 'Sem opinião'), 
               col = c("lavender", "red", "blue"), 
               ylab = "Quantidade", 
               ylim = c(0, 27), 
               main = "A mídia social é a melhor\nforma dos professores se\naproximarem de seus alunos")
# Escreve os valores acima de suas respectivas barras
text(ylab, profchegaal+1.5, profchegaal)
# Fecha o arquivo .jpeg
dev.off()


# Lê os dados pertinentes à questão "Os alunos terão melhores resultados
# se as mídias sociais estiverem integradas nas aulas"
melhoraresul <- table(df$melhoraresul)
jpeg('graficos/melhoraresul.jpeg')
ylab = barplot(melhoraresul,
               names.arg = c("Não", "Sim", "Sem opinião"),
               col = c("lavender", "red", "blue"),
               ylab = "Quantidade", 
               ylim = c(0, 40),
               main = "Os alunos terão melhores resultados\nse as mídias sociais estiverem\nintegradas nas aulas")
text(ylab, melhoraresul+2, melhoraresul)
dev.off()

# Cria um dataframe para relacionar os dados anteriores
graf4 <- data.frame(df$profchegaal, df$melhoraresul)
# Criar vetores com as labels
labelprofchegaal <- c("Não", "Sim", "Sem opinião")
labelmelhoraresul <- c("Não", "Sim", "Sem opinião")
jpeg('graficos/graf4.jpeg')
plot <- barplot(table(graf4), 
                beside = TRUE,
                names.arg = labelmelhoraresul,
                col = rainbow(3),
                ylim = c(0,20),
                main ="Os alunos terão melhores resultados\nse as mídias sociais estiverem\nintegradas nas aulas")
# Criar uma legenda para o gráfico
legend("topright", labelprofchegaal, fill = rainbow(3), title = "\"A mídia social é a melhor forma\ndo professor se aproximar\ndo aluno?\"")
dev.off()
  
