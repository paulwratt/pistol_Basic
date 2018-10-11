1 rem CIV_INTRO.BAS - nietCiv Intro
2 rem uses buildings icons to generate a background with 2 cities
3 rem we generate a minimap first so its always random
10 cls : dim cP(16,4)
15 rem * predefines *
20 dmi=0 : ' var dmi = dim map initialized
30 waterSeed=2 : islandTweak=5 : contenants=50 : borders=5 : ispeninsula=1
40 W=200 : H=200 : p=xsize-W : mapx=xsize : mapy=ysize : ' minimap
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
1000 rem * dimension map based on screen size *
1005 if dmi>0 then goto 1045 else dmi=1
1010 if xsize=640 then dim m(640,480,8)
1020 if xsize=800 then dim m(800,600,8)
1030 if xsize=1024 then dim m(1024,768,8)
1040 if xsize=1280 then dim m(1280,720,8)
1045 rem skip dim
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
3730 xmap=X : ymap=Y
3740 m(X,Y,1)=255 : m(X,Y,2)=255 : m(X,Y,3)=255 : ' white dot for city on intro screen, thats our "center"
3750 wsize=xsize-200 : hsize=ysize : grid=-1 : gwidth=1
3755 OX=0 : OY=0 : T=7 : S=3
3760 rem * get display area *
3761 if T=1 then mapw=int(wsize/((5*S)*2)) : maph=int(hsize/((5*S)*2))-1
3762 if T=2 then OY=10 : mapw=int(wsize/((7*S)*2))-1 : maph=int(hsize/((3.5*S)*2))-1
3763 if T=3 then OX=-32 : OY=10 : mapw=int(wsize/((9*S)*2)) : maph=int(hsize/((3*S)*2))
3764 if T=4 then OX=-32 : OY=10 : mapw=int(wsize/((10*S)*2)) : maph=int(hsize/((2.5*S)*2))
3765 if T=5 then mapw=int(wsize/((5*S)*2)) : maph=int(hsize/((5*S)*2))-1
3766 if T=6 then OY=5 : mapw=int(wsize/((6*S)*2))-1 : maph=int(hsize/((5*S)*2))-1
3767 if T=7 then OX=10 : OY=15 : mapw=int(wsize/((5*S)*2))-1 : maph=int(hsize/((5*S)*2))-1
3780 drawX=xmap-int(mapw/2)-1 : drawY=ymap-int(maph/2)-1
5100 rem * display map area *
5101 for i=1 to maph
5112  for j=1 to mapw
5114   color m(drawX+j,drawY+i,1),m(drawX+j,drawY+i,2),m(drawX+j,drawY+i,3),128
5115   if T=1 then gosub 6010
5125   if T=2 then gosub 6020
5135   if T=3 then gosub 6030
5145   if T=4 then gosub 6040
5155   if T=5 then gosub 6050
5165   if T=6 then gosub 6060
5175   if T=7 then gosub 6070
5210   if drawX+j=xmap and drawY+i=ymap then pen 3 : R=255 : G=255 : B=255 : A=128 : gosub 150018
5982  next
5991 next
5999 goto 6500 : ' area display done; jump to next part
6000 rem * map tile types *
6010 X=OX+((5*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 6101
6015 goto 6110
6020 X=OX+((7*S)*j*2) : Y=OY+((3.5*S)*i*2) : gosub 6101
6022 if (i/2)=int(i/2) then X=X+(7*S)
6025 goto 6150
6030 X=OX+((9*S)*j*2) : Y=OY+((3*S)*i*2) : gosub 6101
6032 if (i/2)=int(i/2) then X=X+(9*S)
6035 goto 6130
6040 X=OX+((10*S)*j*2) : Y=OY+((2.5*S)*i*2) : gosub 6101
6042 if (i/2)=int(i/2) then X=X+(10*S)
6045 goto 6140
6050 X=OX+((5*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 6101
6055 goto 6120
6060 X=OX+((6*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 6101
6062 if (i/2)=int(i/2) then X=X+(6*S)
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
6500 rem * display minimap *
6510 pen 1
6521 for Y=1 to H
6532  for X=p to mapx
6540   color m(X,Y,1),m(X,Y,2),m(X,Y,3),128 : move X,Y : spot
6582  next X
6591 next Y
6610 color 255,255,255,128 : pen 1 : rect xmap,ymap,mapw/2,maph/2
6660 rem X=xsize/2 : Y=ysize/2 : Y=Y+50 : L=150
6665 L=150 : K=25 : X=xsize-L-5 : Y=ysize-K-5
6670 color 0,0,255,128 : box X,Y,L,K round 5 : color 255,255,0,255 : pen 3 : rect X,Y,L,K round 5
6680 S1$="NietCiv XVIII" : S2$=" NIETCIV  2018" : e=len(S2$) : iR=1 : X=X-L
6690 R=255 : G=255 : B=255 : A=255 : ' text color
6711 for i=1 to e
6720  X=X+((3*S)*2)
6730  X$=mid$(S2$,i,1) : if X$=" " then goto 6791
6740  il=asc(X$)-64 : if iL<1 then iL=iL+64-47+26
6760  R=128 : G=128 : B=128 : A=128 : pen 3 : X=X+5 : Y=Y+4 : if iR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
6760  R=255 : G=255 : B=0 : A=255 : pen 3 : X=X-5 : Y=Y-4 : if iR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
6770  R=0 : G=0 : B=255 : A=255 : pen 1 : X=X+1 : if iR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
6791 next
10000 goto 10000
40000 rem -= START: SUPPORT =-
40001 rem 40003,40005,40006,40007
40002 rem -=_*_=- INPUTS
40003 MB=mouseb : MX=mousex : MY=mousey : KC=keycode : KP=key(K) : return
40004 rem -=_*_=- ARRAY2COLOR
40005 R=cP(cC,1) : G=cP(cC,2) : B=cP(cC,3) : A=cP(cC,4) : color R,G,B,A : return
40006 fR=cP(cC,1) : fG=cP(cC,2) : fB=cP(cC,3) : fA=cP(cC,4) : color fR,fG,fB,fA : return
40007 bR=cP(cC,1) : bG=cP(cC,2) : bB=cP(cC,3) : bA=cP(cC,4) : color bR,bG,bB,bA : return
40008 rem -=_*_=- STRING2COLOR
40009 rem
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
