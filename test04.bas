10 cls : print "test 04 - decode 32 bit number" : print
15 rem goto 1000
20 R=255:G=255:B=255:A=255 : print "white:";
30 rem R=128:G=128:B=128:A=255 : print "gray";
40 print R,G,B,A
50 print "(A+(B*256)+(G*256*256)+(R*256*256*256))"
60 print (A+(B*256)+(G*256*256)+(R*256*256*256)) : print
70 rem C=4294967295.0 : print "white:";
80 C=2155905279.0 : print "gray:";
90 print C
100 print (C & (pow(2,32)-1))
110 print (C & (pow(2,24)-1))
120 print (C & (pow(2,16)-1))
130 print (C & 255)
150 end
1000 X=320 : Y=240 : R=0:G=0:B=255:A=128 : color R,G,B,A : disc X,Y,60
1001 color 255,255,0,255 : disc X,Y,45 : color 0,0,0,255 : shinit
1002 shline X,Y : shline X-27,Y-37 : shcurve X,Y-60,X+27,Y-37 : shend
1003 shline X,Y : shline X-45,Y : shcurve X-42,Y+25,X-25,Y+40 : shend
1004 shline X,Y : shline X+45,Y : shcurve X+42,Y+25,X+25,Y+40 : shend
2000 shdone
