10 cls
1000 W=200 : H=200 : p=xsize-W : pen 1
2000 for Y=1 to H
2005  for X=p to xsize
2010   R=rnd(255) : G=rnd(255) : B=rnd(255)
2020   rem print @1; : ? R;G;B;"         "
2110   color R,G,B,255
2120   move X,Y : spot
2290  next X
2295 next Y
