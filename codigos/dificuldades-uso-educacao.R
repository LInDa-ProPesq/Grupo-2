library(readxl)
df <- read_excel("dados/umses_alunos_2018.xlsx")
#View(df)

total <- length(df$distracao)

outros <- sum(table(df$outras_dificuldades))

distracao <- table(df$distracao)

usoindev <- table(df$usoindev)

prejintera <- table(df$prejintera)

bulling <- table(df$bulling)

continadeq <- table(df$continadeq)


labels <- c("Distração", "Uso indevido", "Prejudica a interação aluno-professor", "Cyber-bullying", "Publicação de conteúdo inadequado")
values <- c(distracao, usoindev, prejintera, bulling, continadeq)

dados <- data.frame(labels, values)
nl <- data.frame("Outros", outros)
names(nl) <- c("labels", "values")
dadosOrdenados <- dados[with(dados, order(dados$values)),]

dadosOrdenados <- rbind(dadosOrdenados, nl)

jpeg("graficos/dificuldades-uso-educacao.jpeg")

xval <- barplot(dadosOrdenados$values,
        main="Dificuldades no uso de mídias sociais\nnum ambiente educacional",
        col=rainbow(6, s=.3),
        ylim=c(0, ceiling(total / 10) * 10),
        ylab="Quantidade de pessoas")

text(x=xval, y=dadosOrdenados$values + 0.05 * max(dadosOrdenados$values), dadosOrdenados$values, xpd=TRUE)

legend("topleft", legend=dadosOrdenados$labels, fill=rainbow(6, s=.3))

dev.off()
