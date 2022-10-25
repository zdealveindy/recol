transform2brbl_1 <- function (data)
{
  ifelse (data == 0, 0, 
          ifelse (data <= 1, 1, 
                  ifelse (data <= 2, 2, 
                          ifelse (data <= 3, 3, 
                                  ifelse (data <= 25, 4, 
                                          ifelse (data <= 50, 5, 
                                                  ifelse (data <= 75, 6, 7)))))))
}

transform2brbl_2 <- function (data)
{
  t.data <- as.matrix(data)
  for (ro in seq (1, nrow (t.data)))
    for (co in seq (1, ncol (t.data)))
    {
      t.data[ro,co] <- if (t.data[ro,co] == 0) 0 else
        if (t.data[ro,co] <= 1) 1 else
          if (t.data[ro,co] <= 2) 2 else
            if (t.data[ro,co] <= 3) 3 else
              if (t.data[ro,co] <= 25) 4 else
                if (t.data[ro,co] <= 50) 5 else
                  if (t.data[ro,co] <= 75) 6 else 7
    }
  dim (t.data) <- dim (data)
  dimnames (t.data) <- dimnames (data)
  return (t.data)
}

transform2brbl_3 <- function (data)
{
  t.data <- as.matrix (data)
  for (ro in seq (1, nrow (t.data)))
    for (co in seq (1, ncol (t.data)))
    {
      t.data[ro,co] <- if (t.data[ro,co] == 0) 0 else
        if (t.data[ro,co] > 0 & t.data[ro,co] <= 1) 1 else
          if (t.data[ro,co] > 1 & t.data[ro,co] <= 2) 2 else
            if (t.data[ro,co] > 2 & t.data[ro,co] <= 3) 3 else
              if (t.data[ro,co] > 3 & t.data[ro,co] <= 25) 4 else
                if (t.data[ro,co] > 25 & t.data[ro,co] <= 50) 5 else
                  if (t.data[ro,co] > 50 & t.data[ro,co] <= 75) 6 else 7
    }
  dim (t.data) <- dim (data)
  dimnames (t.data) <- dimnames (data)
  return (t.data)
}

transform2brbl_4 <- function (data)
{
  t.data <- as.matrix (data)
  for (ro in seq (1, nrow (t.data)))
    for (co in seq (1, ncol (t.data)))
    {
      if (t.data[ro,co] == 0) t.data[ro,co] <- 0
      if (t.data[ro,co] > 0 & t.data[ro,co] <= 1) t.data[ro,co] <- 1
      if (t.data[ro,co] > 1 & t.data[ro,co] <= 2) t.data[ro,co] <- 2
      if (t.data[ro,co] > 2 & t.data[ro,co] <= 3) t.data[ro,co] <- 3
      if (t.data[ro,co] > 3 & t.data[ro,co] <= 25) t.data[ro,co] <- 4
      if (t.data[ro,co] > 25 & t.data[ro,co] <= 50) t.data[ro,co] <- 5
      if (t.data[ro,co] > 50 & t.data[ro,co] <= 75) t.data[ro,co] <- 6
      if (t.data[ro,co] > 75 & t.data[ro,co] <= 100) t.data[ro,co] <- 7
    }
  dim (t.data) <- dim (data)
  dimnames (t.data) <- dimnames (data)
  return (t.data)
}

transform2brbl_5 <- function (data) 
{
  data1 <- (data > 0 & data <= 1)   
  data1. <- replace (data1, data1 > 0, 1) 
  
  data2 <- (data > 1 & data <= 2)   
  data2. <- replace (data2, data2 > 0, 2)
  
  data3 <- (data > 2 & data <= 3)   
  data3. <- replace (data3, data3 > 0, 3)
  
  data4 <- (data > 3 & data <= 25)   
  data4. <- replace (data4, data4 > 0, 4)
  
  data5 <- (data > 25 & data <= 50)   
  data5. <- replace (data5, data5 > 0, 5)
  
  data6 <- (data > 50 & data <= 75)   
  data6. <- replace (data6, data6 > 0, 6)
  
  data7 <- (data > 75 & data <= 100)  
  data7. <- replace (data7, data7 > 0, 7) 
  
  datatotal <- (data1. + data2. + data3. + data4. + data5. + data6. + data7.) 
  return (datatotal)
}
