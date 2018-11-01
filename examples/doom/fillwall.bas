1 rem FILLWALL.BAS - Filled Wall Vertex Rotate test
2 rem ported from a QBASIC example done by bisqwit
3 rem https://bisqwit.iki.fi/jutut/kuvat/programming_examples/portalrendering/vertrot-filledwall1.bas
10 cls : home
100 ' The end coordinates for the line segment representing a "wall"
110 vx1 = 70 : vy1 = 20
120 vx2 = 70 : vy2 = 70
200 ' The coordinates of the player
210 px = 50
220 py = 50
230 angle = 0
500 pen 1 : rrx=int(xsize/2)-(320/2) : rry=int(ysize/2)-(200/2) : us=1
1000 ' DO namin loop
1001  'if us then gosub 7100 : box int(xsize/2),int(ysize/2),(320/2),(200/2)
1002  if us then cls
1010  ' Draw the absolute map
1020  'VIEW(4,40)-(103,149),0,1
1021  rx=rrx+4 : ry=rry+40
1030  '
1040  'LINE(vx1,vy1)-(vx2,vy2),14
1041  gosub 7014 : move rx+vx1,ry+vy1 : line rx+vx2,ry+vy2
1050  'LINE(px,py)-(COS(angle)*5 + px, SIN(angle)*5 + py),8
1051  gosub 7008 : move rx+px,ry+py : line rx+(COS(angle)*5+px),ry+(SIN(angle)*5+py)
1060  gosub 7015 : move rx+px,ry+py : spot : 'PSET(px,py),15
1070  '
2100  ' Draw the transformed map
2110  'VIEW(109,40)-(208,149),0,2
2111  rx=rrx+109 : ry=rry+40
2120  '
2200  ' Transform the vertexes relative to the player
2210  tx1 = vx1 - px : ty1 = vy1 - py
2220  tx2 = vx2 - px : ty2 = vy2 - py
2230  ' Rotate them around the player's view
2240  tz1 = tx1 * COS(angle) + ty1 * SIN(angle)
2250  tz2 = tx2 * COS(angle) + ty2 * SIN(angle)
2260  tx1 = tx1 * SIN(angle) - ty1 * COS(angle)
2270  tx2 = tx2 * SIN(angle) - ty2 * COS(angle)
2280  '
2290  'LINE(50 - tx1, 50 - tz1) - (50 - tx2, 50 - tz2), 14
2291  gosub 7014 : move rx+50-tx1,ry+50-tz1 : line rx+50-tx2,ry+50-tz2
2300  gosub 7008 : move rx+50,ry+50 : line rx+50,ry+45 : 'LINE(50,50)-(50,45),8
2310  gosub 7015 : move rx+50,ry+50 : spot : 'PSET(50,50),15
2320  '
3400  ' Draw the perspective-transformed map
3410  'VIEW(214,40)-(315,149),0,3
3411  rx=rrx+214 : ry=rry+40
3420  '
3430  'IF tz1 > 0 OR tz2 > 0 THEN
3431  IF tz1<0 AND tz2<0 THEN goto 3850
3500    ' If tz1 is behind viewer, scale: e = (b-a)*(f-d)/(c-a)+d     with b=0.1, a=tz1, c=tz2, d=tx1, f=tx2.
3510    gosub 5100 : 'CALL Intersect(tx1,tz1, tx2,tz2, -0.0001,0.0001, -20,5, ix1,iz1)
3520    gosub 6100 : 'CALL Intersect(tx1,tz1, tx2,tz2,  0.0001,0.0001,  20,5, ix2,iz2)
3530    IF tz1 <= 0 THEN IF iz1 > 0 THEN tx1=ix1:tz1=iz1 ELSE tx1=ix2:tz1=iz2
3540    IF tz2 <= 0 THEN IF iz1 > 0 THEN tx2=ix1:tz2=iz1 ELSE tx2=ix2:tz2=iz2
3550    '
3551    yh=250 : ' originally 50 which is ok for 320x200
3560    x1 = -tx1 * 16 / tz1 : y1a = -yh / tz1 : y1b =  yh / tz1
3570    x2 = -tx2 * 16 / tz2 : y2a = -yh / tz2 : y2b =  yh / tz2
3700    '
3710    FOR x = x1 TO x2
3720      ya = y1a + (x-x1) * (y2a-y1a) / (x2-x1)
3730      yb = y1b + (x-x1) * (y2b-y1b) / (x2-x1)
3740      '
3750      'LINE (50 + x,       0) - (50 + x, 50 + -ya), 8 'sky
3751      gosub 7001 : move rx+50+x,ry+0 : line rx+50+x,ry+50+ya
3760      'LINE (50 + x, 50 + yb) - (50 + x, 140), 1 'floor
3761      gosub 7008 : move rx+50+x,ry+50+yb : line rx+50+x,ry+140
3770      '
3780      'LINE (50 + x, 50 + ya) - (50 + x, 50 + yb), 14 'wall
3781      gosub 7014 : move rx+50+x,ry+50+ya : line rx+50+x,ry+50+yb
3790    NEXT
3810    'LINE(50+x1,50+y1a)-(50+x1,50+y1b),6 'left (1)
3811    gosub 7006 : move rx+50+x1,ry+50+y1a : line rx+50+x1,ry+50+y1b
3820    'LINE(50+x2,50+y2a)-(50+x2,50+y2b),6 'right (2)
3821    gosub 7006 : move rx+50+x2,ry+50+y2a : line rx+50+x2,ry+50+y2b
3850  'END IF
3860  '
3870  ' Wait for screen refresh and swap page
3880  'SCREEN ,, page%, 1 - page% : page% = 1 - page%
3890  'WAIT &H3DA, &H8, &H8: WAIT &H3DA, &H8
3891  if us then update
3899  '
3900  x$=inkey$ : if x$="" then goto 3999
3910  if x$="H" or x$="h" then px = px + COS(angle): py = py + SIN(angle)
3920  if x$="P" or x$="p" then px = px - COS(angle): py = py - SIN(angle)
3930  if x$="K" or x$="k" then angle = angle - 0.1
3940  if x$="M" or x$="m" then angle = angle + 0.1
3950  if x$="A" or x$="a" then px = px + SIN(angle): py = py - COS(angle)
3960  if x$="D" or x$="d" then px = px - SIN(angle): py = py + COS(angle)
3970  if x$="Q" or x$="q" then end
3999 goto 1000
4000 ' 
4010 'DEF FNcross(x1,y1, x2,y2) = x1*y2 - y1*x2
4020 '
4100 'SUB Intersect(x1,y1, x2,y2, x3,y3, x4,y4, x,y)
4110  'x = FNcross(x1,y1, x2,y2)
4111  'x=(x1*y2)-(y1*x2)
4120  'y = FNcross(x3,y3, x4,y4)
4121  'y=(x3*y4)-(x4*y3)
4130  'det = FNcross(x1-x2, y1-y2, x3-x4, y3-y4)
4131  'det=((x1-x2)*(y3-y4))-((x3-x4)*(y1-y2))
4140  'x = FNcross(x, x1-x2, y, x3-x4) / det
4141  'x=((x*(x3-x4))-(y*(x1-x2)))/det
4150  'y = FNcross(x, y1-y2, y, y3-y4) / det
4151  'y=((x*(y3-y4))-(y*(y1-y2)))/det
4160 return : 'END SUB
5100 ' get ix1 & iz1
5111  x=(tx1*tz2)-(tx2*tz1)
5121  y=(-0.0001*5)-(-20*0.0001)
5131  det=((tx1-tx2)*(0.0001-5))-((-0.0001-(-20))*(tz1-tz2))
5141  ix1=((x*(-0.0001-(-20)))-(y*(tx1-tx2)))/det
5151  iz1=((x*(0.0001-5))-(y*(tz1-tz2)))/det
5160 return : 'END SUB
6100 ' get ix2 & iz2
6111  x=(tx1*tz2)-(tx2*tz1)
6121  y=(0.0001*5)-(20*0.0001)
6131  det=((tx1-tx2)*(0.0001-5))-((-0.0001-20)*(tz1-tz2))
6141  ix2=((x*(0.0001-20))-(y*(tx1-tx2)))/det
6151  iz2=((x*(0.0001-5))-(y*(tz1-tz2)))/det
6160 return
6998 rem from: http://qb64.org/wiki/COLOR
6999 ' colors - QBASIC/QuickBasic/QB64 palette 
7000 color 0,0,80,255      : return : '  0 - black (dark blue)
7001 color 0,0,168,255     : return : '  1 - blue
7002 color 0,168,0,255     : return : '  2 - green
7003 color 0,168,168,255   : return : '  3 - cyan
7004 color 168,0,0,255     : return : '  4 - red
7005 color 168,0,168,255   : return : '  5 - magenta
7006 color 168,84,0,255    : return : '  6 - brown
7007 color 168,168,168,255 : return : '  7 - light grey
7008 color 84,84,84,255    : return : '  8 - dark gray
7009 color 84,84,252,255   : return : '  9 - purple
7010 color 84,252,84,255   : return : ' 10 - light green
7011 color 84,252,252,255  : return : ' 11 - light cyan
7012 color 252,84,84,255   : return : ' 12 - skin pink
7013 color 252,84,252,255  : return : ' 13 - pink
7014 color 252,252,84,255  : return : ' 14 - yellow
7015 color 252,252,252,255 : return : ' 15 - white
7100 color 0,0,0,255       : return : '  0 - black
