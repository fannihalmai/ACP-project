library(readr)


#Définition du dossier de Travail
setwd(dir = "ACP-project-main")

#Visualisation du dossier de Travail
getwd()



# ___________ 1 ___________ #

#Ouverture du fichier
raw_2019 <- read_csv("data/2019.csv")
View(raw_2019)

## Supprimer les colonnes dont nous n'avons pas besoin
act_col <- c(1, 4:9)
X2019 <- raw_2019[, act_col]
View(X2019)

#Données centré et réduites
scale(X2019, center = TRUE, scale = TRUE)



# ___________ 2 ___________ #

#Variance / covariance
covarianceX2019 <- cov(X2019)
covarianceX2019
View(covarianceX2019)

#Indices de correlation
correlationX2019 <- cor(X2019)
correlationX2019
View(correlationX2019)

#Affichage du plot à partir des indices de correlation
corrplot(correlationX2019, method="number")

# ___________ 3 ___________ #