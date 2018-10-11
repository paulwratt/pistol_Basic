10 rem
100 T=0:OX=(xsize/2)-(xsize/4):OY=(ysize/2)-(ysize/4):S=3
100 T=0:OX=50:OY=25:S=3
1000 T=T+1 : cls
1001 for i=1 to 5
1102  for j=1 to 5
1115   if T=1 then gosub 11010
1125   if T=2 then gosub 11020
1135   if T=3 then gosub 11030
1145   if T=4 then gosub 11040
1155   if T=5 then gosub 11050
1165   if T=6 then gosub 11060
9982  next
9991 next
10010 x$=inkey$ : if x$="" then goto 10010
10020 if T<6 then goto 1000
10999 end
11010 X=OX+((5*S)*j*2)+j : Y=OY+((5*S)*i*2)+i
11015 color 255,0,0,128  : goto 11110
11020 X=OX+((7*S)*j*2)   : Y=OY+((7*S)*i*2)
11025 color 0,255,0,128  : goto 11120
11030 X=OX+((6*S)*j*2)   : Y=OY+((6*S)*i*2)
11032 if (i/2)=int(i/2) then X=X+(6*S)
11035 color 0,0,255,128  : goto 11130
11040 X=OX+((7*S)*j*2)   : Y=OY+((5*S)*i*2)
11042 if (i/2)=int(i/2) then X=X+(7*S)
11045 color 255,255,0,128 : goto 11140
11050 X=OX+((7*S)*j*2)  : Y=OY+((7*S)*i*2)
11052 if (i/2)=int(i/2) then X=X+(7*S)
11053 if (j/2)=int(j/2) then Y=Y-(7*S)
11055 color 0,255,255,128 : goto 11120
11060 X=OX+((5*S)*j*2)-j : Y=OY+((5*S)*i*2)-i
11065 color 255,255,255,128 : goto 11110
11110 box X,Y,S*5,S*5 : return
11120 disc X,Y,S*7 : return
11130 shinit:shline X-(S*6),Y:shline X-(S*3),Y-(S*6):shline X+(S*3),Y-(S*6):shline X+(S*6),Y:shline X+(S*3),Y+(S*6):shline X-(S*3),Y+(S*6):shdone : return
11140 shinit:shline X-(S*7),Y:shline X-(S*3),Y-(S*5):shline X+(S*3),Y-(S*5):shline X+(S*7),Y:shline X+(S*3),Y+(S*5):shline X-(S*3),Y+(S*5):shdone : return
