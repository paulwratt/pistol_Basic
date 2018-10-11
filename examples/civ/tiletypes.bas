10 rem
100 T=0:OX=(xsize/2)-(xsize/4):OY=(ysize/2)-(ysize/4):S=3
100 T=0:OX=25:OY=25:S=3
110 grid=0 :   rem  -1=cell  0=none  1=border
120 gwidth=1 : rem  width of cell or grid border
1000 T=T+1 : cls
1010 print "grid: [ ";
1011 if grid=-1 then print "cell";
1012 if grid=0 then print "none";
1013 if grid=1 then print "border";
1014 print " ]    "
1015 print "width: -";gwidth;" +  "
1099 move OX,OY : pen 5 : spot : pen 1
1101 for i=1 to 5
1112  for j=1 to 5
1115   if T=1 then gosub 11010
1125   if T=2 then gosub 11020
1135   if T=3 then gosub 11030
1145   if T=4 then gosub 11040
1155   if T=5 then gosub 11050
1165   if T=6 then gosub 11060
1175   if T=7 then gosub 11070
9982  next
9991 next
10010 x$=inkey$ : if x$="" then goto 10010
10020 if x$="[" then grid=grid-1 : if grid<-1 then grid=-1
10030 if x$="]" then grid=grid+1 : if grid>1 then grid=1
10120 if x$="-" then gwidth=gwidth-1 : if gwidth<0 then gwidth=0
10130 if x$="=" then gwidth=gwidth+1 : if gwidth>100 then gwidth=100
10220 if T<7 then goto 1000
10230 t=0 : goto 1000
10999 end
11010 X=OX+((5*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 11101
11015 color 255,0,0,128  : goto 11110
11020 X=OX+((7*S)*j*2)   : Y=OY+((3.5*S)*i*2) : gosub 11101
11022 if (i/2)=int(i/2) then X=X+(7*S)
11025 color 0,255,0,128  : goto 11150
11030 X=OX+((9*S)*j*2)   : Y=OY+((3*S)*i*2) : gosub 11101
11032 if (i/2)=int(i/2) then X=X+(9*S)
11035 color 0,0,255,128  : goto 11130
11040 X=OX+((10*S)*j*2)   : Y=OY+((2.5*S)*i*2) : gosub 11101
11042 if (i/2)=int(i/2) then X=X+(10*S)
11045 color 255,255,0,128 : goto 11140
11050 X=OX+((5*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 11101
11055 color 255,255,255,128 : goto 11120
11060 X=OX+((6*S)*j*2)  : Y=OY+((5*S)*i*2) : gosub 11101
11062 if (i/2)=int(i/2) then X=X+(6*S)
11065 color 255,0,0,128 : goto 11120
11070 X=OX+((5*S)*j*2)  : Y=OY+((5*S)*i*2) : gosub 11101
11072 if (i/2)=int(i/2) then X=X+(5*S)
11073 if (j/2)=int(j/2) then Y=Y-(5*S)
11075 color 0,255,255,128 : goto 11120
11101 if grid=-1 then X=X-(gwidth*J) : Y=Y-(gwidth*I) : return
11102 if grid=1 then X=X+(gwidth*J) : Y=Y+(gwidth*I) : return
11103 return
11110 box X,Y,S*5,S*5 : return
11120 disc X,Y,S*7 : return
11130 shinit:shline X-(S*6),Y:shline X-(S*3),Y-(S*6):shline X+(S*3),Y-(S*6):shline X+(S*6),Y:shline X+(S*3),Y+(S*6):shline X-(S*3),Y+(S*6):shdone : return
11140 shinit:shline X-(S*7),Y:shline X-(S*3),Y-(S*5):shline X+(S*3),Y-(S*5):shline X+(S*7),Y:shline X+(S*3),Y+(S*5):shline X-(S*3),Y+(S*5):shdone : return
11150 shinit:shline X-(S*7),Y:shline X,Y-(S*7):shline X+(S*7),Y:shline X,Y+(S*7):shdone : return
