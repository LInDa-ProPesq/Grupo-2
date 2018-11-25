
library(readxl)

trab_final <- read_excel("dados/umses_alunos_2018.xlsx")

graf11 <- table(trab_final$evioinfo)

png('graficos/avaliacao-recursos-info-pais.png', width=600, height=600)

xval11 <- barplot(main = "Envio de informações para os pais",ylab = "Número de escolhas", graf11, col = rainbow(5, s=.3),
        names.arg = c('Excelente','Bom','Indiferente','Ruim','Muito ruim'), ylim=c(0, max(graf11) + 5))



text(xval11, graf11 + 2, graf11)

dev.off()

#USO CRESCENTE EM INTITUIÇÕES ------------------------

graf12 <- table(trab_final$grandeuso)

png('graficos/avaliacao-recursos-instituicoes-promocional.png', width=600, height=600)


xval12 <- barplot(main = "Instituições educacionais utilizando mídias sociais",ylab = "Número de escolhas", graf12, col = rainbow(5, s=.3),
        names.arg = c('Excelente','Bom','Indiferente','Ruim','Muito ruim'), ylim=c(0, max(graf12) + 5))

text(xval12, graf12+2, graf12)
dev.off()

#GRUPO_FACEBOOK --------------------------------

graf13 <- table(trab_final$facegrupo)

png('graficos/avaliacao-recursos-comunicacao-alunos.png', width=600, height=600)

xval13 <- barplot(main = "Escolas utilizando grupo no Facebook\npara comunicação com alunos", ylab = "Número de escolhas", graf13, col = rainbow(5, s=.3),
          names.arg = c('Excelente','Bom','Indiferente','Ruim', 'Muito ruim'), ylim=c(0, max(graf13) + 5))

text(xval13, graf13+2, graf13)
dev.off()

#TROCA DE INFORMAÇÕES PELOS GRUPOS ------------------------------

png('graficos/avaliacao-recursos-troca-informacao.png', width=600, height=600)

nrow <- as.table(0)
names(nrow) <- 5

graf14 <- c(table(trab_final$trocainfo), nrow)

xval14 <- barplot(main = "Membros do grupo podem trocar\ninformações e arquivos", ylab = "Número de escolhas", graf14, col = rainbow(5, s=.3),
                  names.arg = c('Excelente','Bom','Indiferente', 'Ruim', 'Muito ruim'), ylim=c(0, max(graf14) + 5))

text(xval14, graf14+2, graf14)
dev.off()

#ALUNOS E PROFESSORES COMPARTILHAREM INFORMAÇÕES

graf15 <- table(trab_final$compinfopal)

png('graficos/avaliacao-recursos-prof-aluno-troca-info.png', width=600, height=600)

xval15 <- barplot(main = "Alunos e professores compartilharem\ninformações entre si", ylab = "Número de escolhas", graf15, col = rainbow(5, s=.3),
                  names.arg = c('Excelente','Bom','Indiferente', 'Ruim', 'Muito ruim'), ylim=c(0, max(graf15) + 5))

text(xval15, graf15+2, graf15)
dev.off()

# QUADRO VIRTUAL

graf16 <- table(trab_final$quadrovirtual)

png('graficos/avaliacao-recursos-quadro-virtual.png', width=600, height=600)

xval16 <- barplot(main = "Uso de quadro virtual para compartilhar conteúdos multimídias", ylab = "Número de escolhas", graf16, col = rainbow(5, s=.3),
                  names.arg = c('Excelente','Bom','Indiferente', 'Ruim', 'Muito ruim'), ylim=c(0, max(graf16) + 5))

text(xval16, graf16+2, graf16)
dev.off()

