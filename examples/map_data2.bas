10 cls
1000 W=200 : H=200 : p=xsize-W : pen 1
2000 for Y=1 to H
2005  for X=p to xsize
2010   R=rnd(255) : G=rnd(255) : B=rnd(255)
2020   rem print @1; : ? R;G;B;"         "
2110   if B>254 then color R,G,B,255 else color 128,128,255,255
2120   move X,Y : spot
2290  next X
2295 next Y
11900 A=64
12000 for Y=1 to H
12005  for X=p to xsize
12010   R=rnd(255) : G=rnd(255) : B=rnd(255)
12020   rem print @1; : ? R;G;B;"         "
12110   if B<20 then color R,G,B,255 : move X,Y : spot
12290  next X
12295 next Y
13000 A=A/2 : if A>2 then goto 12000
