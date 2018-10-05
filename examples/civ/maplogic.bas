10 cls
100 print "map data generator, civilization style"
110 input "map width  (-1 for minimap)";mapx
120 input "map height (-1 for minimap)";mapy
130 input "contenant is a peninsula (0 no):";e
140 print "minipam contenants to 20, 10 is nice, 0 is ok to: 50,7,15 default"
150 print "keep Seed and Tweak opposites - Large (<20) & Small (>0) or S & L"
160 print "try:  0,12,5  0,7,15  10,0,25  10,2,15  20,15,0  0,15,0  20,7,15"
170 input "contenant extends:";c
180 input "lots of water (0-25):";w
190 input "chance of islands (0-25):";i
399 rem mapx=-1 : mapy=-1
510 if c<0 then contenants=50 else contenants=c : rem 10,2,15 gives archapeligo
520 if e=0 then ispeninsula=0 else ispeninsula=c : rem 10,2,15 gives archapeligo
530 if w<0 then waterSeed=12 else waterSeed=w : rem 20,15,0 is fairly balanced
540 if i<0 then islandTweak=5 else islandTweak=i : rem 0,12,5 gives more strange islands
550 if c<1 and w<1 and i<1 then waterSeed=7 : islandTweak=15 : contenants=50
560 if mapx=-1 and mapy=-1 then W=200 : H=200 : p=xsize-W : mapx=xsize : mapy=ysize else W=mapx : H=mapy : p=1 : cls
570 if mapx<1 or mapx>xsize then mapx=xsize : W=mapx
580 if mapy<1 or mapy>ysize then mapy=ysize : H=mapy
990 t=ticks
1010 if xsize=640 then dim m(640,480,8)
1020 if xsize=800 then dim m(800,600,8)
1030 if xsize=1024 then dim m(1024,768,8)
1040 if xsize=1280 then dim m(1280,720,8)
2000 for Y=1 to H
2005  for X=p to mapx
2010   R=rnd(255) : G=rnd(255) : B=rnd(255) : A=rnd(255)
2020   rem print @1; : ? R;G;B;A;"             "
2110 rem  m(X,Y,1)=R : m(X,Y,2)=G : m(X,Y,3)=B : m(X,Y,4)=A
2120   m(X,Y,1)=64 : m(X,Y,2)=255 : m(X,Y,3)=64 : m(X,Y,4)=A : goto 2990
2710 rem  pen 1 : color 64,255,64,255 : if B>251 then gosub 3010
2720 rem  move X,Y : spot
2990  next X
2995 next Y
3000 goto 13990
3010 if X<p+1 or X>mapx-20 then return
3020 if Y<10 or Y>H-10 then return
3030 if contenants=0 then goto 3210 else c=abs(contenants)
3040 if c>H/2 then c=c/3
3050 cx=c : cy=H/2 : e=abs(ispeninsula)
3160 dx=X-p-cx : dy=cy-Y-cx+dx : if dx<0 and dy<0 and Y<cy then return
3170 if ~e then goto 3190 else dx=X-p-cx : dy=Y-cy-cx+dx : if dx<0 and dy<0 and Y>cy then return
3180 dx=mapx-cx-X : dy=cy-Y-cx+dx : if dx<0 and dy<0 and Y<cy then return
3190 dx=mapx-cx-X : dy=Y-cy-cx+dx : if dx<0 and dy<0 and Y>cy then return
3210 if islandTweak<1 then islands=0 else islands=rnd(islandTweak)
3220 r=waterSeed+islands : X=X+(int(r/2))+1
3230 rem pen r : color 128,128,255,255
3240 m(X,Y,1)=128 : m(X,Y,2)=128 : m(X,Y,3)=255 : m(X,Y,4)=0
3250 q=int(r/2) : if q<1 then q=1
3510 for i=1 to q
3520  if i=1 gosub 10010
3530  if i=2 gosub 10110
3540  if i>2 gosub 10210
3590 next
3960 return
10010 if X-1>0 then m(X-1,Y,1)=m(X,Y,1) : m(X-1,Y,2)=m(X,Y,2) : m(X-1,Y,3)=m(X,Y,3) : m(X-1,Y,4)=m(X,Y,4)
10020 if Y-1>0 then m(X,Y-1,1)=m(X,Y,1) : m(X,Y-1,2)=m(X,Y,2) : m(X,Y-1,3)=m(X,Y,3) : m(X,Y-1,4)=m(X,Y,4)
10030 if X+1<mapx then m(X+1,Y,1)=m(X,Y,1) : m(X+1,Y,2)=m(X,Y,2) : m(X+1,Y,3)=m(X,Y,3) : m(X+1,Y,4)=m(X,Y,4)
10040 if Y+1<mapy then m(X,Y+1,1)=m(X,Y,1) : m(X,Y+1,2)=m(X,Y,2) : m(X,Y+1,3)=m(X,Y,3) : m(X,Y+1,4)=m(X,Y,4)
10050 return
10110 if X-1>0 and Y-1>0 then m(X-1,Y-1,1)=m(X,Y,1) : m(X-1,Y-1,2)=m(X,Y,2) : m(X-1,Y-1,3)=m(X,Y,3) : m(X-1,Y-1,4)=m(X,Y,4)
10120 if X+1<mapx and Y-1>0 then m(X+1,Y-1,1)=m(X,Y,1) : m(X+1,Y-1,2)=m(X,Y,2) : m(X+1,Y-1,3)=m(X,Y,3) : m(X+1,Y-1,4)=m(X,Y,4)
10130 if X+1<mapx and Y+1<mapy then m(X+1,Y+1,1)=m(X,Y,1) : m(X+1,Y+1,2)=m(X,Y,2) : m(X+1,Y+1,3)=m(X,Y,3) : m(X+1,Y+1,4)=m(X,Y,4)
10140 if X-1>0 and Y+1<mapy then m(X-1,Y+1,1)=m(X,Y,1) : m(X-1,Y+1,2)=m(X,Y,2) : m(X-1,Y+1,3)=m(X,Y,3) : m(X-1,Y+1,4)=m(X,Y,4)
10150 return
10210 d=i-1 : r=int(i/2) 
10220 if (i/2)=abs(i/2) then goto 10510
10230 dxl=X-d : dxr=X+d : dyu=Y-d : dyd=Y+d 
10240 rxl=X-r : rxr=X+r : ryu=Y-r : ryd=Y+r 
10310 if dxl>0 then goto 10320
10311  if ryu>0 then for dxy=X to ryu : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
10312  if ryd=<mapy then for dxy=X to ryd : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
10320 if dyu>0 then goto 10330
10321  if rxl>0 then for dxy=X to rxl : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
10322  if rxr=<mapx then for dxy=X to rxr : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
10330 if dxr=<mapx then 10340
10331  if ryu>0 then for dxy=X to ryu : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
10332  if ryd=<mapy then for dxy=X to ryd : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
10340 if dyd>0 then goto 10345
10341  if rxl>0 then for dxy=X to rxl : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
10342  if rxr=<mapx then for dxy=X to rxr : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
10345 return
10510


11250 return
11310 
13990 pen 1
14000 for Y=1 to H
14005  for X=p to mapx
14010   R=rnd(255) : G=rnd(255) : B=rnd(255) : A=rnd(255)
14020   rem print @1; : ? R;G;B;A;"             "
14110   rem if B<60 then color R,G,B,255 : move X,Y : spot
14120   if B<60 then m(X,Y,1)=R : m(X,Y,2)=G : m(X,Y,3)=B : m(X,Y,4)=A
14290  next X
14295 next Y
14910 print ticks-t
14950 a$=inkey$ : if a$="" then goto 14950
14990 t=ticks
15000 for Y=1 to H
15005  for X=p to mapx
15100   color m(X,Y,1),m(X,Y,2),m(X,Y,3) : move X,Y : spot
15290  next X
15295 next Y
25000 a$=inkey$ : if a$="" then goto 25000 
25010 cls : home : goto 100
