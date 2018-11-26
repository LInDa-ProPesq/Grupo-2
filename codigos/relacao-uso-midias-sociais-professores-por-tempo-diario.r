library(readxl)
# Carrega a planilha em um dataframe
df <- read_excel("dados/umses_alunos_2018.xlsx")
#View(df)

# Cria uma "dummy row"
nrow1 <- as.table(c(0, 0, 0, 0))
names(nrow1) <- c(1, 2, 3, 4)
rownames(nrow1)

# Cria um dataframe com apenas os dados necessários
graf4 <- rbind(nrows, table(data.frame(df$tempogasto, df$usoacademico)))
rownames(graf4) <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)


# Cria as labels necessárias
labeltempouso <- c("5-10min", "10-30min", "30min-1h", "1-2h", "2-3h", "3-4h", "4-5h", "mais de 5h")
labelusoacademico <- c("Não", "Sim", "Sim, porém\ncom\nrestrições", "Sem opinião")

# Abre um arquivo .png para a escrita do gráfico
png('graficos/relacao-uso-midias-sociais-professores-por-tempo-diario.png', width=600, height=600)

# Plota o gráfico
plot <- barplot(graf4, beside = TRUE, 
                col = rainbow(9, s=.3), 
                xaxt = "n",
                ylim = c(0,max(graf4) + 1),
                main = "Relação entre respostas se mídias sociais devem ser usadas\npor professores e tempo de uso diário de mídias sociais")
# Cria uma legenda para o gráfico
legend("topright", labeltempouso, fill = rainbow(8, s=.3))
# Insere um xlab próprio
text(plot[1,] + 3, -.3, srt = "0", labelusoacademico, pos = 1, xpd = TRUE, cex = 1)
dev.off()
