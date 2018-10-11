10 rem CIV type game vector icons
20 cC=2 : dim cP(16,4) : dim iR$(6)
50 rem ** colors **
51 cP(1,1)=0 : cP(1,2)=0 : cP(1,3)=0 : cP(1,4)=128 :           rem  1 - black
52 cP(2,1)=255 : cP(2,2)=0 : cP(2,3)=0 : cP(2,4)=128 :         rem  2 - red
53 cP(3,1)=0 : cP(3,2)=255 : cP(3,3)=0 : cP(3,4)=128 :         rem  3 - green
54 cP(4,1)=0 : cP(4,2)=0 : cP(4,3)=255 : cP(4,4)=128 :         rem  4 - blue
55 cP(5,1)=255 : cP(5,2)=0 : cP(5,3)=255 : cP(5,4)=128 :       rem  5 - magenta
56 cP(6,1)=255 : cP(6,2)=255 : cP(6,3)=0 : cP(6,4)=128 :       rem  6 - yellow
57 cP(7,1)=0 : cP(7,2)=255 : cP(7,3)=255 : cP(7,4)=128 :       rem  7 -  cyan
58 cP(8,1)=130 : cP(8,2)=130 : cP(8,3)=130 : cP(8,4)=128 :     rem  8 - medium gray
59 cP(9,1)=80 : cP(9,2)=80 : cP(9,3)=80 : cP(9,4)=128 :        rem  9 - dark grey
60 cP(10,1)=255 : cP(10,2)=127 : cP(10,3)=127 : cP(10,4)=128 : rem 10 - light red
61 cP(11,1)=127 : cP(11,2)=255 : cP(11,3)=127 : cP(11,4)=128 : rem 11 - light green
62 cP(12,1)=127 : cP(12,2)=127 : cP(12,3)=255 : cP(12,4)=128 : rem 12 - light blue
63 cP(13,1)=228 : cP(13,2)=101 : cP(13,3)=1 : cP(13,4)=128 :   rem 13 - orange
64 cP(14,1)=95 : cP(14,2)=63 : cP(14,3)=1 : cP(14,4)=128 :     rem 14 - brown
65 cP(15,1)=181 : cP(15,2)=181 : cP(15,3)=181 : cP(15,4)=128 : rem 15 - light grey
66 cP(16,1)=255 : cP(16,2)=255 : cP(16,3)=255 : cP(16,4)=128 : rem 16 - white
70 rem ** ranges **
71 iR$(1)="interface"
72 iR$(2)=" actions "
73 iR$(3)="  units  "
74 iR$(4)="buildings"
75 iR$(5)="resources"
76 iR$(6)="map tiles"
99 X=0 : Y=0 : S=10 : cC=2 : iP=3 : iR=1 : iL=1 : MU=1 : ST$="hello abdc"
100 cls : color 255,255,255 : box (xsize/2)+(xsize/4),ysize/2,xsize/4,ysize/2
110 home : print "color: ";chr$(iL+64) : gosub 40005 : box 60,8,4,8
120 rem print "icons: ";iR$(iR)
120 print "scale: [ ";S;" ]   pen: - ";iP;" +     "
130 print "cycle:  A-Z 0-9  "
140 print "mouse: LB:place  MB:color  RB:cycle"
1000 gosub 40003 : if MB<1 and KC<1 then goto 1000
1010 X=MX : Y=MY : if MU=0 then MU=1 else MU=0
1011 if MU then goto 1050
1020 if MB=1 then pen iP : gosub 2001
1030 if MB=2 then cC=cC+1 : if cC>16 then cC=1
1040 if MB=4 then iL=iL+1 : if iL>36 then iL=1
1050 rem if KC=32 then iR=iR+1 : if iR>6 then iR=1
1051 if KC=45 then iP=iP-1 : if iP<1 then iP=1
1052 if KC=61 then iP=iP+1 : if iP>9 then iP=9
1053 if KC=91 then S=S-.5 : if S<1 then S=10
1054 if KC=93 then S=S+.5 : if S>10 then S=1
1055 if KC=13 then goto 100
1060 if KC>47 and KC<58 then iL=KC-47+26
1070 if KC>64 and KC<91 then iL=KC-64
1075 if KC>96 and KC<123 then iL=KC-96
1080 MB=0 : KC=0
1090 update : sleep .1
1999 goto 110
2000 rem ** draw icon **
2001 if iR=1 then on iL gosub 50004,50006,50008,50010,50012,50014,50016,50018,50020,50022,50024,50026,50028,50030,50032,50034,50036,50038,50040,50042,50044,50046,50048,50050,50052,50054,50056,50058,50060,50062,50064,50066,50068,50070,50072,50074
2002 rem if iR=2 then on iL gosub 50078,50080,50082,50084,50086,50088,50090,50092,50094,50096,50098,50100,50102,50104,50106,50108,50110,50112,50114,50116,50118,50120,50122,50124,50126,50128,50130,50132,50134,50136,50138,50140,50142,50144,50146,50148
2003 rem if iR=3 then on iL gosub 50152,50154,50156,50158,50160,50162,50164,50166,50168,50170,50172,50174,50176,50178,50180,50182,50184,50186,50188,50190,50192,50194,50196,50198,50200,50202,50204,50206,50208,50210,50212,50214,50216,50218,50220,50222
2004 rem if iR=4 then on iL gosub 50226,50228,50230,50232,50234,50236,50238,50240,50242,50244,50246,50248,50250,50252,50254,50256,50258,50260,50262,50264,50266,50268,50270,50272,50274,50276,50278,50280,50282,50284,50286,50288,50290,50292,50294,50296
2005 rem if iR=5 then on iL gosub 50300,50302,50304,50306,50308,50310,50312,50314,50316,50318,50320,50322,50324,50326,50328,50330,50332,50334,50336,50338,50340,50342,50344,50346,50348,50350,50352,50354,50356,50358,50360,50362,50364,50366,50368,50370
2006 rem if iR=6 then on iL gosub 50374,50376,50378,50380,50382,50384,50386,50388,50390,50392,50394,50396,50398,50400,50402,50404,50406,50408,50410,50412,50414,50416,50418,50420,50422,50424,50426,50428,50430,50432,50434,50436,50438,50440,50442,50444
2999 return
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
49999 rem
50000 rem -= START: ICONS =-
50001 rem 50004,50078,50152,50226,50300,50374
50002 rem -=_*_=- INTERFACE 
50003 rem *** A - attack ***
50004 color R,G,B,A : disc X,Y,6*S : color 255,255,255,255 : shinit : shline X-(5*S),Y : shcurve X,Y-(5*S),X+(5*S),Y: shcurve X,Y+(5*S),X-(5*S),Y : shdone : return
50005 rem *** B - build ***
50006 color R,G,B,A : disc X,Y,6*S : color 255,255,0,255 : disc X,Y,4.5*S : color 0,0,0,255 : shinit : shline X,Y-(4*S) : shline X+(4*S),Y : shline X+(2.5*S),Y : shline X+(2.5*S),Y+(3*S) : shline X-(2.5*S),Y+(3*S) : shline X-(2.5*S),Y : shline X-(4*S),Y : shline X,Y-(4*S) : shdone : color 255,255,0,255: box X,Y+(2*S),.5*S,1*S : return
50007 rem *** C - collect ***
50008 color R,G,B,A : disc X,Y,6*S : color 255,255,255,255 : shinit : shline X-(5*S),Y : shcurve X,Y-(5*S),X+(5*S),Y: shcurve X,Y+(5*S),X-(5*S),Y : shdone : return
50009 rem *** D - destroy ***
50010 color R,G,B,A : disc X,Y,6*S : color 255,255,255,255 : shinit : shline X-(5*S),Y : shcurve X,Y-(5*S),X+(5*S),Y: shcurve X,Y+(5*S),X-(5*S),Y : shdone : return
50011 rem *** E - eye ***
50012 color R,G,B,A : disc X,Y,6*S : color 255,255,255,255 : shinit : shline X-(5*S),Y : shcurve X,Y-(5*S),X+(5*S),Y: shcurve X,Y+(5*S),X-(5*S),Y : shdone : return
50013 rem *** F - fish ***
50014 color R,G,B,A : disc X,Y,6*S : color 255,255,255,255 : shinit : shline X-(5*S),Y : shcurve X,Y-(5*S),X+(5*S),Y: shcurve X,Y+(5*S),X-(5*S),Y : shdone : return
50015 rem *** G - goto ***
50016 color R,G,B,A : disc X,Y,6*S : color 255,255,255,255 : shinit : shline X-(5*S),Y : shcurve X,Y-(5*S),X+(5*S),Y: shcurve X,Y+(5*S),X-(5*S),Y : shdone : return
50017 rem *** H - home ***
50018 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50019 rem *** I - irrigate ***
50020 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50021 rem *** J - square ***
50022 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50023 rem *** K - square ***
50024 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50025 rem *** L - square ***
50026 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50027 rem *** M - mark ***
50028 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50029 rem *** N - nuke ***
50030 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : disc X,Y,(4.5*S) : color 255,255,0,255 : shinit : shline X,Y : shline X-(2.7*S),Y-(3.7*S) : shcurve X,Y-(5.5*S),X+(2.7*S),Y-(3.7*S) : shend : shline X,Y : shline X-(4.5*S),Y : shcurve X-(4.5*S),Y+(2.5*S),X-(2.5*S),Y+(4*S) : shend : shline X,Y : shline X+(4.5*S),Y : shcurve X+(4.5*S),Y+(2.5*S),X+(2.5*S),Y+(4*S) : shdone : return
50031 rem *** O - nuke ***
50032 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50033 rem *** P - pillage ***
50034 color R,G,B,A : disc X,Y,6*S : color 255,255,0,255 : disc X,Y,4.5*S : color 255,255,255,255 : shinit : shline X,Y : shline X-(2.7*S),Y-(3.7*S) : shcurve X,Y-(5.5*S),X+(2.7*S),Y-(3.7*S) : shend : shline X,Y : shline X-(4.5*S),Y : shcurve X-(4.5*S),Y+(2.5*S),X-(2.5*S),Y+(4*S) : shend : shline X,Y : shline X+(4.5*S),Y : shcurve X+(4.5*S),Y+(2.5*S),X+(2.5*S),Y+(4*S) : shdone : return
50035 rem *** Q - nuke ***
50036 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50037 rem *** R - nuke ***
50038 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50039 rem *** S - stop ***
50040 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50041 rem *** T - square ***
50042 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50043 rem *** U - square ***
50044 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50045 rem *** V - square ***
50046 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50047 rem *** W - square ***
50048 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50049 rem *** X - square ***
50050 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50051 rem *** Y - square ***
50052 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50053 rem *** Z - square ***
50054 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y-(2.5*S) : shline X+(2.5*S),Y+(2.5*S) : shline X-(2.5*S),Y+(2.5*S) : shdone : return
50055 rem *** 0 - zero ***
50056 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50057 rem *** 1 - one ***
50058 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50059 rem *** 2 - two ***
50060 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50061 rem *** 3 - three ***
50062 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50063 rem *** 4 - four ***
50064 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50065 rem *** 5 - five ***
50066 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50067 rem *** 6 - six ***
50068 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50069 rem *** 7 - seven ***
50070 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50071 rem *** 8 - eight ***
50072 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50073 rem *** 9 - nine ***
50074 color R,G,B,A : disc X,Y,6*S : color 0,0,0,255 : shinit : shline X-(2.5*S),Y : shline X,Y-(2.5*S) : shline X+(2.5*S),Y : shline X,Y+(2.5*S) : shdone : return
50075 rem
50446 rem -= END: ICONS =-
