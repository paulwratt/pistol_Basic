10 cls
100 print "visual map generator, civilization style"
110 input "map width  (-1 for minimap)";mapx
120 input "map height (-1 for minimap)";mapy
130 input "contenant is a peninsula (0 no):";e
140 print "minipam contenants to 20, 10 is nice, 0 is ok to: 50,7,15 default"
150 print "keep Seed and Tweak opposites - Large (<20) & Small (>0) or S & L"
160 print "try:  0,12,5  0,7,15  10,0,25  10,2,15  20,15,0  0,15,0  20,7,15"
170 input "contenant extends:";c
180 input "lots of water (0-25):";w
190 input "chance of islands (0-25):";i
510 if c<0 then contenants=50 else contenants=c : rem 10,2,15 gives archapeligo
520 if e=0 then ispeninsula=0 else ispeninsula=c : rem 10,2,15 gives archapeligo
530 if w<0 then waterSeed=12 else waterSeed=w : rem 20,15,0 is fairly balanced
540 if i<0 then islandTweak=5 else islandTweak=i : rem 0,12,5 gives more strange islands
550 if c<1 and w<1 and i<1 then waterSeed=7 : islandTweak=15 : contenants=50
560 if mapx=0 or mapx>xsize then mapx=xsize
570 if mapy=0 or mapy>ysize then mapy=ysize
1000 if mapx=-1 and mapy=-1 then W=200 : H=200 : p=xsize-W : mapx=xsize else W=mapx : H=mapy : p=1 : cls
2000 for Y=1 to H
2005  for X=p to mapx
2010   R=rnd(255) : G=rnd(255) : B=rnd(255)
2020   rem print @1; : ? R;G;B;"         "
2110   pen 1 : color 64,255,64,255 : if B>251 then gosub 3010
2120   move X,Y : spot
2290  next X
2295 next Y
3000 goto 11900
3010 if X<p+1 or X>mapx-20 then return
3020 if Y<10 or Y>H-10 then return
3130 if contenants=0 then goto 4120 else c=abs(contenants)
3140 if c>H/2 then c=c/3
3150 cx=c : cy=H/2 : e=abs(ispeninsula)
3210 dx=X-p-cx : dy=cy-Y-cx+dx : if dx<0 and dy<0 and Y<cy then return
3230 if ~e then goto 3240 else dx=X-p-cx : dy=Y-cy-cx+dx : if dx<0 and dy<0 and Y>cy then return
3220 dx=mapx-cx-X : dy=cy-Y-cx+dx : if dx<0 and dy<0 and Y<cy then return
3240 dx=mapx-cx-X : dy=Y-cy-cx+dx : if dx<0 and dy<0 and Y>cy then return
4120 if islandTweak<1 then islands=0 else islands=rnd(islandTweak)
4130 r=waterSeed+islands : x=x+(int(r/2))+1
4140 pen r : color 128,128,255,255
4150 return
11900 pen 1
12000 for Y=1 to H
12005  for X=p to mapx
12010   R=rnd(255) : G=rnd(255) : B=rnd(255)
12020   rem print @1; : ? R;G;B;"         "
12110   if B<60 then color R,G,B,255 : move X,Y : spot
12290  next X
12295 next Y
15000 a$=inkey$ : if a$="" then goto 15000 
15010 cls : home : goto 100
