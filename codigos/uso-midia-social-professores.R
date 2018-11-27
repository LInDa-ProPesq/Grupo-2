library(readxl)

df <- read_excel("dados/umses_alunos_2018.xlsx")
#View(df)

table(df$usoacademico)

lbls <- c("Não", "Sim", "Sim, porém\ncom restrições", "Não sei/não\ntenho opinião")

png("graficos/uso-midia-social-professores.png", width=600, height=600)

xval <- barplot(table(df$usoacademico),
        main="A mídia social é um ferramenta que pode\nser usada por professores?",
        ylim=c(0, 50),
        names.arg=lbls,
        col=rainbow(4, s=.3))

text(x=xval, y=table(df$usoacademico) + max(table(df$usoacademico)) * 0.05, table(df$usoacademico))




dev.off()

