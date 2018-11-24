library(readxl)
library(xlsx)
df <- read_excel("dados/umses_alunos_2018.xlsx")
#View(df)

total <- length(df$idade)

twitter <- table(df$twitter)

facebook <- table(df$facebook)

whatsapp <- table(df$whatsapp)

linkedin <- table(df$linkedin)

youtube <- table(df$youtube)

instagram <- table(df$instagram)

snapchat <- table(df$snapchat)

tumblr <- table(df$tumblr)

pinterest <- table(df$pinterest)

social <- c(twitter, facebook, whatsapp, linkedin, youtube, instagram, snapchat, tumblr, pinterest)
lbls <- c("Twitter", "Facebook", "Whatsapp", "Linkedin", "Youtube", "Instagram", "Snapchat", "Tumblr", "Pinterest")

jpeg("graficos/quantidade-usuarios-rede-social.jpeg")

xval <- barplot(social,
        main="Quantidade de usuários de cada rede social\ndentre os respondentes",
        axisnames=FALSE,
        ylab="Quantidade de usuários",
        ylim=c(0, 80),
        col=rainbow(9, s=.3))

abline(a=total, b=0, lwd=2, lty = 2, col="red")
text(y=total, x=-.5, "Total", xpd=TRUE, col="red", adj=1)
text(x=xval, y=social + 0.05 * max(social), social, font=2)
text(lbls, x=xval, y=-0.05 * max(social), xpd=TRUE, srt="45", adj=1)
dev.off()
