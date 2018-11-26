library(readxl)

df <- read_excel("dados/umses_alunos_2018.xlsx")
#View(df)

tabela <- cbind(df$twitter, df$facebook, df$whatsapp, df$linkedin, df$youtube, df$instagram, df$snapchat, df$tumblr, df$pinterest, df$usoacademico)

# colnames(tabela) <- c(lbls, "Uso academico")

lbls <- c("Twitter", "Facebook", "Whatsapp", "Linkedin", "Youtube", "Instagram", "Snapchat", "Tumblr", "Pinterest")

tab1 <- tabela[tabela[, 10] == 1, 1:9]
graf1 <- colSums(tab1[1:length(tab1[, 1]), 1:9])

tab2 <- tabela[tabela[, 10] == 2, 1:9]
graf2 <- colSums(tab2[1:length(tab2[, 1]), 1:9])

tab3 <- tabela[tabela[, 10] == 3, 1:9]
graf3 <- colSums(tab3[1:length(tab3[, 1]), 1:9])

tab4 <- tabela[tabela[, 10] == 4, 1:9]
graf4 <- colSums(tab4[1:length(tab4[, 1]), 1:9])


png("graficos/relacao-uso-midias-sociais-por-uso-redes-sociais-1.png", width=600, height=600)
xval1 <- barplot(graf1,
                 main="Uso das redes sociais entre quem respondeu \"Não\"\npara o uso de mídias sociais por professores",
                 ylab="Quantidade de escolhas",
                 beside=TRUE,
                 axes=FALSE,
                 axisnames=FALSE,
                 col=rainbow(9, s=.3),
                 ylim=c(0, 3))
axis(0:3, side=2, pos=c(0, 0))

text(lbls, x=xval1, y=-0.05 * max(graf1), srt="45", xpd=TRUE, adj=1)
text(graf1, x=xval1, y=graf1 + 0.05 * max(graf1))


dev.off()

png("graficos/relacao-uso-midias-sociais-por-uso-redes-sociais-2.png", width=600, height=600)

xval2 <- barplot(graf2,
                 main="Uso das redes sociais entre quem respondeu \"Sim\"\npara o uso de mídias sociais por professores",
                 ylab="Quantidade de escolhas",
                 beside=TRUE,
                 axes=FALSE,
                 axisnames=FALSE,
                 col=rainbow(9, s=.3),
                 ylim=c(0, 45))
axis(seq(0, 45, 5), side=2, pos=c(0, 0))

text(lbls, x=xval2, y=-0.05 * max(graf2), srt="45", xpd=TRUE, adj=1)
text(graf2, x=xval2, y=graf2 + 0.05 * max(graf2))

dev.off()

png("graficos/relacao-uso-midias-sociais-por-uso-redes-sociais-3.png", width=600, height=600)


xval3 <- barplot(graf3,
                 main="Uso das redes sociais entre quem respondeu \"Sim, porém\ncom restrições\" para o uso de mídias sociais por professores",
                 ylab="Quantidade de escolhas",
                 beside=TRUE,
                 axes=FALSE,
                 axisnames=FALSE,
                 col=rainbow(9, s=.3),
                 ylim=c(0, 25))
axis(seq(0, 25, 5), side=2, pos=c(0, 0))

text(lbls, x=xval3, y=-0.05 * max(graf3), srt="45", xpd=TRUE, adj=1)
text(graf3, x=xval3, y=graf3 + 0.05 * max(graf3))

dev.off()

png("graficos/relacao-uso-midias-sociais-por-uso-redes-sociais-4.png", width=600, height=600)

xval4 <- barplot(graf4,
                 main="Uso das redes sociais entre quem respondeu \"Não sei/Não\ntenho opinião\"\ para o uso de mídias sociais por professores",
                 ylab="Quantidade de escolhas",
                 beside=TRUE,
                 axes=FALSE,
                 axisnames=FALSE,
                 col=rainbow(9, s=.3),
                 ylim=c(0, max(graf4) + 1))
axis(0:(max(graf4) + 1), side=2, pos=c(0, 0))

text(lbls, x=xval4, y=-0.05 * max(graf4), srt="45", xpd=TRUE, adj=1)
text(graf4, x=xval4, y=graf4 + 0.05 * max(graf4))

dev.off()
