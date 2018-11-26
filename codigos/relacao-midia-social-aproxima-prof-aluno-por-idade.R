library(readxl)

df <- read_excel("dados/umses_alunos_2018.xlsx")
#View(df)

ncol <- as.table(c(0, 0, 0))

rownames(ncol) <- c(1, 2, 3)

tabela <- table(df$idade, df$profchegaal)

tabela

graf <- rbind(tabela[1:4,], ncol, tabela[5,])

rownames(graf) <- c(1, 2, 3, 4, 5, 6)


png("graficos/relacao-midia-social-aproxima-prof-aluno-por-idade", width=600, height=600)

barplot(graf,
        beside=TRUE,
        ylab="Quantidade de respostas",
        main="Idades dos entrevistados por opinião sobre o uso das mídias\nsociais ser o melhor jeito de aproximar professores de alunos",
        col=rainbow(6, s=.3),
        ylim=c(0, 18),
        names.arg=c("Não", "Sim", "Não sei/não tenho opinião"))

legend("topright", legend=c("16-20", "21-25", "26-30", "31-35", "36-40", "40+"), fill=rainbow(6, s=.3), title="Idade")
