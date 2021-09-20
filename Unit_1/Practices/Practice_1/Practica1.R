
for(x in 1:8){
  count<-0
  c <- 10^x
  for(i in rnorm(c)){
    if(i > 1){
    }else if(i >= -1){
      count <- count + 1
    }else{
    }
  }
  res <- count / c
  print(paste("valores", c))
  print(res) 

}
