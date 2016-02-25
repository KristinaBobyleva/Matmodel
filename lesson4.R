head(iris)
tail(iris)
iris[iris$species > 1 "setosa", ]
iris[iris$species > 1 ]
iris$Species
iris[iris$Species == "setosa", ]
iris$Species == "setosa"
iris[iris$Species == "setosa" & iris$Petal.Length > 1 , ]
iris[iris$Species == "setosa" & iris$Petal.Length > 1.5 , ]
length(iris[iris$Species == "setosa" & iris$Petal.Length > 1 , 2 ])
my_function = function(){
  return(print("Привет"))
}
my_function()
kvadrat = function(x){
  y = x^2
  return(y)
}
kvadrat(5)
stepen = function(x,y){
  z= x^y 
  return(z) 
}
stepen(3,2)  
kub = function(x){
  p = x^3
  return(p)
}
kub(3)
kub = function(x){
  p = stepen(x,3)
  return(p)
}
kub(2)
koren = function(x){
  y=x^0.5
  return(y)
}
koren(2)
koren = function(x){
  if(x>0){
    y = x^0.5
  } else {
    return(print("Дурак"))
  }
}                                                                                   
koren(-2)
l = list(-2:8,3:10,20:0,10:15)
mn = c()
for (i in 1:length(l)){
  m = mean(l[[i]])
  mn = c(mn,m)
}
mn
