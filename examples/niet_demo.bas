1 rem CIV_INTRO.BAS - nietCiv Intro
2 rem uses buildings icons to generate a background with 2 cities
3 rem we generate a minimap first so its always random
10 cls : dim cP(16,4)
15 rem * predefines *
20 firstPass=1 : dmi=0 : ' var dmi = dim map initialized
25 waterSeed=2 : islandTweak=5 : contenants=50 : borders=5 : ispeninsula=1
30 W=200 : H=200 : p=xsize-W : mapx=xsize : mapy=ysize : ' minimap
35 wsize=xsize-200 : hsize=ysize : grid=-1 : gwidth=1
40 T=7 : S=3
45 getDrawVars=1 : drawArea=1 : drawMap=1 : redrawWin=0 : drawText=1 : drawLogo=1
50 rem ** colors ** Dawnbringer16 **
51 cP(1,1)=78 : cP(1,2)=78 : cP(1,3)=78 : cP(1,4)=128 : rem  1 - dark gray
52 cP(2,1)=68 : cP(2,2)=36 : cP(2,3)=52 : cP(2,4)=128 : rem  2 - brown
53 cP(3,1)=48 : cP(3,2)=52 : cP(3,3)=109 : cP(3,4)=128 : rem  3 - blue
54 cP(4,1)=133 : cP(4,2)=76 : cP(4,3)=48 : cP(4,4)=128 : rem  4 - medium brown
55 cP(5,1)=52 : cP(5,2)=101 : cP(5,3)=36 : cP(5,4)=128 : rem  5 - dark green
56 cP(6,1)=117 : cP(6,2)=113 : cP(6,3)=97 : cP(6,4)=128 : rem  6 - medium gray
57 cP(7,1)=208 : cP(7,2)=70 : cP(7,3)=72 : cP(7,4)=128 : rem  7 - medium red
58 cP(8,1)=89 : cP(8,2)=125 : cP(8,3)=206 : cP(8,4)=128 : rem  8 - bright blue
59 cP(9,1)=210 : cP(9,2)=125 : cP(9,3)=44 : cP(9,4)=128 : rem  9 - medium orange
60 cP(10,1)=109 : cP(10,2)=170 : cP(10,3)=44 : cP(10,4)=128 : rem 10 - bright green
61 cP(11,1)=133 : cP(11,2)=149 : cP(11,3)=161 : cP(11,4)=128 : rem 11 - light grey
62 cP(12,1)=210 : cP(12,2)=170 : cP(12,3)=153 : cP(12,4)=128 : rem 12 - medium pink
63 cP(13,1)=109 : cP(13,2)=194 : cP(13,3)=202 : cP(13,4)=128 : rem 13 - light blue
64 cP(14,1)=218 : cP(14,2)=212 : cP(14,3)=94 : cP(14,4)=128 : rem 14 - light yellow
65 cP(15,1)=20 : cP(15,2)=12 : cP(15,3)=28 : cP(15,4)=128 : rem 15 - near black
66 cP(16,1)=222 : cP(16,2)=238 : cP(16,3)=212 : cP(16,4)=128 : rem 16 - off white
100 rem * items *
110 vBoat=0 : vHorse=0  
1000 rem * dimension map based on screen size *
1010 if dmi>0 then goto 1111 else dmi=1
1011 if xsize=640 then dim m(640,480,8)
1012 if xsize=800 then dim m(800,600,8)
1013 if xsize=1024 then dim m(1024,768,8)
1014 if xsize=1280 then dim m(1280,720,8)
1015 if xsize=1360 then dim m(1360,768,8)
1099 goto 2011
1100 rem * clear map data *
1111 for Y=1 to H
1122  for X=p to mapx
1150   m(X,Y,1)=0 : m(X,Y,2)=0 : m(X,Y,3)=0 : m(X,Y,4)=0
1182  next X
1191 next Y
2000 rem * generate land and water *
2011 for Y=1 to H
2022  for X=p to mapx
2030   R=rnd(255) : G=rnd(255) : B=rnd(255) : A=rnd(255)
2040   if m(X,Y,1)=128 and m(X,Y,2)=128 and m(X,Y,3)=255 and m(X,Y,4)=0 then goto 2082
2050   m(X,Y,1)=64 : m(X,Y,2)=255 : m(X,Y,3)=64 : m(X,Y,4)=A : if B>251 then gosub 2110
2082  next X
2091 next Y
2099 goto 3600 : ' map gen done; jump to next part
2100 rem * the water randomizer *
2110 if X<p+borders or X>mapx-borders then return
2120 if Y<borders or Y>H-borders then return
2130 if contenants=0 then goto 2210 else c=abs(contenants)
2140 if c>H/2 then c=int(c/3)
2150 cx=c : cy=H/2 : e=ispeninsula
2160 dx=X-p-cx : dy=cy-Y-cx+dx : if dx<0 and dy<0 and Y<cy then return
2170 if e=1 then goto 2190 else dx=X-p-cx : dy=Y-cy-cx+dx : if dx<0 and dy<0 and Y>cy then return
2180 dx=mapx-cx-X : dy=cy-Y-cx+dx : if dx<0 and dy<0 and Y<cy then return
2190 dx=mapx-cx-X : dy=Y-cy-cx+dx : if dx<0 and dy<0 and Y>cy then return
2210 if islandTweak<1 then islands=0 else islands=rnd(islandTweak)
2220 r=waterSeed+islands
2240 m(X,Y,1)=128 : m(X,Y,2)=128 : m(X,Y,3)=255 : m(X,Y,4)=0
2250 q=r : ' var r = pen radius for graphics; not used
2300 rem * diffent fill algorythm for different radius *
2310 for i=1 to q
2320  if i=1 gosub 3010
2330  if i=2 gosub 3110
2340  if i>2 gosub 3210
2350 next
2360 return
3000 rem * fill radius=1 algorythm *
3010 if X-1>0 then m(X-1,Y,1)=m(X,Y,1) : m(X-1,Y,2)=m(X,Y,2) : m(X-1,Y,3)=m(X,Y,3) : m(X-1,Y,4)=m(X,Y,4)
3020 if Y-1>0 then m(X,Y-1,1)=m(X,Y,1) : m(X,Y-1,2)=m(X,Y,2) : m(X,Y-1,3)=m(X,Y,3) : m(X,Y-1,4)=m(X,Y,4)
3030 if X+1<mapx then m(X+1,Y,1)=m(X,Y,1) : m(X+1,Y,2)=m(X,Y,2) : m(X+1,Y,3)=m(X,Y,3) : m(X+1,Y,4)=m(X,Y,4)
3040 if Y+1<mapy then m(X,Y+1,1)=m(X,Y,1) : m(X,Y+1,2)=m(X,Y,2) : m(X,Y+1,3)=m(X,Y,3) : m(X,Y+1,4)=m(X,Y,4)
3050 return
3100 rem * fill radius=2 algorythm *
3110 if X-1>0 and Y-1>0 then m(X-1,Y-1,1)=m(X,Y,1) : m(X-1,Y-1,2)=m(X,Y,2) : m(X-1,Y-1,3)=m(X,Y,3) : m(X-1,Y-1,4)=m(X,Y,4)
3120 if X+1<mapx and Y-1>0 then m(X+1,Y-1,1)=m(X,Y,1) : m(X+1,Y-1,2)=m(X,Y,2) : m(X+1,Y-1,3)=m(X,Y,3) : m(X+1,Y-1,4)=m(X,Y,4)
3130 if X+1<mapx and Y+1<mapy then m(X+1,Y+1,1)=m(X,Y,1) : m(X+1,Y+1,2)=m(X,Y,2) : m(X+1,Y+1,3)=m(X,Y,3) : m(X+1,Y+1,4)=m(X,Y,4)
3140 if X-1>0 and Y+1<mapy then m(X-1,Y+1,1)=m(X,Y,1) : m(X-1,Y+1,2)=m(X,Y,2) : m(X-1,Y+1,3)=m(X,Y,3) : m(X-1,Y+1,4)=m(X,Y,4)
3150 return
3200 rem * fill radius>2 algorythm *
3210 d=i-1 : r=int(i/2) 
3220 if (i/2)=abs(i/2) then goto 3410 : ' var i = radius; is it even number?
3230 dxl=X-d : dxr=X+d : dyu=Y-d : dyd=Y+d 
3240 rxl=X-r : rxr=X+r : ryu=Y-r : ryd=Y+r
3300 rem * fill radius=odd algorythm *
3310 if dxl<1 then goto 3320
3312  if ryu>0 then for dxy=ryu to Y : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
3314  if ryd<=mapy then for dxy=Y to ryd : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
3320 if dyu<1 then goto 3330
3322  if rxl>0 then for dxy=rxl to X : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
3324  if rxr<=mapx then for dxy=X to rxr : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
3330 if dxr>mapx then goto 3340
3332  if ryu>0 then for dxy=ryu to Y : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
3334  if ryd<=mapy then for dxy=Y to ryd : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
3340 if dyd>mapy then goto 3345
3342  if rxl>0 then for dxy=rxl to X : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
3344  if rxr<=mapx then for dxy=X to rxr : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
3345 return
3400 rem * fill radius=even algorythm *
3410 rem *** FIXME: this one needs to do increasing corners, not sides ***
3430 dxl=X-d : dxr=X+d : dyu=Y-d : dyd=Y+d 
3440 rxl=X-r : rxr=X+r : ryu=Y-r : ryd=Y+r 
3510 if dxl<1 then goto 3520
3512  if ryu>0 then for dxy=ryu to Y : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
3514  if ryd<=mapy then for dxy=Y to ryd : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
3520 if dyu<1 then goto 3530
3521 rem print rxl;dyu,X;Y,rxr;dyu
3522  if rxl>0 then for dxy=rxl to X : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
3524  if rxr<=mapx then for dxy=X to rxr : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
3530 if dxr>mapx then goto 3540
3532  if ryu>0 then for dxy=ryu to Y : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
3534  if ryd<=mapy then for dxy=Y to ryd : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
3540 if dyd>mapy then goto 3545
3542  if rxl>0 then for dxy=rxl to X : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
3544  if rxr<=mapx then for dxy=X to rxr : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
3545 return
3600 rem * generate special resources *
3611 for Y=1 to H
3622  for X=p to mapx
3630   R=rnd(255) : G=rnd(255) : B=rnd(255) : A=rnd(255)
3650   if B<60 then m(X,Y,1)=R : m(X,Y,2)=G : m(X,Y,3)=B : m(X,Y,4)=A
3682  next X
3691 next Y
3700 rem * preload city *
3705 X=p+abs(contenants) : Y=int(H/2)
3710 if m(X,Y,1)=128 and m(X,Y,2)=128 and m(X,Y,3)=255 then X=X-1 : goto 3710
3715 if m(X,Y,1)=64 and m(X,Y,2)=255 and m(X,Y,3)=64 then goto 3720 else Y=Y-1 : goto 3710
3720 if m(X-1,Y,1)=128 and m(X-1,Y,2)=128 and m(X-1,Y,3)=255 and m(X+1,Y,1)=128 and m(X+1,Y,2)=128 and m(X+1,Y,3)=255 and m(X,Y-1,1)=128 and m(X,Y-1,2)=128 and m(X,Y-1,3)=255 and m(X,Y+1,1)=128 and m(X,Y+1,2)=128 and m(X,Y+1,3)=255 then X=X-2 : Y=Y-2 : goto 3710
3730 xmap=X : ymap=Y : mapOX=mapx : mapOY=mapy
3740 m(X,Y,1)=255 : m(X,Y,2)=255 : m(X,Y,3)=255 : ' white dot for city on intro screen, thats our "center"
3750 Player$="I" : vBoat=1
3799 goto 8010 : ' setup done; jump to main part
3800 rem * get display area *
3810 OX=0 : OY=0 : G=(grid*gwidth) : CR=S*5
3911 if T=1 then CX=((5*S)*2)+G : CY=((5*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-1
3922 if T=2 then OY=10 : CX=((7*S)*2)+G : CY=((3.5*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-2
3933 if T=3 then OX=10 : OY=10 : CX=((9*S)*2)+G : CY=((3*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-2 : if G=0 then OX=-10
3944 if T=4 then OX=10 : OY=10 : CX=((10*S)*2)+G : CY=((2.5*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-2 : if G=0 then OX=-15
3955 if T=5 then CX=((5*S)*2)+G : CY=((5*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-1
3966 if T=6 then OY=5 : CX=((6*S)*2)+G : CY=((5*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-1
3977 if T=7 then OX=0 : OY=10 : CX=((5*S)*2)+G : CY=((5*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-1 : if G=0 then OX=-8 : OY=7
3978 if T=7 and G<0 then OX=-7
3995 drawX=xmap-int(mapw/2)-1 : drawY=ymap-int(maph/2)-1
3999 return
5000 rem * clear display area *
5005 color 0,0,0,255 : box int(wsize/2),int(hsize/2),int(wsize/2),int(hsize/2) : ' clear draw area
5099 return
5100 rem * display map area *
5110 pen 1 
5201 for i=1 to maph
5212  for j=1 to mapw
5220   dX=drawX+j : dY=drawY+i : dH=dY/2
5230   if dX<1 or dY<1 then goto 5982
5231   if dX>mapx or dY>mapy then goto 5982
5240   color m(dX,dY,1),m(dX,dY,2),m(dX,dY,3),128
5315   if T=1 then gosub 6010
5325   if T=2 then gosub 6020
5335   if T=3 then gosub 6030
5345   if T=4 then gosub 6040
5355   if T=5 then gosub 6050
5365   if T=6 then gosub 6060
5375   if T=7 then gosub 6070
5410   if dX=xmap and dY=ymap then pen 3 : R=255 : G=255 : B=255 : A=128 : x$=Player$ : gosub 40017
5982  next
5991 next
5995 if drawLogo then gosub 6600
5998 drawArea=0
5999 return
6000 rem * map tile types *
6010 X=OX+((5*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 6101
6015 goto 6110
6020 X=OX+((7*S)*j*2) : Y=OY+((3.5*S)*i*2) : gosub 6101
6022 if dH=int(dh) then X=X+(7*S)
6025 goto 6150
6030 X=OX+((9*S)*j*2) : Y=OY+((3*S)*i*2) : gosub 6101
6032 if dH=int(dh) then X=X+(9*S)
6035 goto 6130
6040 X=OX+((10*S)*j*2) : Y=OY+((2.5*S)*i*2) : gosub 6101
6042 if dH=int(dh) then X=X+(10*S)
6045 goto 6140
6050 X=OX+((5*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 6101
6055 goto 6120
6060 X=OX+((6*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 6101
6062 if dH=int(dh) then X=X+(6*S)
6065 goto 6120
6070 X=OX+((5*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 6101
6072 if (i/2)=int(i/2) then X=X+(5*S)
6073 if (j/2)=int(j/2) then Y=Y-(5*S)
6075 goto 6120
6101 if grid=-1 then X=X-(gwidth*J) : Y=Y-(gwidth*I) : return
6102 if grid=1 then X=X+(gwidth*J) : Y=Y+(gwidth*I) : return
6103 return
6110 box X,Y,S*5,S*5 : return
6120 disc X,Y,S*7 : return
6130 shinit:shline X-(S*6),Y:shline X-(S*3),Y-(S*6):shline X+(S*3),Y-(S*6):shline X+(S*6),Y:shline X+(S*3),Y+(S*6):shline X-(S*3),Y+(S*6):shdone : return
6140 shinit:shline X-(S*7),Y:shline X-(S*3),Y-(S*5):shline X+(S*3),Y-(S*5):shline X+(S*7),Y:shline X+(S*3),Y+(S*5):shline X-(S*3),Y+(S*5):shdone : return
6150 shinit:shline X-(S*7),Y:shline X,Y-(S*7):shline X+(S*7),Y:shline X,Y+(S*7):shdone : return
6600 rem * logo *
6660 rem X=xsize/2 : Y=ysize/2 : Y=Y+50 : L=150
6661 rem L=150 : K=25 : X=xsize-L-5 : Y=ysize-K-5
6662 L=150 : K=25 : X=L+5 : Y=ysize-K-5
6670 color 0,0,255,128 : box X,Y,L,K round 5 : color 255,255,0,255 : pen 3 : rect X,Y,L,K round 5
6680 S1$="NietCiv XVIII" : S2$=" NIETCIV  2018" : e=len(S2$) : iR=1 : X=X-L
6690 R=255 : G=255 : B=255 : A=255 : ' text color
6711 for i=1 to e
6720  X=X+((3*S)*2)
6730  x$=mid$(S2$,i,1) : if x$=" " then goto 6791
6740  il=asc(x$)-64 : if iL<1 then iL=iL+64-47+26
6760  R=128 : G=128 : B=128 : A=128 : pen 3 : X=X+4 : Y=Y+3 : if iR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
6760  R=255 : G=255 : B=0 : A=255 : pen 3 : X=X-4 : Y=Y-3 : if iR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
6770  R=0 : G=0 : B=255 : A=255 : pen 1 : X=X+1 : if iR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
6791 next
6799 return
6800 rem * display minimap *
6805 color 0,0,0,255 : box p+int(W/2),int(H/2),int(W/2),int(H/2) : ' clear mini map
6810 pen 1
6821 for Y=1 to H
6832  for X=p to mapx
6840   color m(X,Y,1),m(X,Y,2),m(X,Y,3),128 : move X,Y : spot
6882  next X
6891 next Y
6895 rem color 255,255,255,128 : pen 1 : rect xmap,ymap,int(mapw/2),int(maph/2)
6898 drawMap=0
6899 return
6900 rem * clear text area *
6910 color 0,0,0,255 : box p+int(W/2),H+int((ysize-H)/2),int(W/2),int((ysize-H)/2) : ' clear mini map
6999 return
7000 rem * display key text *
7010 OS=S : S=1.5 : R=0 : G=128 : B=0 : A=128 : pen 1
7020 X=p+10 : Y=H+20 :        S$="ARROWS         MOVE" : gosub 40009
7030 X=p+10 : Y=Y+((3*S)*4) : S$="0             RESET" : gosub 40009
7040 X=p+10 : Y=Y+((3*S)*4) : S$="1 7           TILES" : gosub 40009
7050 X=p+10 : Y=Y+((3*S)*4) : S$="SPACE         CYCLE" : gosub 40009
7060 X=p+10 : Y=Y+((3*S)*4) : S$="PLUS MINUS    WIDTH" : gosub 40009
7070 X=p+10 : Y=Y+((3*S)*4) : S$="BRACKETS     BORDER" : gosub 40009
7080 X=p+10 : Y=Y+((3*S)*4) : S$="ENTER       NEW MAP" : gosub 40009
7190 S=OS
7198 drawText=0
7199 return
7200 rem * undraw map window *
7210 drawX=oldX-int(mapw/2)-1 : drawY=oldY-int(maph/2)-1 : pen 1
7230 jx=mapw+2
7240 iy=maph+2
7321 for i=1 to iy
7332  for j=1 to jx
7340 rem  if i=1 or j=1 then goto 7370
7350 rem  if i=iy or j=jx then goto 7370
7360 rem  goto 7412
7370   X=drawX+j : Y=drawY+i : move X,Y
7375   if X<p or Y<1 then goto 7412
7376   if X>mapx or Y>H then goto 7412
7380   color 0,0,0 : spot
7390   color m(X,Y,1),m(X,Y,2),m(X,Y,3),128 : spot
7412  next
7421 next
7499 return
7500 rem * draw map window *
7510 drawX=xmap-int(mapw/2) : drawY=ymap-int(maph/2) : pen 1
7530 jx=mapw
7540 iy=maph
7621 for i=1 to iy
7632  for j=1 to jx
7640   if i=1 or j=1 then goto 7670
7650   if i=iy or j=jx then goto 7670
7660   goto 7712
7670   X=drawX+j : Y=drawY+i : move X,Y
7675   if X<p or Y<1 then goto 7712
7676   if X>mapx or Y>H then goto 7712
7680   color 255,255,255,128 : spot
7712  next
7721 next
7798 redrawWin=0
7799 return
8000 rem * main loop *
8005 update
8010 if redrawWin then gosub 7210
8020 if getDrawVars then gosub 3810 : ' set display area variables
8030 if drawArea or redrawWin then if firstPass then gosub 5110 else gosub 5005 : gosub 5110
8040 if drawText then gosub 6910 : gosub 7010
8050 if drawMap then if firstPass then gosub 6810 : gosub 7510 else gosub 6805 : gosub 7510
8060 if redrawWin or firstPass then gosub 7510
9998 firstPass=0
10005 oldX=xmap : oldY=ymap : move 1,1 : KC=0
10010 gosub 40003
10020 if MB>0 then goto 39001
10030 if KP then KC=K
10020 if KC=-1 and Mgoto then goto 39015
10030 if KC=-1 then goto 10010
10040 if KC>399 then goto 10200
10110 if KC=13 then getDrawVars=1 : drawArea=1 : drawText=1 : drawMap=1 : goto 1000
10120 if KC=91 then grid=grid-1 : getDrawVars=1 : redrawWin=1 : if grid<-1 then grid=-1
10130 if KC=93 then grid=grid+1 : getDrawVars=1 : redrawWin=1 : if grid>1 then grid=1
10140 if KC=45 then gwidth=gwidth-1 : getDrawVars=1 : redrawWin=1 : if gwidth<0 then gwidth=0
10150 if KC=43 or KC=61 then gwidth=gwidth+1 : getDrawVars=1 : redrawWin=1 : if gwidth>100 then gwidth=100
10160 if KC=48 then gwidth=1 : grid=0 : mapx=mapOX : may=mapOY : getDrawVars=1 : redrawWin=1
10170 if KC=32 then T=T+1 : getDrawVars=1 : drawArea=1 : if T>7 then T=1
10180 if KC>48 and KC<56 then T=KC-48 : getDrawVars=1 : redrawWin=1
10199 rem * direction keys *
10200 if KC=400 then on T gosub 29994,29994,29983,29983,29994,29994,29994
10201 if KC=401 then on T gosub 29995,29995,29982,29982,29995,29995,29995
10202 if KC=402 then on T gosub 29996,29998,29998,29998,29996,29996,29996
10203 if KC=403 then on T gosub 29997,29999,29999,29999,29997,29997,29997
10204 if KC=404 then on T gosub 29990,29996,29981,29981,29990,29981,29990
10205 if KC=405 then on T gosub 29991,29997,29982,29982,29991,29982,29991
10206 if KC=406 then on T gosub 29992,29992,29983,29983,29992,29983,29992
10207 if KC=407 then on T gosub 29993,29993,29984,29984,29993,29984,29993
10208 K=KC
10319 rem print @1;KC
10320 goto 8000
29980 rem * tile movement *
29981 if ymap/2=int(ymap/2) then xmap=xmap+1 : ymap=ymap-1 : goto 30001 else ymap=ymap-1 : goto 30001
29982 if ymap/2=int(ymap/2) then xmap=xmap+1 : ymap=ymap+1 : goto 30001 else ymap=ymap+1 : goto 30001
29983 if ymap/2=int(ymap/2) then ymap=ymap-1 : goto 30001 else xmap=xmap-1 : ymap=ymap-1 : goto 30001 
29984 if ymap/2=int(ymap/2) then ymap=ymap+1 : goto 30001 else xmap=xmap-1 : ymap=ymap+1 : goto 30001
29990 xmap=xmap+1 : ymap=ymap-1 : goto 30001
29991 xmap=xmap+1 : ymap=ymap+1 : goto 30001
29992 xmap=xmap-1 : ymap=ymap-1 : goto 30001
29993 xmap=xmap-1 : ymap=ymap+1 : goto 30001
29994 xmap=xmap-1 : goto 30001
29995 xmap=xmap+1 : goto 30001
29996 ymap=ymap-1 : goto 30001
29997 ymap=ymap+1 : goto 30001
29998 ymap=ymap-2 : goto 30001
29999 ymap=ymap+2 : goto 30001
30000 rem * check map movement *
30001 X=0 : Y=0 : redrawWin=1
30002 if xmap<p then xmap=p : redrawWin=0 : return
30003 if xmap>xsize then xmap=xsize : redrawWin=0 : return
30004 if ymap<1 then ymap=1 : redrawWin=0 : return
30005 if ymap>H then ymap=H : redrawWin=0 : return
30006 X=xmap : Y=ymap
30010 if (Player$="I" or Player$="H") and (m(X,Y,1)=128 and m(X,Y,2)=128 and m(X,Y,3)=255) and vBoat=0 then xmap=oldX : ymap=oldY : redrawWin=0 : return
30020 if (Player$="I" or Player$="H") and (m(X,Y,1)=128 and m(X,Y,2)=128 and m(X,Y,3)=255) and vBoat=1 then Player$="B"
30030 if Player$="B" and (m(X,Y,1)=64 and m(X,Y,2)=255 and m(X,Y,3)=64) then Player$="I"
30040 if Player$="B" and (m(X,Y,1)<>128 and m(X,Y,2)<>128 and m(X,Y,3)<>255) then xmap=oldX : ymap=oldY : redrawWin=0 : return
30051 if Player$="I" and (xmap<>oldX or ymap<>oldY) then tone 28,freq 330,wsin,vol 100,dur .01,fmul 1.0001
30052 if Player$="H" and (xmap<>oldX or ymap<>oldY) then tone 28,freq 330,wsaw,vol 100,dur .01,fmul 1.0001
30053 if Player$="B" and (xmap<>oldX or ymap<>oldY) then tone 28,freq 330,wtri,vol 100,dur .01,fmul 1.0001
30099 return
39000 rem * check area mouse click *
39001 if MX>wsize and MY>H then goto 39101 else Mgoto=1
39002 if MX>wsize then Xgoto=MX : Ygoto=MY
39003 if MX<wsize then Xgoto=xmap-int(mapw/2)+int(MX/CX)-1 : Ygoto=ymap-int(maph/2)+int(MY/CY)-1
39015 if Xgoto=xmap and Ygoto=ymap then Mgoto=0 : Xgoto=0 : Ygoto=0 : goto 10005
39016 if Xgoto=0 and Ygoto=0 then Mgoto=0 : goto 10005
39025 if Xgoto>0 and Xgoto<xmap then xmap=xmap-1 : gosub 30001 : if X=0 then Xgoto=0 else if xmap=oldX then xmap=xmap-1 : ymap=ymap-1 : gosub 30001
39026 if Xgoto>0 and Xgoto>xmap then xmap=xmap+1 : gosub 30001 : if X=0 then Xgoto=0 else if xmap=oldX then xmap=xmap+1 : ymap=ymap+1 : gosub 30001
39027 rem if xmap=Xgoto then Xgoto=0
39035 if Ygoto>0 and Ygoto<ymap then ymap=ymap-1 : gosub 30001 : if Y=0 then Ygoto=0 else if ymap=oldY then ymap=ymap-1 : xmap=xmap-1 : gosub 30001
39036 if Ygoto>0 and Ygoto>ymap then ymap=ymap+1 : gosub 30001 : if Y=0 then Ygoto=0 else if ymap=oldY then ymap=ymap+1 : xmap=xmap+1 : gosub 30001
39037 rem if ymap=Ygoto then Ygoto=0
39040 redrawWin=1
39049 goto 8000
39100 rem * check panel mouse click *
39101 goto 10005
40000 rem -= START: SUPPORT =-
40001 rem 40003,40005,40009
40002 rem -=_*_=- INPUTS
40003 MB=mouseb : MX=mousex : MY=mousey : KP=key(K) : KC=keycode : return
40004 rem -=_*_=- ARRAY2COLOR
40005 R=cP(cC,1) : G=cP(cC,2) : B=cP(cC,3) : A=cP(cC,4) : color R,G,B,A : return
40006 fR=cP(cC,1) : fG=cP(cC,2) : fB=cP(cC,3) : fA=cP(cC,4) : color fR,fG,fB,fA : return
40007 bR=cP(cC,1) : bG=cP(cC,2) : bB=cP(cC,3) : bA=cP(cC,4) : color bR,bG,bB,bA : return
40008 rem -=_*_=- DISPLAYTEXT
40009 for xi=1 to len(S$)
40010  X=X+((3*S)*2)
40011  x$=mid$(S$,xi,1) : if x$=" " then goto 40014
40012  iL=asc(x$)-64 : if iL<1 then iL=iL+64-47+26
40013  if iR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
40014 next
40015 return
40016 rem -=_*_=- DISPLAYCHAR
40017 iL=asc(x$)-64 : if iL<1 then iL=iL+64-47+26
40018 if iR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
40019 return
49998 rem -= END: SUPPORT =-
49999 rem                                       0123456789
150000 rem -= START: FONTS =-
150001 rem 150004,150078,150152,150226,150300
150002 rem -=_*_=- NEON 
150003 rem *** A - attack ***
150004 color R,G,B,A : move X-(3*S),Y+(3*S) : line X,Y-(3*S) : line X+(3*S),Y+(3*S) : move X-(2*S),Y+(1*S) : line X+(2*S),Y+(1*S): return
150005 rem *** B - build ***
150006 color R,G,B,A : move X+(1*S),Y+(3*S) : line X-(3*S),Y+(3*S) : line X-(3*S),Y-(3*S) : line X,Y-(3*S) : move X+(1*S),Y : line X-(3*S),Y : arc X,Y-(1.5*S),1.5*S,90,-180 : arc X+(1*S),Y+(1.5*S),1.5*S,90,-180 : return
150007 rem *** C - collect ***
150008 color R,G,B,A : move X-(3*S),Y+(2*S) : arc X,Y,3*S,180,130 : arc X,Y,3*S,180,-130 : return
150009 rem *** D - destroy ***
150010 color R,G,B,A : move X-(1*S),Y+(3*S) : line X-(3*S),Y+(3*S) : line X-(3*S),Y-(3*S) : line X-(1*S),Y-(3*S) : arc X-(1*S),Y,3*S,90,-180 : return
150011 rem *** E - eye ***
150012 color R,G,B,A : move X+(2*S),Y+(3*S) : line X-(3*S),Y+(3*S) : line X-(3*S),Y-(3*S) : line X+(2*S),Y-(3*S) : move X+(1*S),Y : line X-(3*S),Y : return
150013 rem *** F - fish ***
150014 color R,G,B,A : move X-(3*S),Y+(3*S) : line X-(3*S),Y-(3*S) : line X+(2*S),Y-(3*S) : move X+(1*S),Y : line X-(3*S),Y : return
150015 rem *** G - goto ***
150016 color R,G,B,A : move X+(1*S),Y : line X+(3*S),Y : line X+(3*S),Y+(3*S) : arc X,Y,3*S,0,-180 : arc X,Y,3*S,180,-120 : return
150017 rem *** H - home ***
150018 color R,G,B,A : move X-(2.5*S),Y+(3*S) : line X-(2.5*S),Y-(3*S) : move X+(2.5*S),Y+(3*S) : line X+(2.5*S),Y-(3*S) : move X-(2.5*S),Y : line X+(2.5*S),Y : return
150019 rem *** I - irrigate ***
150020 color R,G,B,A : move X-(2*S),Y+(3*S) : line X+(2*S),Y+(3*S) : move X-(2*S),Y-(3*S) : line X+(2*S),Y-(3*S) : move X,Y-(3*S) : line X,Y+(3*S) : return
150021 rem *** J - square ***
150022 color R,G,B,A : move X-(2*S),Y-(3*S) : line X+(2*S),Y-(3*S) : move X,Y-(3*S) : line X,Y+(1*S) : arc X-(1.5*S),Y+(1*S),1.5*S,180,180 : return
150023 rem *** K - square ***
150024 color R,G,B,A : move X-(2*S),Y+(3*S) : line X-(2*S),Y-(3*S) : move X+(2*S),Y-(3*S) : line X-(2*S),Y : line X+(2*S),Y+(3*S) : return
150025 rem *** L - square ***
150026 color R,G,B,A : move X-(2*S),Y-(3*S) : line X-(2*S),Y+(3*S) : line X+(2*S),Y+(3*S) : return
150027 rem *** M - mark ***
150028 color R,G,B,A : move X-(3*S),Y+(3*S) : line X-(1.5*S),Y-(3*S) : line X,Y+(3*S) : line X+(1.5*S),Y-(3*S) : line X+(3*S),Y+(3*S) : return
150029 rem *** N - nuke ***
150030 color R,G,B,A : move X-(2.5*S),Y+(3*S) : line X-(2.5*S),Y-(3*S) : line X+(2.5*S),Y+(3*S) : line X+(2.5*S),Y-(3*S) : return
150031 rem *** O - nuke ***
150032 color R,G,B,A : arc X,Y,3*S,180,-180 : arc X,Y,3*S,0,-180 : return
150033 rem *** P - pillage ***
150034 color R,G,B,A : move X-(3*S),Y+(3*S) : line X-(3*S),Y-(3*S) : line X,Y-(3*S) : move X,Y : line X-(3*S),Y : arc X,Y-(1.5*S),1.5*S,90,-180 : return
150035 rem *** Q - nuke ***
150036 color R,G,B,A : move X+(1*S),Y+(1*S) : line X+(3*S),Y+(3*S) : arc X,Y,3*S,0,-180 : arc X,Y,3*S,180,-180 : return
150037 rem *** R - nuke ***
150038 color R,G,B,A : move X-(3*S),Y+(3*S) : line X-(3*S),Y-(3*S) : line X,Y-(3*S) : move X,Y : line X-(3*S),Y : line X+(1*S),Y+(3*S) : arc X,Y-(1.5*S),1.5*S,90,-180 : return
150039 rem *** S - stop ***
150040 color R,G,B,A : arc X,Y+(1.5*S),2*S,90,-270 : arc X,Y-(2*S),1.5*S,270,-270 : return
150041 rem *** T - square ***
150042 color R,G,B,A : move X-(2.5*S),Y-(3*S) : line X+(2.5*S),Y-(3*S) : move X,Y-(3*S) : line X,Y+(3*S) : return
150043 rem *** U - square ***
150044 color R,G,B,A : move X-(2.5*S),Y+(1*S) : line X-(2.5*S),Y-(3*S) : move X+(2.5*S),Y+(1*S) : line X+(2.5*S),Y-(3*S) : arc X,Y+(1*S),2.5*S,0,-180 : return
150045 rem *** V - square ***
150046 color R,G,B,A : move X-(2.5*S),Y-(3*S) : line X,Y+(3*S) : line X+(2.5*S),Y-(3*S) : return
150047 rem *** W - square ***
150048 color R,G,B,A : move X-(3*S),Y-(3*S) : line X-(1.5*S),Y+(3*S) : line X,Y-(3*S) : line X+(1.5*S),Y+(3*S) : line X+(3*S),Y-(3*S) : return
150049 rem *** X - square ***
150050 color R,G,B,A : move X-(2.5*S),Y-(3*S) : line X+(2.5*S),Y+(3*S) : move X-(2.5*S),Y+(3*S) : line X+(2.5*S),Y-(3*S) : return
150051 rem *** Y - square ***
150052 color R,G,B,A : move X-(2.5*S),Y-(3*S) : line X,Y : line X+(2.5*S),Y-(3*S) : move X,Y+(3*S) : line X,Y : return
150053 rem *** Z - square ***
150054 color R,G,B,A : move X-(2.5*S),Y-(3*S) : line X+(2.5*S),Y-(3*S) : line X-(2.5*S),Y+(3*S) : line X+(2.5*S),Y+(3*S) : return
150055 rem *** 0 - zero ***
150056 color R,G,B,A : move X-(2*S),Y+(2*S) : line X+(2*S),Y-(2*S) : arc X,Y,3*S,180,-180 : arc X,Y,3*S,0,-180 : return
150057 rem *** 1 - one ***
150058 color R,G,B,A : move X-(2*S),Y-(1*S) : line X,Y-(3*S) : line X,Y+(3*S) : move X-(2*S),Y+(3*S) : line X+(2*S),Y+(3*S) : return
150059 rem *** 2 - two ***
150060 color R,G,B,A : move X+(2*S),Y+(3*S) : line X-(2*S),Y+(3*S) : line X+(2*S),Y-(1*S) : arc X,Y-(1.5*S),2*S,155,-180 : return
150061 rem *** 3 - three ***
150062 color R,G,B,A : arc X,Y-(1.5*S),2*S,155,-220 : arc X,Y+(1.5*S),2*S,-155,220 : return
150063 rem *** 4 - four ***
150064 color R,G,B,A : move X+(1*S),Y+(4*S) : line X+(1*S),Y-(4*S) : line X-(2.5*S),Y+(1*S) : line X+(2.5*S),Y+(1*S) : return
150065 rem *** 5 - five ***
150066 color R,G,B,A : move X+(2*S),Y-(3*S) : line X-(2*S),Y-(3*S) : line X-(2*S),Y : arc X,Y+(2*S),2.5*S,155,-305 : return
150067 rem *** 6 - six ***
150068 color R,G,B,A : move X-(2*S),Y-(2*S) : line X-(2*S),Y+(2*S) : arc X,Y-(1.5*S),2*S,180,-180 : arc X,Y+(1.5*S),2*S,180,360 : return
150069 rem *** 7 - seven ***
150070 color R,G,B,A : move X-(2*S),Y-(3*S) : line X+(2*S),Y-(3*S) : line X,Y+(4*S) : return
150071 rem *** 8 - eight ***
150072 color R,G,B,A : arc X,Y-(1.5*S),2*S,225,-270 : arc X,Y+(1.5*S),2*S,125,360 : return
150073 rem *** 9 - nine ***
150074 color R,G,B,A : move X+(2*S),Y-(2*S) : line X+(2*S),Y+(2*S) : arc X,Y-(1.5*S),2*S,180,360 : arc X,Y+(1.5*S),2*S,180,180 : return
150075 rem
