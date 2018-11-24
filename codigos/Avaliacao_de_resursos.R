install.packages("readxl")

library(readxl)

trab_final <- read_excel("dados/umses_graduacao_2018_vtidy.xlsx")
graf11 <- trab_final$evioinfo

jpeg('graficos/questao8_envioParaOsPais.jpeg')
graf11 <- table(graf11)
graf11

ylab <- barplot(main = "Envio de informações para os pais",ylab = "Número de escolhas", graf11, col = rainbow(5),
        names.arg = c('Excelente','Bom','Indiferente','Ruim','Muito ruim'), ylim=c(0, 27))



text(ylab, graf11 + 2, graf11)

dev.off()

#USO CRESCENTE EM INTITUIÇÕES ------------------------

graf12 <- trab_final$grandeuso
graf12 <- table(graf12)
jpeg('graficos/questao8_usoCrescenteInstituicoes.jpeg')


ylab12 <- barplot(main = "Instituições educacionais utilizando mídias sociais",ylab = "Número de escolhas", graf12, col = rainbow(5),
        names.arg = c('Excelente','Bom','Indiferente','Ruim','Muito ruim'), ylim=c(0, 27))

text(ylab12, graf12+2, graf12)
dev.off()

#GRUPO_FACEBOOK --------------------------------

graf13 <- trab_final$facegrupo
graf13 <- table(graf13)

jpeg('graficos/questao8_gruposFacebook.jpeg')

ylab13 <- barplot(main = "Escolas utilizando grupo no Facebook para comunicação com alunos", ylab = "Número de escolhas", graf13, col = rainbow(5),
          names.arg = c('Excelente','Bom','Indiferente','Ruim'), ylim=c(0, 35))

text(ylab13, graf13+2, graf13)
dev.off()
graf13

#TROCA DE INFORMAÇÕES PELOS GRUPOS ------------------------------

graf14 <- trab_final$trocainfo

graf14 <- table(graf14)

jpeg('graficos/questao8_trocadearquivos.jpeg')
graf14
ylab14 <- barplot(main = "Membros do grupo podem trocar informações e arquivos", ylab = "Número de escolhas", graf14, col = rainbow(5),
                  names.arg = c('Excelente','Bom','Indiferente'), ylim=c(0, 45))

text(ylab14, graf14+2, graf14)
dev.off()

#ALUNOS E PROFESSORES COMPARTILHAREM INFORMAÇÕES

graf15 <- trab_final$compinfopal

graf15 <- table(graf15)

jpeg('graficos/questao8_compinfo.jpeg')
graf15
ylab15 <- barplot(main = "Alunos e professores compartilharem informações entre si", ylab = "Número de escolhas", graf15, col = rainbow(5),
                  names.arg = c('Excelente','Bom','Indiferente', 'Ruim'), ylim=c(0, 35))

text(ylab15, graf15+2, graf15)
dev.off()

#Quadro VIRTUAL

graf16 <- trab_final$quadrovirtual

graf16 <- table(graf16)

jpeg('graficos/questao8_quadrovirtual.jpeg')
graf16

ylab16 <- barplot(main = "Uso de quadro virtual para compartilhar conteúdos multimídias", ylab = "Número de escolhas", graf16, col = rainbow(5),
                  names.arg = c('Excelente','Bom','Indiferente', 'Ruim'), ylim=c(0, 30))

text(ylab16, graf16+2, graf16)
dev.off()

