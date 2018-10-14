10 cls : print "test 08 - data/read" : print
50 rem a=0 : b=0 : c$="": d$=""
100 read a,b
120 print "a=";a
130 print "b=";b
140 read c$,d$
150 print "c$=";c$
160 rem read d$
170 print "d$=";d$
180 read z : print "z=";z
1010 data 1,10,"nadia","Hello World!" : ' failed $
1020 data "nadia","Hello World!" : ' failed $
1030 data 5 : ' failed $
1050 rem data 1,-10,nadia,"Hello World!",5 : ' failed *
