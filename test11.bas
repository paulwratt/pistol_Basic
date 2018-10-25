10 cls : print "test 11 - bitwise test" : print
20 R=255:G=255:B=255: print "white:";
30 rem R=128:G=128:B=128 : print "gray";
40 print R,G,B
50 print "(B+(G*256)+(R*256*256)"
60 print (R+(G*256)+(R*256*256)) : print
70 rem C=16777215 : print "white:";
80 C=8421504 : print "gray:";
90 print C : print
100 rem print (C & (pow(2,32)-1))
110 print "bitwise AND - &"
120 print "R=";((pow(2,24)-1-65535) & C)
130 print "G=";((pow(2,16)-1-255) & C)
140 print "B=";(255 & C)
150 print
210 print "bitwise OR - |"
220 print "R=";((pow(2,24)-1) | C)
230 print "G=";((pow(2,16)-1) | C)
240 print "B=";(255 ^ C)
250 print
310 print "bitwise XOR - ^"
320 print "R=";((pow(2,24)-1) ^ C)
330 print "G=";((pow(2,16)-1) ^ C)
340 print "B=";(255 ^ C)
350 print
410 print "bitwise SHIFT RIGHT - >>"
420 print "8 >> C";(8 >> C)
420 print "8 << C";(8 << C)
430 print "C >> 8";(C >> 8)
440 print "C << 255";(C << 255)
450 print
510 print "bitwise NOT - ~"
520 print "~C";(~C)
530 print "~255";(~255)
540 print "~128";(~128)
550 print
600 rem box 100,100,20,30 rotate 45
