10 cls : dmi=0
100 print "map data generator, civilization style"
110 input "map width  (-1 for minimap)";mapx
120 input "map height (-1 for minimap)";mapy
130 input "contenant is a peninsula (0 no):";e
135 input "indent map border (0-25):";b
140 print "minipam contenants to 20, 10 is nice, 0 is ok to: 50,7,15 default"
150 print "keep Seed and Tweak opposites - Large (<20) & Small (>0) or S & L"
160 print "try:  0,12,5  0,2,15  50,1,5  50,2,7  30,3,0  0,12,0  20,0,7"
170 input "contenant extends (50-150):";c
180 input "lots of water (0-25):";w
190 input "chance of islands (0-25):";i
399 rem mapx=-1 : mapy=-1
510 if c<1 then contenants=50 else contenants=c : rem 10,2,15 gives archapeligo
515 if b<1 then borders=0 else borders=b : rem 10,2,15 gives archapeligo
520 if e<1 then ispeninsula=0 else ispeninsula=1 : rem 10,2,15 gives archapeligo
530 if w<1 then waterSeed=12 else waterSeed=w : rem 20,15,0 is fairly balanced
540 if i<1 then islandTweak=5 else islandTweak=i : rem 0,12,5 gives more strange islands
550 if c<1 and b<1 and w<1 and i<1 then waterSeed=2 : islandTweak=5 : contenants=50 : borders=5
560 if mapx=-1 and mapy=-1 then W=200 : H=200 : p=xsize-W : mapx=xsize : mapy=ysize else W=mapx : H=mapy : p=1 : cls
570 if mapx<1 or mapx>xsize then mapx=xsize : W=mapx
580 if mapy<1 or mapy>ysize then mapy=ysize : H=mapy
990 t=ticks
1005 if dmi>0 then goto 1045 else dmi=1
1010 if xsize=640 then dim m(640,480,8)
1020 if xsize=800 then dim m(800,600,8)
1030 if xsize=1024 then dim m(1024,768,8)
1040 if xsize=1280 then dim m(1280,720,8)
1045 rem skip
2000 for Y=1 to H
2005  for X=p to mapx
2010   R=rnd(255) : G=rnd(255) : B=rnd(255) : A=rnd(255)
2020   rem print @1; : ? R;G;B;A;"             "
2110 rem  m(X,Y,1)=R : m(X,Y,2)=G : m(X,Y,3)=B : m(X,Y,4)=A
2120 rem  m(X,Y,1)=64 : m(X,Y,2)=255 : m(X,Y,3)=64 : m(X,Y,4)=A : goto 2990
2130   if m(X,Y,1)=128 and m(X,Y,2)=128 and m(X,Y,3)=255 and m(X,Y,4)=0 then goto 2990
2140   m(X,Y,1)=64 : m(X,Y,2)=255 : m(X,Y,3)=64 : m(X,Y,4)=A : if B>251 then gosub 3010
2710 rem  pen 1 : color 64,255,64,255 : if B>251 then gosub 3010
2720 rem  move X,Y : spot
2990  next X
2995 next Y
3000 goto 13990
3010 if X<p+borders or X>mapx-borders then return
3020 if Y<borders or Y>H-borders then return
3030 if contenants=0 then goto 3210 else c=abs(contenants)
3040 if c>H/2 then c=c/3
3050 cx=c : cy=H/2 : e=ispeninsula
3160 dx=X-p-cx : dy=cy-Y-cx+dx : if dx<0 and dy<0 and Y<cy then return
3170 if e=1 then goto 3190 else dx=X-p-cx : dy=Y-cy-cx+dx : if dx<0 and dy<0 and Y>cy then return
3180 dx=mapx-cx-X : dy=cy-Y-cx+dx : if dx<0 and dy<0 and Y<cy then return
3190 dx=mapx-cx-X : dy=Y-cy-cx+dx : if dx<0 and dy<0 and Y>cy then return
3210 if islandTweak<1 then islands=0 else islands=rnd(islandTweak)
3220 r=waterSeed+islands : rem X=X+(int(r/2))+1
3230 rem pen r : color 128,128,255,255
3240 m(X,Y,1)=128 : m(X,Y,2)=128 : m(X,Y,3)=255 : m(X,Y,4)=0
3250 rem q=int(r/2) : if q<1 then q=1
3251 q=r
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
10220 if (i/2)=abs(i/2) then goto 11210
10230 dxl=X-d : dxr=X+d : dyu=Y-d : dyd=Y+d 
10240 rxl=X-r : rxr=X+r : ryu=Y-r : ryd=Y+r
10310 if dxl<1 then goto 10320
10312  if ryu>0 then for dxy=ryu to Y : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
10314  if ryd<=mapy then for dxy=Y to ryd : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
10320 if dyu<1 then goto 10330
10322  if rxl>0 then for dxy=rxl to X : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
10324  if rxr<=mapx then for dxy=X to rxr : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
10330 if dxr>mapx then goto 10340
10332  if ryu>0 then for dxy=ryu to Y : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
10334  if ryd<=mapy then for dxy=Y to ryd : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
10340 if dyd>mapy then goto 10345
10342  if rxl>0 then for dxy=rxl to X : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
10344  if rxr<=mapx then for dxy=X to rxr : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
10345 return
11210 rem *** FIXME: this one needs to do increasing corners ***
11230 dxl=X-d : dxr=X+d : dyu=Y-d : dyd=Y+d 
11240 rxl=X-r : rxr=X+r : ryu=Y-r : ryd=Y+r 
11310 if dxl<1 then goto 11320
11312  if ryu>0 then for dxy=ryu to Y : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
11314  if ryd<=mapy then for dxy=Y to ryd : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
11320 if dyu<1 then goto 11330
11321 rem print rxl;dyu,X;Y,rxr;dyu
11322  if rxl>0 then for dxy=rxl to X : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
11324  if rxr<=mapx then for dxy=X to rxr : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
11330 if dxr>mapx then goto 11340
11332  if ryu>0 then for dxy=ryu to Y : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
11334  if ryd<=mapy then for dxy=Y to ryd : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
11340 if dyd>mapy then goto 11345
11342  if rxl>0 then for dxy=rxl to X : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
11344  if rxr<=mapx then for dxy=X to rxr : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
11345 return
13990 pen 1
14000 for Y=1 to H
14005  for X=p to mapx
14010   R=rnd(255) : G=rnd(255) : B=rnd(255) : A=rnd(255)
14020   rem print @1; : ? R;G;B;A;"             "
14110   rem if B<60 then color R,G,B,255 : move X,Y : spot
14120   if B<60 then m(X,Y,1)=R : m(X,Y,2)=G : m(X,Y,3)=B : m(X,Y,4)=A
14290  next X
14295 next Y
14910 t=ticks-t
14950 rem a$=inkey$ : if a$="" then goto 14950
15000 for Y=1 to H
15005  for X=p to mapx
15100   color m(X,Y,1),m(X,Y,2),m(X,Y,3) : move X,Y : spot
15290  next X
15295 next Y
15300 print t
24000 a$=inkey$ : if a$="" then goto 24000 
24010 print "clearing data ..."
25000 for Y=1 to H
25005  for X=p to mapx
25100   m(X,Y,1)=0 : m(X,Y,2)=0 : m(X,Y,3)=0 : m(X,Y,4)=0
25290  next X
25295 next Y
25300 print t
26010 cls : home : goto 100
