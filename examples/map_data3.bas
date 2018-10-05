10 cls
100 rem max for contenants is 20, 10 is nice, 0 is ok: 20,7,15 default
110 contenants = 20 : rem 10,2,15 gives archapeligo
120 waterSeed = 7 : rem 20,15,0 is fairly balanced
130 islandTweak = 15 : rem 0,12,5 gives more strange islands
140 rem keep Seed and Tweak opposites - Large (<20) & Small (>0) or S & L
150 rem also try:  0,12,5  0,7,15  10,0,25  10,2,15  20,15,0  0,15,0
1000 W=200 : H=200 : p=xsize-W
2000 for Y=1 to H
2005  for X=p to xsize
2010   R=rnd(255) : G=rnd(255) : B=rnd(255)
2020   rem print @1; : ? R;G;B;"         "
2110   pen 1 : color 64,255,64,255 : if B>251 then gosub 3010
2120   move X,Y : spot
2290  next X
2295 next Y
3000 goto 11900
3010 if X<p+5 or X>xsize-15 then return
3020 if Y<10 or Y>H-10 then return
3130 if contenants=0 then goto 4120 else c=abs(contenants)
3140 if c>20 then c=20
3150 cx=2*c : cy=H/2
3160 if Y<cy-cx or Y>cy+cx then goto 4120
3170 if X<p+cx or X>xsize-cx then return
4120 if islandTweak<1 then islands=0 else islands=rnd(islandTweak)
4130 r=waterSeed+islands : x=x+(int(r/2))+1
4140 pen r : color 128,128,255,255
4150 return
11900 A=64 : pen 1
12000 for Y=1 to H
12005  for X=p to xsize
12010   R=rnd(255) : G=rnd(255) : B=rnd(255)
12020   rem print @1; : ? R;G;B;"         "
12110   rem if G<20 then color R,G,B,A : move X,Y : spot
12110   if B<60 then color R,G,B,255 : move X,Y : spot
12290  next X
12295 next Y
13000 end : A=A/2 : if A>2 then goto 12000
