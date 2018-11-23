library(readxl)
# Carrega a planilha em um dataframe
df <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
#View(df)

# Cria um dataframe com apenas os dados necessários
graf4 <- data.frame(df$tempogasto, df$usoacademico)

# Cria as labels necessárias
labeltempouso <- c("5-10min", "10-30min", "30min-1h", "1-2h", "2-3h", "3-4h", "4-5h", "mais de 5h")
labelusoacademico <- c("Não", "Sim", "Sim, porém\ncom\nrestrições", "Sem opinião")

# Abre um arquivo .jpeg para a escrita do gráfico
jpeg('graficos/teste.jpeg')
# Plota o gráfico
plot <- barplot(table(graf4), beside = TRUE, 
                col = rainbow(7), 
                xaxt = "n",
                ylim = c(0,15),
                main = "\"Mídia é uma ferramenta\nque deve ser usada\npor professores?\"\npor tempo de uso diário de internet ")
# Cria uma legenda para o gráfico
legend(22,14, labeltempouso, fill = rainbow(7))
# Insere um xlab próprio
text(plot[1,]+4, -1, srt = "0", labelusoacademico, adj = 0.5, xpd = TRUE, cex = 1.2)
dev.off()
