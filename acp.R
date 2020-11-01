###############################
# DEBUT PROJET 
###############################

ciqual <- read.csv("Table_Ciqual.csv", header=T, na.string="-", sep=";", dec=",")
dim(ciqual)
# 3185 variables et 76 catégories
ciqual_slct <- subset(ciqual, select=-c(1))
dim(ciqual_slct)


# sélection de alim_grp_nom_fr == "eaux et autres boissons" (correspond au groupe de code 6)
# ciqual_boissons <- subset(ciqual, ciqual$alim_grp_code == 6)
# dim(ciqual_boissons)

# Analyse univariée
summary(ciqual_slct)


## ACP ## 

A <- matrix(data = c(-2, -1, 2, 1, 3, 1, -1, -3, -1, 0, -1, 2), nrow=4, ncol=3)
#       [,1] [,2] [,3]
# [1,]   -2    3   -1
# [2,]   -1    1    0
# [3,]    2   -1   -1
# [4,]    1   -3    2

# Moyenne de chaque colonne
Tmean <- t(matrix(colMeans(A))) # [1] 0 0 0

# Matrice centrée
Tmean <- Tmean[rep(1:nrow(Tmean), each = nrow(A)),]
Ac <- A - Tmean

# Matrice de variance/covariance
S <- 1/nrow(A) * t(Ac) %*% Ac 

# Calcul de la trace
trS = sum(diag(S))

# Matrice centrée réduite
D <- t(matrix((diag(S))^(-1/2)))
D <- D[rep(1:nrow(D), each = nrow(Ac)),]
Acr <- Ac * D

# Matrice de corrélation
R <- 1/nrow(A)* t(Acr) %*% Acr

# Valeurs propres 
valprop <- eigen(S)





