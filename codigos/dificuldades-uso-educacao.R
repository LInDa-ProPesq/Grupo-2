library(readxl)

df <- read_excel("dados/umses_alunos_2018.xlsx")

total <- length(df$distracao)

outros <- sum(table(df$outras_dificuldades))
distracao <- table(df$distracao)[names(table(df$distracao)) == "1"]
usoindev <- table(df$usoindev)[names(table(df$usoindev)) == "1"]
prejintera <- table(df$prejintera)[names(table(df$prejintera)) == "1"]
bulling <- table(df$bulling)[names(table(df$bulling)) == "1"]
continadeq <- table(df$continadeq)[names(table(df$continadeq)) == "1"]

# Cria labels e um vetor com os valores respectivos de cada label
labels <- c("Distração", "Uso indevido", "Prejudica a interação aluno-professor", "Cyber-bullying", "Publicação de conteúdo inadequado")
values <- c(distracao, usoindev, prejintera, bulling, continadeq)

# Cria um dataframe com as labels e os valores
dados <- data.frame(labels, values)
nl <- data.frame("Outros", outros)
names(nl) <- c("labels", "values")

# Ordena os dados
dadosOrdenados <- rbind(dados[with(dados, order(dados$values)),], nl)

png("graficos/dificuldades-uso-educacao.png", width=600, height=600)

xval <- barplot(dadosOrdenados$values,
        main="Dificuldades no uso de mídias sociais\nnum ambiente educacional",
        col=rainbow(6, s=.3),
        ylim=c(0, ceiling(total / 10) * 10),
        ylab="Quantidade de pessoas")

text(x=xval, y=dadosOrdenados$values + 0.05 * max(dadosOrdenados$values), dadosOrdenados$values, xpd=TRUE)

legend("topleft", legend=dadosOrdenados$labels, fill=rainbow(6, s=.3))

dev.off()
