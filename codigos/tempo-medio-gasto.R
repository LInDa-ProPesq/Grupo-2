library(readxl)

df <- read_excel("dados/umses_alunos_2018.xlsx")
#View(df)

lbls <- c("0h-1h", "1h-2h", "2h-3h", "3h-4h", "4h-5h", "5h+")

table(df$tempogasto)
m <- table(df$tempogasto)

aux <- as.vector(table(df$tempogasto))

h1 = aux[1] + aux[2] + aux[3] 

tabelaTempoGasto <- c(h1, aux[-(1:3)])

png("graficos/tempo-medio.png", width=600, height=600)

xval <- barplot(tabelaTempoGasto,
                main="Quanto tempo é gasto diariamente em redes sociais",
                axisnames=FALSE,
                ylab="Quantidade de pessoas",
                ylim=c(0, 23),
                col=rainbow(8, s=.3),
                space=0)

text(x=xval, y=tabelaTempoGasto + 0.05*max(tabelaTempoGasto), tabelaTempoGasto, font=2)

text(lbls, x=xval, y=-0.05 * max(tabelaTempoGasto), xpd=TRUE)

tempos <- c(30, 90, 150, 210, 270, 300)

tempoMedio <- 0
for(i in 1:length(tabelaTempoGasto)) {
  tempoMedio <- tempoMedio + tempos[i] * tabelaTempoGasto[i]
}
media <- tempoMedio / 68 / 60

horas <- floor(media)
minutos <- (media - horas) * 60

segments(x0=media, x1=media, y0=0, y1= 20, col="red")
text(paste("Tempo médio", "(", horas, "h", round(minutos), ")"), x=media, y=21, col="red")

dev.off()
