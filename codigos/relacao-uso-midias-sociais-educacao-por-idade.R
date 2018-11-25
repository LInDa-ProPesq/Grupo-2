library(readxl)
# Carrega a planilha em um dataframe
df <- read_excel("dados/umses_alunos_2018.xlsx")

nrow <- as.table(c(0, 0, 0, 0))
names(nrow) <- c(1, 2, 3, 4)

graf <- table(data.frame(df$usoacademico, df$idade))

ngraf <- cbind(graf[,1:4], nrow, graf[,5])
colnames(ngraf) <- c(1, 2, 3, 4, 5, 6)

lbls = c("16-20", "21-25", "26-30", "31-35", "36-40", "40+")

png("graficos/relacao-uso-midias-sociais-educacao-por-idade.png", width=600, height=600)

barplot(ngraf,
        main="Relação entre respostas sobre uso de mídias\nsociais na educação e idade",
        beside=TRUE,
        names.arg=lbls,
        ylim=c(0, max(ngraf) + 5),
        col=rainbow(4, s=.3),
        xlab="Idade",
        ylab="Quantidade de respostas")

legend("topright", c("Não", "Sim", "Sim, com restrições", "Não sei/não tenho opinião"), fill=rainbow(4, s=.3))

dev.off()

