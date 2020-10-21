###############################
# DEBUT PROJET 
###############################

ciqual <- read.csv("Table_Ciqual.csv", header=T, na.string="-", sep=";", dec=",")
dim(ciqual)
# 3185 variables et 76 catégories
ciqual_slct <- subset(ciqual, select=-c(1))
dim(ciqual_slct)
summary(ciqual_slct)

# sélection de alim_grp_nom_fr == "eaux et autres boissons" (correspond au groupe de code 6)
# ciqual_boissons <- subset(ciqual, ciqual$alim_grp_code == 6)
# dim(ciqual_boissons)

# Analyse univariée
sum(ciqual_boissons)
