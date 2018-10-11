10 rem line fonts
20 dim cP(16,4) : dim iR$(5)
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
71 iR$(1)="  neon   "
72 iR$(2)=" actions "
73 iR$(3)="  units  "
74 iR$(4)="buildings"
75 iR$(5)="resources"
99 X=0 : Y=0 : S=4 : cC=3 : iP=3 : iR=1 : iL=1 : MU=1 : ST$="hello abdc"
100 cls : color 255,255,255 : box (xsize/2)+(xsize/4),ysize/2,xsize/4,ysize/2
110 home : print "color: ";chr$(iL+64) : gosub 40005 : box 60,8,4,8
120 print "fonts: ";iR$(iR)
120 print "scale: [ ";S;" ]   pen: - ";iP;" +     "
130 print "cycle:  A-Z 0-9  "
140 print "mouse: LB:place  MB:color  RB:cycle"
1000 gosub 40003 : if MB<1 and KC<1 then goto 1000
1010 X=MX : Y=MY : if MU=0 then MU=1 else MU=0
1011 if MU then goto 1050
1020 if MB=1 then pen iP : gosub 2001
1030 if MB=2 then cC=cC+1 : if cC>16 then cC=1
1040 if MB=4 then iL=iL+1 : if iL>36 then iL=1
1050 rem if KC=32 then iR=iR+1 : if iR>5 then iR=1
1051 if KC=45 then iP=iP-1 : if iP<1 then iP=1
1052 if KC=61 then iP=iP+1 : if iP>9 then iP=9
1053 if KC=91 then S=S-.1 : if S<1 then S=10
1054 if KC=93 then S=S+.1 : if S>10 then S=1
1055 if KC=13 then goto 100
1060 if KC>47 and KC<58 then iL=KC-47+26
1070 if KC>64 and KC<91 then iL=KC-64
1075 if KC>96 and KC<123 then iL=KC-96
1080 MB=0 : KC=0
1090 update : sleep .1
1999 goto 110
2000 rem ** draw icon **
2001 if iR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
2002 if iR=2 then on iL gosub 150078,150080,150082,150084,150086,150088,150090,150092,150094,150096,150098,150100,150102,150104,150106,150108,150110,150112,150114,150116,150118,150120,150122,150124,150126,150128,150130,150132,150134,150136,150138,150140,150142,150144,150146,150148
2003 if iR=3 then on iL gosub 150152,150154,150156,150158,150160,150162,150164,150166,150168,150170,150172,150174,150176,150178,150180,150182,150184,150186,150188,150190,150192,150194,150196,150198,150200,150202,150204,150206,150208,150210,150212,150214,150216,150218,150220,150222
2004 if iR=4 then on iL gosub 150226,150228,150230,150232,150234,150236,150238,150240,150242,150244,150246,150248,150250,150252,150254,150256,150258,150260,150262,150264,150266,150268,150270,150272,150274,150276,150278,150280,150282,150284,150286,150288,150290,150292,150294,150296
2005 if iR=5 then on iL gosub 150300,150302,150304,150306,150308,150310,150312,150314,150316,150318,150320,150322,150324,150326,150328,150330,150332,150334,150336,150338,150340,150342,150344,150346,150348,150350,150352,150354,150356,150358,150360,150362,150364,150366,150368,150370
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
150372 rem -= END: FONTS =-
