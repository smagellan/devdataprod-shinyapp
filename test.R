foo <- sample(x = 1, size = 20, replace = TRUE)
mylist <- split(foo, rep(1:20, each=1));
print(mylist);