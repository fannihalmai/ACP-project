library(readr)

c<-c("FactoMineR", "factoextra", "corrplot")

c<-c("corrplot")
install.packages(c)
library("FactoMineR")
library("factoextra")
library("corrplot")

raw_2019 <- read_csv("data/2019.csv")
raw_2018 <- read_csv("data/2018.csv")
raw_2017 <- read_csv("data/2017.csv")
raw_2016 <- read_csv("data/2016.csv")
raw_2015 <- read_csv("data/2015.csv")
View(raw_2015)
View(raw_2016)
View(raw_2017)
View(raw_2018)
View(raw_2019)

## Supprimer les colonnes dont nous n'avons pas besoin
act_col <- c(1, 4:9)
X2019 <- raw_2019[, act_col]
View(X2019)

# Correlation des variables (to see more options help(corrplot))
#Pour visualiser avec un tableau le niveau de correlation des variables. A noter que les correl sont 100% sur la diagonale, evidemment
M<-cor(X2019)
View(M)
corrplot(M, method="number")


#PCA et eigenvalues
happy.pca <- PCA(X2019)

#Visualiser les eigenvalues avec un diagramme 
eig.val<-get_eigenvalue(happy.pca)
eig.val
fviz_eig(happy.pca, addlabels = TRUE, ylim=c(0,60), linecolor = "red", barfill = "darkblue", barcolor = "darkblue")

# Visualiser les variables de l'analyse (les variables corrélées sont tres proches) et on voit avec quelle dimension elles sont corrélées
var<-get_pca_var(happy.pca)
fviz_pca_var(happy.pca, col.var="darkblue")

# Cos2 montre la qualité de la representation
fviz_cos2(happy.pca, choice = "var", axes = 1:2, top=5)

# La contribution des variables aux dimensions numériquement et visuellement
var$contrib
fviz_contrib(happy.pca, choice="var", axes = 1, top = 5)

# visualisation de l'APC (faudra remettre les noms des pays sur le plot plutot que leur index)
ind<- get_pca_ind(happy.pca)
ind

fviz_pca_ind(happy.pca, pointsize="cos2", pointshape =22, fill="blue", repel=TRUE)
help(fviz_pca_ind)
plot(happy.pca, select="cos2 50", cex=1, col.ind = "darkblue", title=("50 countries with highest cos2"), cex.main=2, col.main="darkblue")
             
