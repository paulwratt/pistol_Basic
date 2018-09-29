10 rem vector fonts
20 cls : cC=2 : dim cP(16,4) : dim iR$(5)
50 rem ** colors **
51 cP(1,1)=0 : cP(1,2)=0 : cP(1,3)=0 : cP(1,4)=128 : rem  1 - black
52 cP(2,1)=255 : cP(2,2)=0 : cP(2,3)=0 : cP(2,4)=128 : rem  2 - red
53 cP(3,1)=0 : cP(3,2)=255 : cP(3,3)=0 : cP(3,4)=128 : rem  3 - green
54 cP(4,1)=0 : cP(4,2)=0 : cP(4,3)=255 : cP(4,4)=128 : rem  4 - blue
55 cP(5,1)=255 : cP(5,2)=255 : cP(5,3)=0 : cP(5,4)=128 : rem  5 - yellow
56 cP(6,1)=255 : cP(6,2)=0 : cP(6,3)=255 : cP(6,4)=128 : rem  6 - pink
57 cP(7,1)=0 : cP(7,2)=255 : cP(7,3)=255 : cP(7,4)=128 : rem  7 - 
58 cP(8,1)=0 : cP(8,2)=0 : cP(8,3)=0 : cP(8,4)=128 : rem  8 - 
59 cP(9,1)=0 : cP(9,2)=0 : cP(9,3)=0 : cP(9,4)=128 : rem  9 - 
60 cP(10,1)=0 : cP(10,2)=0 : cP(10,3)=0 : cP(10,4)=128 : rem 10 - 
61 cP(11,1)=0 : cP(11,2)=0 : cP(11,3)=0 : cP(11,4)=128 : rem 11 - 
62 cP(12,1)=0 : cP(12,2)=0 : cP(12,3)=0 : cP(12,4)=128 : rem 12 - 
63 cP(13,1)=0 : cP(13,2)=0 : cP(13,3)=0 : cP(13,4)=128 : rem 13 - 
64 cP(14,1)=0 : cP(14,2)=0 : cP(14,3)=0 : cP(14,4)=128 : rem 13 - 
65 cP(15,1)=0 : cP(15,2)=0 : cP(15,3)=0 : cP(15,4)=128 : rem 13 - 
66 cP(16,1)=255 : cP(16,2)=255 : cP(16,3)=255 : cP(16,4)=128 : rem 16 - white
70 rem ** ranges **
71 iR$(1)="interface"
72 iR$(2)=" actions "
73 iR$(3)="  units  "
74 iR$(4)="buildings"
75 iR$(5)="resources"
99 X=0 : Y=0 : iR=1 : iL=1 : MU=0
100 home : print "color: ";chr$(iL+64) : gosub 40005 : box 60,8,4,8
120 print "icons:  ";iR$(iR)
130 print "cycle:  A-Z 0-9  space:icons"
140 print "mouse: LB:place  MB:color  RB:cycle"
1000 gosub 40003 : if MB<1 and KC<1 then goto 1000
1010 X=MX : Y=MY : MU=~MU : if MU then goto 1050
1020 if MB=1 then gosub 2001
1030 if MB=2 then cC=cC+1 : if cC>16 then cC=1
1040 if MB=4 then iL=iL+1 : if iL>36 then iL=1
1050 if KC=32 then iR=iR+1 : if iR>5 then iR=1
1055 if KC=13 then cls : goto 100
1060 if KC>47 and KC<58 then iL=KC-47+25
1070 if KC>64 and KC<91 then iL=KC-64
1075 if KC>96 and KC<113 then iL=KC-96
1080 MB=0 : KC=0
1090 update : sleep .1
1999 goto 100
2000 rem ** draw icon **
2001 if iR=1 then on iL gosub 50004,50006,50008,50010,50012,50014,50016,50018,50020,50022,50024,50026,50028,50030,50032,50034,50036,50038,50040,50042,50044,50046,50048,50050,50052,50054,50056,50058,50060,50062,50064,50066,50068,50070,50072,50074
2002 if iR=2 then on iL gosub 50078,50080,50082,50084,50086,50088,50090,50092,50094,50096,50098,50100,50102,50104,50106,50108,50110,50112,50114,50116,50118,50120,50122,50124,50126,50128,50130,50132,50134,50136,50138,50140,50142,50144,50146,50148
2003 if iR=3 then on iL gosub 50152,50154,50156,50158,50160,50162,50164,50166,50168,50170,50172,50174,50176,50178,50180,50182,50184,50186,50188,50190,50192,50194,50196,50198,50200,50202,50204,50206,50208,50210,50212,50214,50216,50218,50220,50222
2004 if iR=4 then on iL gosub 50226,50228,50230,50232,50234,50236,50238,50240,50242,50244,50246,50248,50250,50252,50254,50256,50258,50260,50262,50264,50266,50268,50270,50272,50274,50276,50278,50280,50282,50284,50286,50288,50290,50292,50294,50296
2005 if iR=5 then on iL gosub 50300,50302,50304,50306,50308,50310,50312,50314,50316,50318,50320,50322,50324,50326,50328,50330,50332,50334,50336,50338,50340,50342,50344,50346,50348,50350,50352,50354,50356,50358,50360,50362,50364,50366,50368,50370
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
50001 rem 50004,50078,50152,50226,50300
50002 rem -=_*_=- INTERFACE 
50003 rem *** A - attack ***
50004 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50005 rem *** B - build ***
50006 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50007 rem *** C - collect ***
50008 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50009 rem *** D - destroy ***
50010 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50011 rem *** E - eye ***
50012 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50013 rem *** F - fish ***
50014 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50015 rem *** G - goto ***
50016 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50017 rem *** H - home ***
50018 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50019 rem *** I - irrigate ***
50020 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50021 rem *** J - square ***
50022 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50023 rem *** K - square ***
50024 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50025 rem *** L - square ***
50026 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50027 rem *** M - mark ***
50028 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50029 rem *** N - nuke ***
50030 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50031 rem *** O - nuke ***
50032 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50033 rem *** P - pillage ***
50034 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50035 rem *** Q - nuke ***
50036 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50037 rem *** R - nuke ***
50038 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50039 rem *** S - stop ***
50040 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50041 rem *** T - square ***
50042 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50043 rem *** U - square ***
50044 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50045 rem *** V - square ***
50046 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50047 rem *** W - square ***
50048 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50049 rem *** X - square ***
50050 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50051 rem *** Y - square ***
50052 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50053 rem *** Z - square ***
50054 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50055 rem *** 0 - zero ***
50056 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50057 rem *** 1 - one ***
50058 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50059 rem *** 2 - two ***
50060 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50061 rem *** 3 - three ***
50062 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50063 rem *** 4 - four ***
50064 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50065 rem *** 5 - five ***
50066 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50067 rem *** 6 - six ***
50068 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50069 rem *** 7 - seven ***
50070 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50071 rem *** 8 - eight ***
50072 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50073 rem *** 9 - nine ***
50074 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50075 rem
50076 rem -=_*_=- ACTIONS 
50077 rem *** A - attack ***
50078 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50079 rem *** B - build ***
50080 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50081 rem *** C - collect ***
50082 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50083 rem *** D - destroy ***
50084 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50085 rem *** E - eye ***
50086 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50087 rem *** F - fish ***
50088 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50089 rem *** G - goto ***
50090 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50091 rem *** H - home ***
50092 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50093 rem *** I - irrigate ***
50094 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50095 rem *** J - square ***
50096 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50097 rem *** K - square ***
50098 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50099 rem *** L - square ***
50100 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50101 rem *** M - mark ***
50102 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50103 rem *** N - nuke ***
50104 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50105 rem *** O - nuke ***
50106 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50107 rem *** P - pillage ***
50108 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50109 rem *** Q - nuke ***
50110 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50111 rem *** R - nuke ***
50112 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50113 rem *** S - square ***
50114 color R,G,B,A : disc X,Y,60 : color 255,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50115 rem *** T - square ***
50116 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50117 rem *** U - square ***
50118 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50119 rem *** V - square ***
50120 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50121 rem *** W - square ***
50122 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50123 rem *** X - square ***
50124 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50125 rem *** Y - square ***
50126 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50127 rem *** Z - square ***
50128 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50129 rem *** 0 - zero ***
50130 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50131 rem *** 1 - one ***
50132 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50133 rem *** 2 - two ***
50134 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50135 rem *** 3 - three ***
50136 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50137 rem *** 4 - four ***
50138 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50139 rem *** 5 - five ***
50140 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50141 rem *** 6 - six ***
50142 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50143 rem *** 7 - seven ***
50144 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50145 rem *** 8 - eight ***
50146 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50147 rem *** 9 - nine ***
50148 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50149 rem
50150 rem -=_*_=- UNITS 
50151 rem *** A - attack ***
50152 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50153 rem *** B - build ***
50154 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50155 rem *** C - collect ***
50156 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50157 rem *** D - destroy ***
50158 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50159 rem *** E - eye ***
50160 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50161 rem *** F - fish ***
50162 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50163 rem *** G - goto ***
50164 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50165 rem *** H - home ***
50166 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50167 rem *** I - irrigate ***
50168 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50169 rem *** J - square ***
50170 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50171 rem *** K - square ***
50172 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50173 rem *** L - square ***
50174 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50175 rem *** M - mark ***
50176 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50177 rem *** N - nuke ***
50178 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : disc X,Y,45 : color 255,255,0,255 : shinit : shline X,Y : shline X-27,Y-37 : shcurve X,Y-55,X+27,Y-37 : shend : shline X,Y : shline X-45,Y : shcurve X-45,Y+25,X-25,Y+40 : shend : shline X,Y : shline X+45,Y : shcurve X+45,Y+25,X+25,Y+40 : shdone : return
50179 rem *** O - nuke ***
50180 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50181 rem *** P - pillage ***
50182 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50183 rem *** Q - nuke ***
50184 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50185 rem *** R - nuke ***
50186 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50187 rem *** S - square ***
50188 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50189 rem *** T - square ***
50190 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50191 rem *** U - square ***
50192 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50193 rem *** V - square ***
50194 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50195 rem *** W - square ***
50196 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50197 rem *** X - square ***
50198 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50199 rem *** Y - square ***
50200 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50201 rem *** Z - square ***
50202 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50203 rem *** 0 - zero ***
50204 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50205 rem *** 1 - one ***
50206 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50207 rem *** 2 - two ***
50208 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50209 rem *** 3 - three ***
50210 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50211 rem *** 4 - four ***
50212 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50213 rem *** 5 - five ***
50214 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50215 rem *** 6 - six ***
50216 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50217 rem *** 7 - seven ***
50218 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50219 rem *** 8 - eight ***
50220 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50221 rem *** 9 - nine ***
50222 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50223 rem
50224 rem -=_*_=- BUILDINGS 
50225 rem *** A - attack ***
50226 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50227 rem *** B - build ***
50228 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50229 rem *** C - collect ***
50230 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50231 rem *** D - destroy ***
50232 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50233 rem *** E - eye ***
50234 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50235 rem *** F - fish ***
50236 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50237 rem *** G - goto ***
50238 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50239 rem *** H - home ***
50240 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50241 rem *** I - irrigate ***
50242 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50243 rem *** J - square ***
50244 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50245 rem *** K - square ***
50246 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50247 rem *** L - square ***
50248 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50249 rem *** M - mark ***
50250 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50251 rem *** N - nuke ***
50252 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50253 rem *** O - nuke ***
50254 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50255 rem *** P - pillage ***
50256 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50257 rem *** Q - nuke ***
50258 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50259 rem *** R - nuke ***
50260 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50261 rem *** S - square ***
50262 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50263 rem *** T - square ***
50264 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50265 rem *** U - square ***
50266 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50267 rem *** V - square ***
50268 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50269 rem *** W - square ***
50270 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50271 rem *** X - square ***
50272 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50273 rem *** Y - square ***
50274 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50275 rem *** Z - square ***
50276 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50277 rem *** 0 - zero ***
50278 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50279 rem *** 1 - one ***
50280 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50281 rem *** 2 - two ***
50282 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50283 rem *** 3 - three ***
50284 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50285 rem *** 4 - four ***
50286 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50287 rem *** 5 - five ***
50288 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50289 rem *** 6 - six ***
50290 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50291 rem *** 7 - seven ***
50292 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50293 rem *** 8 - eight ***
50294 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50295 rem *** 9 - nine ***
50296 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50297 rem
50298 rem -=_*_=- RESOURCES 
50299 rem *** A - attack ***
50300 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50301 rem *** B - build ***
50302 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50303 rem *** C - collect ***
50304 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50305 rem *** D - destroy ***
50306 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50307 rem *** E - eye ***
50308 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50309 rem *** F - fish ***
50310 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50311 rem *** G - goto ***
50312 color R,G,B,A : disc X,Y,60 : color 255,255,255,255 : shinit : shline X-50,Y : shcurve X,Y-50,X+50,Y: shcurve X,Y+50,X-50,Y : shdone : return
50313 rem *** H - home ***
50314 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50315 rem *** I - irrigate ***
50316 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50317 rem *** J - square ***
50318 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50319 rem *** K - square ***
50320 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50321 rem *** L - square ***
50322 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50323 rem *** M - mark ***
50324 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50325 rem *** N - platonium
50326 color R,G,B,A : disc X,Y,60 : color 255,255,0,255 : disc X,Y,45 : color 255,255,255,255 : shinit : shline X,Y : shline X-27,Y-37 : shcurve X,Y-55,X+27,Y-37 : shend : shline X,Y : shline X-45,Y : shcurve X-45,Y+25,X-25,Y+40 : shend : shline X,Y : shline X+45,Y : shcurve X+45,Y+25,X+25,Y+40 : shdone : return
50327 rem *** O - nuke ***
50328 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50329 rem *** P - pillage ***
50330 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50331 rem *** Q - nuke ***
50332 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50333 rem *** R - nuke ***
50334 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50335 rem *** S - square ***
50336 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50337 rem *** T - square ***
50338 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50339 rem *** U - square ***
50340 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50341 rem *** V - square ***
50342 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50343 rem *** W - square ***
50344 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50345 rem *** X - square ***
50346 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50347 rem *** Y - square ***
50348 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50349 rem *** Z - square ***
50350 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y-25 : shline X+25,Y-25 : shline X+25,Y+25 : shline X-25,Y+25 : shdone : return
50351 rem *** 0 - zero ***
50352 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50353 rem *** 1 - one ***
50354 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50355 rem *** 2 - two ***
50356 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50357 rem *** 3 - three ***
50358 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50359 rem *** 4 - four ***
50360 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50361 rem *** 5 - five ***
50362 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50363 rem *** 6 - six ***
50364 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50365 rem *** 7 - seven ***
50366 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50367 rem *** 8 - eight ***
50368 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50369 rem *** 9 - nine ***
50370 color R,G,B,A : disc X,Y,60 : color 0,0,0,255 : shinit : shline X-25,Y : shline X,Y-25 : shline X+25,Y : shline X,Y+25 : shdone : return
50371 rem
50372 rem -= END: ICONS =-
