#Instalando dependências
install(readxl)
#Carregando dependências
library(readxl)

#Lendo Arquivo
df <- read_excel("~/@github/Grupo-2/dados/umses_alunos_2018.xlsx")

#label de Idades
labelIdade = c("16-20", "21-25", "26-30", "31-35", "36-40", "40+")

#label de respostas
labelResp = c("Não","Sim","Sim, porém com restrições", "Não sei/Não tenho opinião" )

#criando matriz de respostas
cont = data.frame(matrix(ncol=6, nrow=4))
colnames(cont) = c("idade1","idade2","idade3","idade4","idade5", "idade6")



#zerando valores iniciais
for(i in 1:4){
  cont$idade1[i] = 0;
  cont$idade2[i] = 0;
  cont$idade3[i] = 0;
  cont$idade4[i] = 0;
  cont$idade5[i] = 0;
  cont$idade6[i] = 0;
}

df$idade[1]
df$usoacademico[1]

#pode-se realizar um
#teste = data.frame(df$idade, df$usoacademico)
#table(teste)
#ou realizar esse for:

#preenchendo com frequencias em que ocorre
for(i in 1:68){
  if(df$idade[i] == 1){
    if(df$usoacademico[i] == 1) cont$idade1[1] = cont$idade1[1]+1
    if(df$usoacademico[i] == 2) cont$idade1[2] = cont$idade1[2]+1
    if(df$usoacademico[i] == 3) cont$idade1[3] = cont$idade1[3]+1
    if(df$usoacademico[i] == 4) cont$idade1[4] = cont$idade1[4]+1
  }
  if(df$idade[i] == 2){
    if(df$usoacademico[i] == 1) cont$idade2[1] = cont$idade2[1]+1
    if(df$usoacademico[i] == 2) cont$idade2[2] = cont$idade2[2]+1
    if(df$usoacademico[i] == 3) cont$idade2[3] = cont$idade2[3]+1
    if(df$usoacademico[i] == 4) cont$idade2[4] = cont$idade2[4]+1
  }
  if(df$idade[i] == 3){
    if(df$usoacademico[i] == 1) cont$idade3[1] = cont$idade3[1]+1
    if(df$usoacademico[i] == 2) cont$idade3[2] = cont$idade3[2]+1
    if(df$usoacademico[i] == 3) cont$idade3[3] = cont$idade3[3]+1
    if(df$usoacademico[i] == 4) cont$idade3[4] = cont$idade3[4]+1
  }
  if(df$idade[i] == 4){
    if(df$usoacademico[i] == 1) cont$idade4[1] = cont$idade4[1]+1
    if(df$usoacademico[i] == 2) cont$idade4[2] = cont$idade4[2]+1
    if(df$usoacademico[i] == 3) cont$idade4[3] = cont$idade4[3]+1
    if(df$usoacademico[i] == 4) cont$idade4[4] = cont$idade4[4]+1
  }
  if(df$idade[i] == 5){
    if(df$usoacademico[i] == 1) cont$idade5[1] = cont$idade5[1]+1
    if(df$usoacademico[i] == 2) cont$idade5[2] = cont$idade5[2]+1
    if(df$usoacademico[i] == 3) cont$idade5[3] = cont$idade5[3]+1
    if(df$usoacademico[i] == 4) cont$idade5[4] = cont$idade5[4]+1
  }
  if(df$idade[i] == 6){
    if(df$usoacademico[i] == 1) cont$idade6[1] = cont$idade6[1]+1
    if(df$usoacademico[i] == 2) cont$idade6[2] = cont$idade6[2]+1
    if(df$usoacademico[i] == 3) cont$idade6[3] = cont$idade6[3]+1
    if(df$usoacademico[i] == 4) cont$idade6[4] = cont$idade6[4]+1
  }
}

#Neste ponto o dataframe cont tem a frequência com idade e resposta se cruzam
cont
matrix = as.matrix(cont)
barplot(matrix, ylim=c(0,22), beside=TRUE, col=rainbow(4), xlab="idade", ylab="frequencia", names.arg = labelIdade, main = "Idade x Opinião Questão 4")
legend("topright", labelResp , fill=rainbow(4))

