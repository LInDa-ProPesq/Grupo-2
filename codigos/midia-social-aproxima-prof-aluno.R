library(readxl)
# Carrega os dados da planilha em um dataframe
df <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")

# Lê apenas os dados pertinentes à questão "A mídia social é a melhor 
# forma dos professores se aproximarem de seus alunos"
profchegaal <- table(df$profchegaal)

# Abre arquivo para escrita
png('graficos/midia-social-aproxima-prof-aluno.png', width=600, height=600)

# Plota o gráfico
ylab = barplot(profchegaal, 
               names.arg = c('Não', 'Sim', 'Sem opinião'),
               col = rainbow(3, s=.3),
               ylab = "Quantidade de escolhas", 
               ylim = c(0, 27), 
               main = "A mídia social é a melhor\nforma dos professores se\naproximarem de seus alunos")

# Escreve os valores acima de suas respectivas barras
text(ylab, profchegaal+1.5, profchegaal)

# Fecha o arquivo .png
dev.off()
