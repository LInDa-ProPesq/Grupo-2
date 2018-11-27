library(readxl)
# Carrega a planilha em um dataframe
df <- read_excel("dados/umses_alunos_2018.xlsx")

graf <- table(data.frame(df$usoacademico, df$profchegaal))

lbls = c("Sim", "Não", "Sem opinião/\nNão sei")

png("graficos/relacao-uso-midias-sociais-educacao-por-aproximacao-aluno-prof.png", width=600, height=600)

barplot(graf,
        main="Relação entre respostas sobre uso de mídias\nsociais na educação e se elas são a melhor\nforma de aproximação entre alunos e professor",
        beside=TRUE,
        names.arg=lbls,
        ylim=c(0, max(graf) + 2),
        col=rainbow(4, s=.3),
        xlab="Melhor forma de aproximação entre alunos e professores",
        ylab="Quantidade de respostas")

legend("topright", c("Não", "Sim", "Sim, com restrições", "Não sei/não tenho opinião"), fill=rainbow(4, s=.3))

dev.off()

