library("cgdsr")
b <- CGDS("http://www.cbioportal.org/public-portal/")

getCancerStudies(b)
names(getCancerStudies(b))

# Get Study ID and Names
getCancerStudies(b)
study <- "thca_tcga"

# Get available case lists
getCaseLists(b,study)
cases <- "thca_tcga_cnaseq"

# Get available genetic profiles
getGeneticProfiles(b,study)
variable <- "thca_tcga_mutations"

# Get mutation data for BRAF gene
p<- getProfileData(b,"BRAF",variable,cases)

# Get how many patients have got a paticular mutation
pp<- as.matrix(p, stringsAsFactors=TRUE)
summary(pp)


