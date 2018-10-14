10 cls : print "test 05 - mouse click shapes" : print
15 goto 1000
20 R=0 : G=0 : B=255 : A=128
30 X=650 : Y=500
100 gosub 10001
1000 MB=mouseb : X=mousex : Y=mousey
1001 if MB=1 then R=255 : G=0 : B=0 : A=128 : gosub 20001 : sleep .2
1002 if MB=2 then R=255 : G=255 : B=0 : A=128 : gosub 30001 : sleep .2
1004 if MB=4 then R=0 : G=0 : B=255 : A=128 : gosub 10001 : sleep .2
1010 MB=0
9999 goto 1000
10000 rem *** E - eye ***
10001 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
20000 rem *** S - square ***
20001 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
30000 rem *** N - nuke ***
30001 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
