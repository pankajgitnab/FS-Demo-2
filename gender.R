
# API for getting gender from first names 


rawdt = read.csv(file = "name_gender_DR Bank.csv")  # list of names
View(rawdt)

bl = which(rawdt$Gender=="")

dt = rawdt[bl,]
View(dt)

dt$Trimmed = as.character(dt$Trimmed)
dt$Gender = as.character(dt$Gender)

###genderize.io package

install.packages("genderizeR")
library(genderizeR)

# ran till 2926

for(i in 2926:3500){
  
  v = genderizeAPI(x = dt[i,2], apikey = NULL, ssl.verifypeer = TRUE)
  v1 = v$response
  if(nrow(v1)>0){dt[i,3] = as.character(unname(v1[1,2]))}
}

saveRDS(object = dt,file = "dt.rds")
View(dt)

write.csv(x = dt,file = "names.csv")



