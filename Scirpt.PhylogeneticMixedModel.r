<<<<<<< HEAD
# Load Libraries
library(MCMCglmm)

# Set Environmental Variables
data.file <- "Data.MCMCglmm.Latitude.NoAfrica.txt"
migration.matrix.file <- "MigrationMatrix.txt"
Phylogeny.file <- "TreeCon.tre"

#Read in Data
data <- read.table(data.file, sep="\t", header = TRUE, na.strings="-")

#Read in Migration Matrix and check
migration.matrix.data <- read.table(migration.matrix.file, sep="\t", header = TRUE, na.strings="-")
M = as.matrix(migration.matrix.data)
is.positive.definite(M)

# load the corpcor module to make positive definite if not
M2 <- nearPD(M, corr = TRUE)
M3 <- M2$mat
M4 = as.matrix(M3)
is.positive.definite(M4)

# Read in Tree
phylogeny <- read.nexus(Phylogeny.file)
phylogeny.ultrametric <- chronopl(phylogeny, lambda=0.1)

# Process matrices and run model
MA<-as(solve(M4), "dgCMatrix")
PA<-inverseA(phylogeny.ultrametric, nodes="TIPS")$Ainv
data$obs<-as.factor(1:nrow(data))
rownames(MA)<-data$obs


prior1<-list(R=list(V=1, n=0.01), 
	G=list(
	G1=list(V=1,n=0.01, alpha.mu = 0, alpha.V = 100), 
	G2=list(V=1,n=0.01, alpha.mu = 0, alpha.V = 100)))
migration.phylogeny.model <-MCMCglmm(XXarcsine~Latitude,random=~obs+animal,ginverse=list(obs=MA, animal=PA), prior = prior1, nitt=25000, thin=10, burnin=5000, data=data)

# Summarize results
summary(migration.phylogeny.model)

plot(migration.phylogeny.model$VCV)
plot(migration.phylogeny.model$Sol)
=======
# Load Libraries
library(MCMCglmm)

# Set Environmental Variables
data.file <- "Data.MCMCglmm.Latitude.NoAfrica.txt"
migration.matrix.file <- "MigrationMatrix.txt"
Phylogeny.file <- "TreeCon.tre"

#Read in Data
data <- read.table(data.file, sep="\t", header = TRUE, na.strings="-")

#Read in Migration Matrix and check
migration.matrix.data <- read.table(migration.matrix.file, sep="\t", header = TRUE, na.strings="-")
M = as.matrix(migration.matrix.data)
is.positive.definite(M)

# load the corpcor module to make positive definite if not
M2 <- nearPD(M, corr = TRUE)
M3 <- M2$mat
M4 = as.matrix(M3)
is.positive.definite(M4)

# Read in Tree
phylogeny <- read.nexus(Phylogeny.file)
phylogeny.ultrametric <- chronopl(phylogeny, lambda=0.1)

# Process matrices and run model
MA<-as(solve(M4), "dgCMatrix")
PA<-inverseA(phylogeny.ultrametric, nodes="TIPS")$Ainv
data$obs<-as.factor(1:nrow(data))
rownames(MA)<-data$obs


prior1<-list(R=list(V=1, n=0.01), 
	G=list(
	G1=list(V=1,n=0.01, alpha.mu = 0, alpha.V = 100), 
	G2=list(V=1,n=0.01, alpha.mu = 0, alpha.V = 100)))
migration.phylogeny.model <-MCMCglmm(XXarcsine~Latitude,random=~obs+animal,ginverse=list(obs=MA, animal=PA), prior = prior1, nitt=25000, thin=10, burnin=5000, data=data)

# Summarize results
summary(migration.phylogeny.model)

plot(migration.phylogeny.model$VCV)
plot(migration.phylogeny.model$Sol)
>>>>>>> 5c6b919a8237ae306b54b209bdbd035405ec9b34
