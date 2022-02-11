1 rem NIETCIV.BAS - nietCiv Game
2 rem uses "icons shapes" to generate a background with 2 cities
3 rem we use a key bound randomizer to start so its always random
10 cls : dim cP(16,4) : dim fH$(9,3) : dim fS$(9,3) : debug=1
15 rem * predefines *
20 firstPass=1 : dfi=0 : dci=0 : dmi=0 : ' var dmi = dim map initialized
25 waterSeed=2 : islandTweak=5 : contenants=50 : borders=5 : ispeninsula=1
30 W=200 : H=200 : p=xsize-W : mapx=xsize : mapy=ysize : ' minimap
35 wsize=xsize-200 : hsize=ysize : grid=-1 : gwidth=1 : iR=1 : fR=1 : ' defaults
40 tMove=1 : T=7 : S=3                                 
45 getDrawVars=1 : drawArea=1 : drawLogo=1 : drawMap=1 : redrawWin=0 : drawHelp=1 : drawScore=0 : drawActions=0 : moreActions=1 : showingHelp=0 : showingInfo=0 : showingActions=0
46 textS=1.5 : textY=H+20 : textB=int(xsize/2)-90 : textL=textY-80 : TC=128
48 rem ******************************
49 rem *** colors - Dawnbringer16 ***
50 rem ******************************
51 cP(1,1)=78 : cP(1,2)=78 : cP(1,3)=78 : cP(1,4)=128 : rem  1 - dark gray
52 cP(2,1)=68 : cP(2,2)=36 : cP(2,3)=52 : cP(2,4)=128 : rem  2 - brown
53 cP(3,1)=48 : cP(3,2)=52 : cP(3,3)=109 : cP(3,4)=128 : rem  3 - blue
54 cP(4,1)=133 : cP(4,2)=76 : cP(4,3)=48 : cP(4,4)=128 : rem  4 - medium brown
55 cP(5,1)=52 : cP(5,2)=101 : cP(5,3)=36 : cP(5,4)=128 : rem  5 - dark green
56 cP(6,1)=117 : cP(6,2)=113 : cP(6,3)=97 : cP(6,4)=128 : rem  6 - medium gray
57 cP(7,1)=208 : cP(7,2)=70 : cP(7,3)=72 : cP(7,4)=128 : rem  7 - medium red
58 cP(8,1)=89 : cP(8,2)=125 : cP(8,3)=206 : cP(8,4)=128 : rem  8 - bright blue
59 cP(9,1)=210 : cP(9,2)=125 : cP(9,3)=44 : cP(9,4)=128 : rem  9 - medium orange
60 cP(10,1)=109 : cP(10,2)=170 : cP(10,3)=44 : cP(10,4)=128 : rem 10 - bright green
61 cP(11,1)=133 : cP(11,2)=149 : cP(11,3)=161 : cP(11,4)=128 : rem 11 - light grey
62 cP(12,1)=210 : cP(12,2)=170 : cP(12,3)=153 : cP(12,4)=128 : rem 12 - medium pink
63 cP(13,1)=109 : cP(13,2)=194 : cP(13,3)=202 : cP(13,4)=128 : rem 13 - light blue
64 cP(14,1)=218 : cP(14,2)=212 : cP(14,3)=94 : cP(14,4)=128 : rem 14 - light yellow
65 cP(15,1)=20 : cP(15,2)=12 : cP(15,3)=28 : cP(15,4)=128 : rem 15 - near black
66 cP(16,1)=222 : cP(16,2)=238 : cP(16,3)=212 : cP(16,4)=128 : rem 16 - off white
97 rem *************
98 rem *** stuff ***
99 rem *************
100 sScore=1000 : fScore=0 : sActions=0 : fActions=0 : sMouse=0 : fMouse=0 : sTicks=0 : sDays=0 : tDay=0 : tNight=0 : drawEnd=0 : drawWin=0
101 gBankers=0 : sPlatinum=0 : bPlatinum=0 : sGold=1 : bGold=0 : sSilver=0 : bSilver=0 : sCopper=0 : bCopper=0 : sBits=0
102 g=0 : sTired=0 : tTired=0 : sCold=0 : tCold=0 : sHot=0 : tHot=0 : sSleep=0 : tSleep=0 : sWeight=0 : tWeight=0 : sNature=0 : tNature=0 : wNature=0 : iNature=0
103 gMind=0 : sNtelligence=0 : tIntelligence=0 : sKnowledge=0 : tKnowledge=0 : sLaw=0 : tLaw=0 : sDiplomacy=0 : tDiplomacy=0 : sKlaxisaur=0 : tKalxisaur=0 : sHonour=0 : tHonour=0 : bSchool=0 : bUniversity=0 : bZenBudist=0
104 gBody=0 : sStrength=0 : tStrength=0 : sConstitution=0 : tConstitution=0 : sEndurance=0 : tEndurance=0 : sDexterity=0 : tDexterity=0 : sReflexes=0 : tReflexes=0 : sCharisma=0 : tCharisma=0 : bBeautician=0 : bTaiChi=0
105 gEvangelists=0 : pCharisma=0 : pIntelligence=0 : pKnowledge=0 : pLaw=0 : pDiplomacy=0 : pKlaxisaur=0 : pStrength=0 : pConstitution=0 : pNdurance=0 : pDexterity=0 : pReflexes=0 : pHonourable=0
106 gWorkingMans=0 : sWork=0 : sEmployee=0 : sEmployed=0 : sVolunteer=0 : sTrain=0 : sLearn=0 : sTeach=0 : sPractice=0
110 gTravellers=0 : vShoes=0 : vTrainers=0 : vSprinters=0 : vAnimal=0 : vBullock=0 : vCow=0 : vHorse=0 : vMare=0 : vPony=0 : vKlaxisaur=0
111 gYachClucb=0 : vFloat=0 : vSafteyFloats=0 : vWetSuit=0 : vDingy=0 : vCanoe=0 : vKayak=0 : vYacht=0 : vSailBoat=0 : vBoat=0 : vShip=0 : bBoatBuilders=0
112 gAviators=0 : vFly=0 : vWings=0 : vFlyingMachine=0 : vGlider=0 : vKlaxisaur=0 : bScouts=0 : bGuides=0
120 gProfessionals=0 : iD=0 : iMap=0 : iBinoculas=0 : iSurvey=0 : iDiplomat=0 : iTeacher=0 : iProfessor=0 : iTrainer=0 : iProfessional=0 : iWatch=0 : iStopWatch=0
121 gRangers=0 : sHunt=0 : wPickAxe=0 : iPickAxe=0 : wSpear=0 : iSpear=0 : wArchery=0 : iBow=0 : iLongBow=0 : iCrossBow=0 : iQuiver=0 : xAnimals=0 : xLeather=0
122 gWarriors=0 : wKnife=0 : iKnife=0 : wSword=0 : iSword=0 : iKatana=0 : iShirkin=0 : wNinjistu=0 : bBarracks=0
123 gFisherman=0 : sFishing=0 : iPhishingSpear=0 : iPhishingRod=0 : wRod=0 : iPhishingNet=0 : wNet=0 : iPhishingDynamite=0 : sFish=0 : tFish=0 : xFish=0 : rFish=0 : rShellFish=0 : rWhale=0
124 gPyro=0 : sDynamite=0 : tDynamite=0 : wDynamite=0 : iDynamite=0 : sExplosions=0 : rSaltPeter=0 : rAsh=0
130 gMerchants=0 : sBought=0 : sSold=0 : sFound=0 : sMade=0 : sResources=0 : sGems=0 : sActions=0 : sWork=0 : sMine=0 : sForge=0
140 gAtheletes=0 : bGym=0 : bTraningFacility=0 : sWalk=0 : sRun=0 : sJog=0 : sSprint=0
141 gBreeders=0 : bCaroull=0 : bStables=0 : sRide=0 : sTrott=0 : sCanter=0 : sRideHard=0
142 sFloat=0 : sDogPaddle=0 : sSwim=0 : sRow=0 : sPaddle=0 : sSail=0 : rCanvas=0 : iOars=0 : iPaddles=0 : iSail=0 : iMast=0 : bPool=0 : bSeaScouts=0
143 sFly=0 : sWings=0 : sFlyingMachine=0 : sGlide=0 : sLevitate=0 : sTeleport=0
150 gCarpenters=0 :sWood=0 : wAxe=0 : iAxe=0 : iSaw=0 : iSandPaper=0 : rTreeSeeds=0 : rWoodSticks=0 : rWoodLogs=0 : rWoodPlanks=0 : rWoodDowel=0 : rWoodPole=0 : bLumberMill=0 : bCarpenters=0
151 gSmiths=0 :wHammer=0 : iHammer=0 : iBlackSmithHammer=0 : bForge=0 : bBlackSmith=0 : bTools=0 : bMachines=0
152 gTailers=0 : sCoton=0 : rCoton=0 : rCloth=0 : rSilk=0 : iSilkWork=0 : sClothing=0 : rRubberSeeds=0 : bClothes=0 : bShoes=0 : bRubber=0 : rSap=0 : rGum=0
153 gMiners=0 : sMetal=0 : rPlatinum=0 : rGold=0 : rSilver=0 : rCopper=0 : rTin=0 : rIron=0 : rSteel=0 : rTunstan=0 : rCoal=0 : rCoke=0
154 gJewelers=0 : iGemSmith=0 : bGemStones=0 : rDiamonds=0 : rZirconias=0 : rRuby=0 : rEmerald=0 : rSaphires=0 : rAmythist=0 : rQuartz=0 : rFoolsGold=0 : bJewelers=0
160 gMages=0 : sMagic=0 : tMagic=0 : mMagic=0 : mLevitate=0 : mTeleport=0 : mAxe=0 : mHammer=0 : mPickAxe=0 : mFishing=0 : mKlaxisaur=0 : mFire=0 : mExplosion=0 : mRaiseLand=0 : mLowerLand=0 : mIllusions=0
170 gMasons=0 : sStone=0 : rGrannet=0 : rMarbel=0 : rSandStone=0 : sGravel=0 : rFlake=0 : rShale=0 : rSoapStone=0
175 gCheifs=0 : rBread=0 : rVegies=0 : rMeat=0 : rCheese=0 : rMilk=0 : rCream=0 : rEggs=0 : rStock=0 : bKitchen=0 : bBakers=0 : bPatiserie=0 : bCafe=0
176 gRestauranteurs=0 : bRestaurant=0 : gBrewers=0 : bPub=0 : gDistillers=0 : bLiquorStore=0
180 gArtisans=0 : bArtWorkshop=0 : iPainting=0 : iStatue=0 : iJewelery=0 : iPottery=0 : iIllusion=0 : iGame=0 : rClay=0 : rOcre=0 : rLapisLazuli=0
185 gFarmers=0 : bStockade=0 : gGrowers=0 : bGranery=0 : bWareHouse=0 : bGenetisist=0
190 gSuperHeroes=0 : gAntiHeroes=0
900 rem ****************************
901 rem *** feelings & happiness ***
902 rem ****************************
910 if dhi>0 then goto 1005 else dhi=1
911 fS$(1,1)="0"  : fS$(1,2)="not saying much"    : fS$(1,3)="indifferent"
912 fS$(2,1)="-1" : fS$(2,2)="whispering"         : fS$(2,3)="apprihensive"
913 fS$(3,1)="-2" : fS$(3,2)="making complaints"  : fS$(3,3)="disengenuos"
914 fS$(4,1)="-3" : fS$(4,2)="talking rudely"     : fS$(4,3)="rude"
915 fS$(5,1)="-4" : fS$(5,2)="being slanderous"   : fS$(5,3)="sullen"
916 fS$(6,1)="-5" : fS$(6,2)="cursing loudly"     : fS$(6,3)="fiesty"
917 fS$(7,1)="-6" : fS$(7,2)="being blasphomous"  : fS$(7,3)="threatening"
918 fS$(8,1)="-7" : fS$(8,2)="yelling angrily"    : fS$(8,3)="aggressive"
919 fS$(9,1)="-8" : fS$(9,2)="openly challenging" : fS$(9,3)="psychpathic"
922 fH$(1,1)="0"  : fH$(1,2)="chatting quietly"   : fH$(1,3)="mild mannered"
922 fH$(2,1)="1"  : fH$(2,2)="being graceous"     : fH$(2,3)="gentle"
923 fH$(3,1)="2"  : fH$(3,2)="talking openly"     : fH$(3,3)="upbeat"
924 fH$(4,1)="3"  : fH$(4,2)="making compliments" : fH$(4,3)="generous"
925 fH$(5,1)="4"  : fH$(5,2)="speaking praises"   : fH$(5,3)="happy"
926 fH$(6,1)="5"  : fH$(6,2)="singing praises"    : fH$(6,3)="euphoric"
927 fH$(7,1)="6"  : fH$(7,2)="glorifying things"  : fH$(7,3)="simple minded"
928 fH$(8,1)="7"  : fH$(8,2)="babbling on"        : fH$(8,3)="crazy"
929 fH$(9,1)="8"  : fH$(9,2)="being incoherant"   : fH$(9,3)="schitzophenic"
999 '                     S$="S             SCORE" : gosub 40009
1000 rem ******************************************
1001 rem *** dimension map based on screen size ***
1002 rem ******************************************
1005 L=1 : gosub 201010 : L=2 : gosub 201010
1007 R=rnd(11) : G=rnd(12) : B=rnd(16) : A=rnd(255) : x$=inkey$ : if x$="" then goto 1007 else KC=asc(x$)
1010 if dmi>0 then goto 1111 else dmi=1
1011 if xsize=640 then dim m(640,480,8)
1012 if xsize=800 then dim m(800,600,8) : S=4
1013 if xsize=1024 then dim m(1024,768,8) : S=4
1014 if xsize=1280 then dim m(1280,720,8) : S=5
1015 if xsize=1360 then dim m(1360,768,8) : S=5
1099 goto 2011
1100 rem **********************
1101 rem *** clear map data ***
1100 rem **********************
1111 for Y=1 to H
1122  for X=p to mapx
1150   m(X,Y,1)=0 : m(X,Y,2)=0 : m(X,Y,3)=0 : m(X,Y,4)=0 : m(X,Y,5)=0
1182  next X
1191 next Y
2000 rem * generate land and water *
2011 for Y=1 to H
2022  for X=p to mapx
2030   R=rnd(255) : G=rnd(255) : B=rnd(255) : A=rnd(255)
2040   if m(X,Y,1)=128 and m(X,Y,2)=128 and m(X,Y,3)=255 and m(X,Y,4)=0 then goto 2082
2050   m(X,Y,1)=64 : m(X,Y,2)=255 : m(X,Y,3)=64 : m(X,Y,4)=A : if B>251 then gosub 2110
2082  next X
2091 next Y
2098 ' L=2 : gosub 201010
2099 goto 203700 : ' map base done; jump to city gen
2100 rem ****************************
2101 rem *** the water randomizer ***
2102 rem ****************************
2110 if X<p+borders or X>mapx-borders then return
2120 if Y<borders or Y>H-borders then return
2130 if contenants=0 then goto 2210 else c=abs(contenants)
2140 if c>H/2 then c=int(c/3)
2150 cx=c : cy=H/2 : e=ispeninsula
2160 dx=X-p-cx : dy=cy-Y-cx+dx : if dx<0 and dy<0 and Y<cy then return
2170 if e=1 then goto 2190 else dx=X-p-cx : dy=Y-cy-cx+dx : if dx<0 and dy<0 and Y>cy then return
2180 dx=mapx-cx-X : dy=cy-Y-cx+dx : if dx<0 and dy<0 and Y<cy then return
2190 dx=mapx-cx-X : dy=Y-cy-cx+dx : if dx<0 and dy<0 and Y>cy then return
2210 if islandTweak<1 then islands=0 else islands=rnd(islandTweak)
2220 r=waterSeed+islands
2240 m(X,Y,1)=128 : m(X,Y,2)=128 : m(X,Y,3)=255 : m(X,Y,4)=0
2250 q=r : ' var r = pen radius for graphics; not used
2300 rem * diffent fill algorythm for different radius *
2310 for i=1 to q
2320  if i=1 gosub 3010
2330  if i=2 gosub 3110
2340  if i>2 gosub 3210
2350 next
2360 return
3000 rem * fill radius=1 algorythm *
3010 if X-1>0 then m(X-1,Y,1)=m(X,Y,1) : m(X-1,Y,2)=m(X,Y,2) : m(X-1,Y,3)=m(X,Y,3) : m(X-1,Y,4)=m(X,Y,4)
3020 if Y-1>0 then m(X,Y-1,1)=m(X,Y,1) : m(X,Y-1,2)=m(X,Y,2) : m(X,Y-1,3)=m(X,Y,3) : m(X,Y-1,4)=m(X,Y,4)
3030 if X+1<mapx then m(X+1,Y,1)=m(X,Y,1) : m(X+1,Y,2)=m(X,Y,2) : m(X+1,Y,3)=m(X,Y,3) : m(X+1,Y,4)=m(X,Y,4)
3040 if Y+1<mapy then m(X,Y+1,1)=m(X,Y,1) : m(X,Y+1,2)=m(X,Y,2) : m(X,Y+1,3)=m(X,Y,3) : m(X,Y+1,4)=m(X,Y,4)
3050 return
3100 rem * fill radius=2 algorythm *
3110 if X-1>0 and Y-1>0 then m(X-1,Y-1,1)=m(X,Y,1) : m(X-1,Y-1,2)=m(X,Y,2) : m(X-1,Y-1,3)=m(X,Y,3) : m(X-1,Y-1,4)=m(X,Y,4)
3120 if X+1<mapx and Y-1>0 then m(X+1,Y-1,1)=m(X,Y,1) : m(X+1,Y-1,2)=m(X,Y,2) : m(X+1,Y-1,3)=m(X,Y,3) : m(X+1,Y-1,4)=m(X,Y,4)
3130 if X+1<mapx and Y+1<mapy then m(X+1,Y+1,1)=m(X,Y,1) : m(X+1,Y+1,2)=m(X,Y,2) : m(X+1,Y+1,3)=m(X,Y,3) : m(X+1,Y+1,4)=m(X,Y,4)
3140 if X-1>0 and Y+1<mapy then m(X-1,Y+1,1)=m(X,Y,1) : m(X-1,Y+1,2)=m(X,Y,2) : m(X-1,Y+1,3)=m(X,Y,3) : m(X-1,Y+1,4)=m(X,Y,4)
3150 return
3200 rem * fill radius>2 algorythm *
3210 d=i-1 : r=int(i/2) 
3220 if (i/2)=abs(i/2) then goto 3410 : ' var i = radius; is it even number?
3230 dxl=X-d : dxr=X+d : dyu=Y-d : dyd=Y+d 
3240 rxl=X-r : rxr=X+r : ryu=Y-r : ryd=Y+r
3300 rem * fill radius=odd algorythm *
3310 if dxl<1 then goto 3320
3312  if ryu>0 then for dxy=ryu to Y : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
3314  if ryd<=mapy then for dxy=Y to ryd : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
3320 if dyu<1 then goto 3330
3322  if rxl>0 then for dxy=rxl to X : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
3324  if rxr<=mapx then for dxy=X to rxr : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
3330 if dxr>mapx then goto 3340
3332  if ryu>0 then for dxy=ryu to Y : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
3334  if ryd<=mapy then for dxy=Y to ryd : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
3340 if dyd>mapy then goto 3345
3342  if rxl>0 then for dxy=rxl to X : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
3344  if rxr<=mapx then for dxy=X to rxr : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
3345 return
3400 rem * fill radius=even algorythm *
3410 rem *** FIXME: this one needs to do increasing corners, not sides ***
3430 dxl=X-d : dxr=X+d : dyu=Y-d : dyd=Y+d 
3440 rxl=X-r : rxr=X+r : ryu=Y-r : ryd=Y+r 
3510 if dxl<1 then goto 3520
3512  if ryu>0 then for dxy=ryu to Y : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
3514  if ryd<=mapy then for dxy=Y to ryd : m(dxl,dxy,1)=m(X,Y,1) : m(dxl,dxy,2)=m(X,Y,2) : m(dxl,dxy,3)=m(X,Y,3) : m(dxl,dxy,4)=m(X,Y,4) : next
3520 if dyu<1 then goto 3530
3521 rem print rxl;dyu,X;Y,rxr;dyu
3522  if rxl>0 then for dxy=rxl to X : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
3524  if rxr<=mapx then for dxy=X to rxr : m(dxy,dyu,1)=m(X,Y,1) : m(dxy,dyu,2)=m(X,Y,2) : m(dxy,dyu,3)=m(X,Y,3) : m(dxy,dyu,4)=m(X,Y,4) : next
3530 if dxr>mapx then goto 3540
3532  if ryu>0 then for dxy=ryu to Y : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
3534  if ryd<=mapy then for dxy=Y to ryd : m(dxr,dxy,1)=m(X,Y,1) : m(dxr,dxy,2)=m(X,Y,2) : m(dxr,dxy,3)=m(X,Y,3) : m(dxr,dxy,4)=m(X,Y,4) : next
3540 if dyd>mapy then goto 3545
3542  if rxl>0 then for dxy=rxl to X : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
3544  if rxr<=mapx then for dxy=X to rxr : m(dxy,dyd,1)=m(X,Y,1) : m(dxy,dyd,2)=m(X,Y,2) : m(dxy,dyd,3)=m(X,Y,3) : m(dxy,dyd,4)=m(X,Y,4) : next
3545 return
3800 rem *************************
3801 rem *** get display area ****
3802 rem *************************
3810 OX=0 : OY=0 : G=(grid*gwidth) : CR=S*5
3911 if T=1 then CX=((5*S)*2)+G : CY=((5*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-1
3922 if T=2 then OY=10 : CX=((7*S)*2)+G : CY=((3.5*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-2
3933 if T=3 then OX=10 : OY=10 : CX=((9*S)*2)+G : CY=((3*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-2 : if G=0 then OX=-10
3944 if T=4 then OX=10 : OY=10 : CX=((10*S)*2)+G : CY=((2.5*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-2 : if G=0 then OX=-15
3955 if T=5 then CX=((5*S)*2)+G : CY=((5*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-1
3966 if T=6 then OY=5 : CX=((6*S)*2)+G : CY=((5*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-1
3977 if T=7 then OX=0 : OY=10 : CX=((5*S)*2)+G : CY=((5*S)*2)+G : mapw=int(wsize/CX)-1 : maph=int(hsize/CY)-1 : if G=0 then OX=-8 : OY=7
3978 if T=7 and G<0 then OX=-7
3995 drawX=xmap-int(mapw/2)-1 : drawY=ymap-int(maph/2)-1
3999 return
5000 rem * clear display area *
5005 color 0,0,0,255 : box int(wsize/2),int(hsize/2),int(wsize/2),int(hsize/2) : ' clear draw area
5099 return
5100 rem ************************
5101 rem *** display map area ***
5102 rem ************************
5110 pen 1 
5201 for i=1 to maph
5212  for j=1 to mapw
5220   dX=drawX+j : dY=drawY+i : dH=dY/2
5230   if dX<1 or dY<1 then goto 5982
5231   if dX>mapx or dY>mapy then goto 5982
5232   if (m(dX,dY,4)&256)=0 then goto 5982
5240   color m(dX,dY,1),m(dX,dY,2),m(dX,dY,3),128
5315   if T=1 then gosub 6010
5325   if T=2 then gosub 6020
5335   if T=3 then gosub 6030
5345   if T=4 then gosub 6040
5355   if T=5 then gosub 6050
5365   if T=6 then gosub 6060
5375   if T=7 then gosub 6070
5410   C=m(dX,dY,5) : if C>0 then R=cP(C,1) : G=cP(C,2) : B=cP(C,3) : A=255 : pen 1 : gosub 50080
5430   R=255 : G=255 : B=255 : A=128
5440   if dX=xmap and dY=ymap then pen 3 : x$=Player$ : gosub 40017
5982  next
5991 next
5995 if drawLogo then gosub 6600
5998 drawArea=0
5999 return
6000 rem * map tile types *
6010 X=OX+((5*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 6101
6015 goto 6110
6020 X=OX+((7*S)*j*2) : Y=OY+((3.5*S)*i*2) : gosub 6101
6022 if dH=int(dh) then X=X+(7*S)
6025 goto 6150
6030 X=OX+((9*S)*j*2) : Y=OY+((3*S)*i*2) : gosub 6101
6032 if dH=int(dh) then X=X+(9*S)
6035 goto 6130
6040 X=OX+((10*S)*j*2) : Y=OY+((2.5*S)*i*2) : gosub 6101
6042 if dH=int(dh) then X=X+(10*S)
6045 goto 6140
6050 X=OX+((5*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 6101
6055 goto 6120
6060 X=OX+((6*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 6101
6062 if dH=int(dh) then X=X+(6*S)
6065 goto 6120
6070 X=OX+((5*S)*j*2) : Y=OY+((5*S)*i*2) : gosub 6101
6072 if (i/2)=int(i/2) then X=X+(5*S)
6073 if (j/2)=int(j/2) then Y=Y-(5*S)
6075 goto 6120
6101 if grid=-1 then X=X-(gwidth*J) : Y=Y-(gwidth*I) : return
6102 if grid=1 then X=X+(gwidth*J) : Y=Y+(gwidth*I) : return
6103 return
6110 box X,Y,S*5,S*5 : return
6120 disc X,Y,S*7 : return
6130 shinit:shline X-(S*6),Y:shline X-(S*3),Y-(S*6):shline X+(S*3),Y-(S*6):shline X+(S*6),Y:shline X+(S*3),Y+(S*6):shline X-(S*3),Y+(S*6):shdone : return
6140 shinit:shline X-(S*7),Y:shline X-(S*3),Y-(S*5):shline X+(S*3),Y-(S*5):shline X+(S*7),Y:shline X+(S*3),Y+(S*5):shline X-(S*3),Y+(S*5):shdone : return
6150 shinit:shline X-(S*7),Y:shline X,Y-(S*7):shline X+(S*7),Y:shline X,Y+(S*7):shdone : return
6600 rem ************
6601 rem *** logo ***
6602 rem ************
6660 rem X=xsize/2 : Y=ysize/2 : Y=Y+50 : L=150
6661 rem L=150 : K=25 : X=xsize-L-5 : Y=ysize-K-5
6662 L=150 : K=25 : X=L+5 : Y=ysize-K-5
6670 rem color 0,0,255,128 : box X,Y,L,K round 5 : color 255,255,0,255 : pen 3 : rect X,Y,L,K round 5
6680 S1$="NIETCIV  XVIII" : S2$=" NIETCIV  2018" : S3$="NIETCIV MMXVIII" : S$=S3$ : e=len(S$) : X=X-L
6690 R=255 : G=255 : B=255 : A=255 : ' text color
6711 for i=1 to e
6720  X=X+((3*S)*2)
6730  x$=mid$(S$,i,1) : if x$=" " then goto 6791
6740  iL=asc(x$)-64 : if iL<1 then iL=iL+64-47+26
6760  R=128 : G=128 : B=128 : A=128 : pen 3 : X=X+4 : Y=Y+3 : if fR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
6760  R=255 : G=255 : B=0 : A=255 : pen 3 : X=X-4 : Y=Y-3 : if fR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
6770  R=0 : G=0 : B=255 : A=255 : pen 1 : X=X+1 : if fR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
6791 next
6799 return
6800 rem ***********************
6801 rem *** display minimap ***
6802 rem ***********************
6805 color 0,0,0,255 : box p+int(W/2),int(H/2),int(W/2),int(H/2) : ' clear mini map
6810 rem pen 1
6821 for Y=1 to H
6832  for X=p to mapx
6840   A=128 : if m(X,Y,4)<256 then A=0
6850   color m(X,Y,1),m(X,Y,2),m(X,Y,3),A 
6860   move X,Y : spot
6882  next X
6891 next Y
6895 rem color 255,255,255,128 : pen 1 : rect xmap,ymap,int(mapw/2),int(maph/2)
6898 drawMap=0
6899 return
6900 rem * clear text area *
6910 color 0,0,0,255 : box p+int(W/2),H+int((ysize-H)/2),int(W/2),int((ysize-H)/2) : ' clear text area
6999 return
7000 rem *************************
7001 rem *** display help text ***
7002 rem *************************
7005 OS=S : S=textS : R=0 : G=128 : B=0 : A=TC : pen 1
7010 X=p+int(W/2) : Y=textY : color R,G,B,A : rect X,Y,int(W/2)-4,3 round 3
7011 X=p+10 : Y=Y+((3*S)*4) : S$="TAB          SCORES" : gosub 40009
7012 X=p+10 : Y=Y+((3*S)*4) : S$="ARROW        MOTIVE" : gosub 40009
7013 X=p+10 : Y=Y+((3*S)*4) : S$="MOUSE        WANDER" : gosub 40009
7014 X=p+10 : Y=Y+((3*S)*4) : S$="SPACE        ACTION" : gosub 40009
7015 X=p+10 : Y=Y+((3*S)*4) : S$="ENTER        SUBUKU" : gosub 40009
7016 X=p+10 : Y=Y+((3*S)*4) : S$="1 7            VIEW" : gosub 40009
7017 X=p+10 : Y=Y+((3*S)*4) : S$="PLUS MINUS     ZOOM" : gosub 40009
7018 X=p+10 : Y=Y+((3*S)*4) : S$="BRACKETS     SPREAD" : gosub 40009
7019 X=p+10 : Y=Y+((3*S)*4) : S$="0              ZERO" : gosub 40009
7020 X=p+10 : Y=Y+((3*S)*4) : S$="L       TOGGLE LOGO" : gosub 40009
7021 X=p+10 : Y=Y+((3*S)*4) : S$="K   TEXT BRIGHTNESS" : gosub 40009
7022 X=p+10 : Y=Y+((3*S)*4) : S$="QUESTION MARK  THIS" : gosub 40009
7110 X=p+int(W/2) : Y=Y+((3*S)*4) : rect X,Y,int(W/2)-4,3 round 3
7120 textN=Y+((3*S)*4)
7196 S=OS
7198 drawHelp=0 : drawScore=0 : showingInfo=0 : showingActions=0 : showingHelp=1
7199 return
7200 rem *************************
7201 rem *** undraw map window ***
7202 rem *************************
7210 drawX=oldX-int(mapw/2)-1 : drawY=oldY-int(maph/2)-1 : pen 1
7230 jx=mapw+2
7240 iy=maph+2
7321 for i=1 to iy
7332  for j=1 to jx
7340 rem  if i=1 or j=1 then goto 7370
7350 rem  if i=iy or j=jx then goto 7370
7360 rem  goto 7412
7370   X=drawX+j : Y=drawY+i : move X,Y
7375   if X<p or Y<1 then goto 7412
7376   if X>mapx or Y>H then goto 7412
7380   color 0,0,0 : spot
7390   color m(X,Y,1),m(X,Y,2),m(X,Y,3),128 : spot
7412  next
7421 next
7499 return
7500 rem ***********************
7501 rem *** draw map window ***
7502 rem ***********************
7510 drawX=xmap-int(mapw/2) : drawY=ymap-int(maph/2) : pen 1
7530 jx=mapw
7540 iy=maph
7621 for i=1 to iy
7632  for j=1 to jx
7640   if i=1 or j=1 then goto 7670
7650   if i=iy or j=jx then goto 7670
7660   goto 7712
7670   X=drawX+j : Y=drawY+i : move X,Y
7675   if X<p or Y<1 then goto 7712
7676   if X>mapx or Y>H then goto 7712
7680   color 255,255,255,128 : spot
7712  next
7721 next
7798 redrawWin=0
7799 return
7800 rem **************************
7801 rem *** display score text ***
7802 rem **************************
7805 OS=S : S=textS : R=0 : G=128 : B=0 : A=TC : pen 1
7810 X=p+int(W/2) : Y=textY : color R,G,B,A : rect X,Y,int(W/2)-4,3 round 3
7811 X=p+10 : Y=Y+((3*S)*4) : S$="COUNTDOWN  "+str$(sScore) : gosub 40009
7812 if sActions then X=p+10 : Y=Y+((3*S)*4) : S$="ACTIONS    "+str$(sActions) : gosub 40009
7813 if sWalk then X=p+10 : Y=Y+((3*S)*4) : S$="WALKED     "+str$(sWalk) : gosub 40009
7814 'X=p+10 : Y=Y+((3*S)*4) : S$="ARROWS         MOVE" : gosub 40009
7815 'X=p+10 : Y=Y+((3*S)*4) : S$="ENTER       NEW MAP" : gosub 40009
7816 'X=p+10 : Y=Y+((3*S)*4) : S$="1 7           TILES" : gosub 40009
7817 'X=p+10 : Y=Y+((3*S)*4) : S$="PLUS MINUS    SCALE" : gosub 40009
7818 'X=p+10 : Y=Y+((3*S)*4) : S$="BRACKETS     BORDER" : gosub 40009
7819 'X=p+10 : Y=Y+((3*S)*4) : S$="0             RESET" : gosub 40009
7821 X=p+int(W/2) : Y=Y+((3*S)*4) : rect X,Y,int(W/2)-4,3 round 3
7822 textN=Y+((3*S)*4)
7830 if drawEnd then X=p+10 : Y=Y+((3*S)*4) : S$="AND SO IT GOES LIKE" : gosub 40009
7831 if drawEnd then X=p+10 : Y=Y+((3*S)*4) : S$="SAND IN A HOURGLASS" : gosub 40009 : if fMouse=0 then fMouse=sMouse
7832 if drawWin then X=p+10 : Y=Y+((3*S)*4) : S$="  BUT NOT FOR YOU  " : gosub 40009 : if fScore=0 then fScore=sScore : fActions=sActions
7833 if drawWin then X=p+10 : Y=Y+((3*S)*4) : S$="USEFULNESS "+str$(fActions) : gosub 40009
7833 if drawEnd then if sMouse>0 then X=p+10 : Y=Y+((3*S)*4) : S$="  LAZYNESS "+str$(fMouse) : gosub 40009
7834 if drawWin then X=p+10 : Y=Y+((3*S)*4) : S$="FINAL SCORE "+str$(fScore) : gosub 40009
7835 if drawEnd then X=p+10 : Y=Y+((3*S)*4) : S$="BEST EVER SCORE 837" : gosub 40009
7997 S=OS
7998 drawScore=1 : showingInfo=0 : showingActions=0 : showingHelp=0
7999 return
8000 rem *****************
8001 rem *** main loop ***
8002 rem *****************
8005 update
8006 if m(xmap,ymap,4)&1024>0 or sScore<1 then drawScore=1 : drawEnd=1 : if sScore>0 then drawWin=1
8010 if redrawWin then gosub 7210
8020 if getDrawVars then gosub 3810 : ' set display area variables
8030 if drawArea or redrawWin then if firstPass then gosub 5110 else gosub 5005 : gosub 5110
8040 if drawHelp then gosub 6910 : gosub 7005
8050 if drawScore then gosub 6910 : gosub 7805
8060 if drawTileInfo then gosub 6910 : gosub 12010
8070 if drawActions then gosub 6910 : gosub 15010
8080 if drawMap then gosub 6805 : gosub 7510
8090 if redrawWin or firstPass then gosub 7510
9997 if sActions=0 then L=1 : gosub 201010 : L=2 : gosub 201010 : L=3 : gosub 201010 : L=4 : gosub 201010 : L=5 : gosub 201010
9998 firstPass=0
9999 for i=-1 to KC : C=rnd(i) : R=rnd(11) : G=rnd(12) : B=rnd(16) : A=rnd(255) : next : ' randomizer
10000 rem **********************************
10001 rem *** key capture and assignment ***
10002 rem **********************************
10005 oldX=xmap : oldY=ymap : move 1,1 : KC=0 : if debug then print @1;xmap;",";ymap;"-";m(Xmap,Ymap,4);";";m(Xmap,Ymap,5); : if m(Xmap,Ymap,5)>0 then print city$(m(Xmap,Ymap,5),1);"                    " else print "                   "
10010 gosub 40003
10011 if MB>0 then goto 39003 : ' mouse click
10012 if KC=-1 and Mgoto then goto 39015 : ' auto move
10013 if KC=-1 then goto 9999 : ' no keys or mouse
10014 if KC>399 then goto 10200 : ' movement keys
10051 if debug and KC=68 then gosub 10410 : ' D dump city$()
10052 if debug and KC=67 then gosub 10510 : ' C dump character
10053 if debug and KC=73 then gosub 10510 : ' I dump inventory
10054 if debug and KC=75 then gosub 10510 : ' K dump knowledge
10111 if KC=13 then getDrawVars=1 : drawArea=1 : drawText=1 : drawMap=1 : firstPass=1 : drawHelp=showingHelp : drawTileInfo=showingInfo : drawActions=showingActions : cls : goto 100 : ' enter new map
10112 if KC=91 then grid=grid-1 : getDrawVars=1 : redrawWin=1 : if grid<-1 then grid=-1 : ' [ border
10113 if KC=93 then grid=grid+1 : getDrawVars=1 : redrawWin=1 : if grid>1 then grid=1 : ' ] border
10114 if KC=59 then gwidth=gwidth-1 : getDrawVars=1 : redrawWin=1 : if gwidth<0 then gwidth=0 : ' ; distance
10115 if KC=39 then gwidth=gwidth+1 : getDrawVars=1 : redrawWin=1 : if gwidth>100 then gwidth=100 : ' ' distance
10116 if KC=45 then S=S-1 : getDrawVars=1 : redrawWin=1 : if S<1 then S=10 : ' - scale
10117 if KC=43 or KC=61 then S=S+1 : getDrawVars=1 : redrawWin=1 : if S>10 then S=1 : ' + scale
10118 if KC=48 then S=3 : gwidth=1 : grid=-1 : getDrawVars=1 : redrawWin=1 : ' 0 reset
10119 if KC>48 and KC<56 then T=KC-48 : getDrawVars=1 : redrawWin=1 : ' 1 - 7 tiles
10120 if KC=63 or KC=47 then drawHelp=1 : ' ? draw help
10122 if KC=92 then drawArea=1 : if drawLogo then drawLogo=0 else drawLogo=1 : ' \ logo toggle
10123 if KC=8 then if TC=128 then TC=192 else if TC=255 then TC=128 else TC=255 : ' BACKSPACE toggle brightness
10124 if KC=9 then drawScore=1 : ' TAB draw scores
10125 if KC=384 then drawTileInfo=1 : ' F1 draw tile info
10126 if KC=32 then drawActions=1 : if showingActions then moreActions=moreActions+1 : if moreActions>4 then moreActions=0 : ' SPACE draw actions
10199 rem * direction keys *
10200 if KC=400 then on T gosub 29994,29994,29985,29985,29994,29994,29994 : ' left
10201 if KC=401 then on T gosub 29995,29995,29984,29984,29995,29995,29995 : ' right
10202 if KC=402 then on T gosub 29996,29998,29998,29998,29996,29996,29996 : ' up
10203 if KC=403 then on T gosub 29997,29999,29999,29999,29997,29997,29997 : ' down
10204 if KC=404 then on T gosub 29990,29983,29983,29983,29990,29983,29990 : ' up right
10205 if KC=405 then on T gosub 29991,29984,29984,29984,29991,29984,29991 : ' down right
10206 if KC=406 then on T gosub 29992,29985,29985,29985,29992,29985,29992 : ' up left
10207 if KC=407 then on T gosub 29993,29986,29986,29986,29993,29986,29993 : ' down left
10208 K=KC
10319 print @1;KC;
10320 goto 8000
10400 rem *************
10401 rem *** debug ***
10402 rem *************
10403 rem * dump city$() *
10410 for i=1 to 20
10415  print "city$(";str$(i);", .. )=";
10420  for j=1 to 20
10430   print city$(i,j)",";
10440  next j
10450  print
10460 next i
10490 x$=inkey$ : if x$="" then goto 10490
10498 drawMap=1 : drawArea=1 : drawHelp=1
10499 return
10503 rem * dump character *
10510 print "Human =";tHuman
10511 print "Klax  =";tKlax
10512 print "Ghost =";tGhost
10513 print "Leader=";tLeader; : if tHome and tLeader and tNti=0 then print city$(tHome,16) else print
10514 print "Anti  =";tNti; : if tHome and tNti then print city$(tHome,17) else print
10515 print "Guild =";tGuild; : if tGuild then print city$(tGuild,13) else print
10516 print "AGuild=";tNtiGuild; : if tNtiGuild then print city$(tNtiGuild,14) else print
10517 print "Monk  =";tMonk
10518 print "Mage  =";tMage
10519 print "Trnslt=";tTranslator
10520 print "Memory=";tMemory
10521 print "Rememb=";tRemember
10522 print "Wounds=";tWounded
10523 print "Agro  =";tAggresive
10524 print "Trans =";tTranscend
10525 print "Hibrn =";tHibernate
10526 print "Hell  =";tHell
10527 print "Hit   =";tHit
10528 print "Home  =";tHome; : if tHome then print city$(tHome,1) else print
10529 print "Lucky =";tLucky
10590 x$=inkey$ : if x$="" then goto 10590
10598 drawMap=1 : drawArea=1 : drawHelp=1
10599 return
12000 rem **********************
12001 rem *** draw tile info ***
12002 rem **********************
12010 OS=S : S=textS : R=0 : G=128 : B=0 : A=TC : pen 1
12015 X=p+int(W/2) : Y=textY : color R,G,B,A : rect X,Y,int(W/2)-4,3 round 3
12020 C=m(xmap,ymap,5) : if C>0 then goto 13020
12021 X=p+10 : Y=Y+((3*S)*4) : S$=" RED           "+str$(m(xmap,ymap,1)) : gosub 40009
12022 X=p+10 : Y=Y+((3*S)*4) : S$=" GREEN         "+str$(m(xmap,ymap,2)) : gosub 40009
12023 X=p+10 : Y=Y+((3*S)*4) : S$=" BLUE          "+str$(m(xmap,ymap,3)) : gosub 40009
12024 X=p+10 : Y=Y+((3*S)*4) : S$=" ALPHA         "+str$(m(xmap,ymap,4)) : gosub 40009
12030 '
12999 goto 14910
13000 rem **********************
13001 rem *** draw city info ***
13002 rem **********************
13020 if len(city$(C,1))=0 then gosub 209010
13030 X=p+10 : Y=Y+((3*S)*4) : S$=city$(C,1) : S$=S$+" IN" : gosub 40009
13031 X=p+10 : Y=Y+((3*S)*4) : S$=" "+city$(C,2) : gosub 40009
13032 X=p+10 : Y=Y+((3*S)*4) : S$="WHICH IS FAMOUS FOR" : gosub 40009
13033 X=p+10 : Y=Y+((3*S)*4) : S$=" ITS "+city$(C,6) : gosub 40009
13034 X=p+10 : Y=Y+((3*S)*4) : S$="PEOPLE CAN OFTEN BE" : gosub 40009
13035 X=p+10 : Y=Y+((3*S)*4) : S$=" SEEN "+city$(C,15) : gosub 40009
13036 RR=R : if tHit=0 and mid$(city$(C,6),1,7)="falling" then R=rnd(255) : if R/2=int(R/2) then tWounded=tWounded+1 : tHit=1
13037 if R=RR then R=rnd(255)
13038 if tHit then X=p+10 : Y=Y+((3*S)*4) : S$="YOU WHERE HIT BY" : gosub 40009 : X=p+10 : Y=Y+((3*S)*4) : S$=" "+city$(C,6) : gosub 40009 : tHit=0
13039 R=RR
13040 if tMage then X=m(xmap,ymap,5) : if city$(X,1)="Penicoast" then X=p+10 : Y=Y+((3*S)*4) : S$="YOU RECOGNIZE A" : gosub 40009 : X=p+10 : Y=Y+((3*S)*4) : S$=" PRESENCE NEAR BY" : gosub 40009
13041 if tMonk then X=m(xmap,ymap,5) : if city$(X,1)="Penicoast" then X=p+10 : Y=Y+((3*S)*4) : S$="YOU FEEL A SERENE" : gosub 40009 : X=p+10 : Y=Y+((3*S)*4) : S$=" PRESENCE NEAR BY" : gosub 40009
13042 if tLucky then X=m(xmap,ymap,5) : if city$(X,1)="Bethesda" then X=p+10 : Y=Y+((3*S)*4) : S$="YOU FEEL LUCK WILL" : gosub 40009 : X=p+10 : Y=Y+((3*S)*4) : S$=" BE ON YOUR SIDE" : gosub 40009
13043 if tNti then if city$(tNtiGuild,1)="Footrot Flats" then X=p+10 : Y=Y+((3*S)*4) : S$="YOU FEEL THAT YOU" : gosub 40009 : X=p+10 : Y=Y+((3*S)*4) : S$=" ARE IGNORED" : gosub 40009
14910 X=p+int(W/2) : Y=Y+((3*S)*4) : rect X,Y,int(W/2)-4,3 round 3
14997 S=OS
14998 drawTileInfo=0 : drawScore=0 : showingActions=0 : showingInfo=0 : showingHelp=1
14999 return
15000 rem ********************
15001 rem *** draw actions ***
15002 rem ********************
15010 OS=S : S=textS : R=0 : G=128 : B=0 : A=TC : pen 1
15015 X=p+int(W/2) : Y=textY : color R,G,B,A : rect X,Y,int(W/2)-4,3 round 3
15020 if moreActions>0 then goto 15050
15031 X=p+10 : Y=Y+((3*S)*4) : S$="QUESTION MARK  HELP" : gosub 40009
15032 X=p+10 : Y=Y+((3*S)*4) : S$="F1      INVESTIGATE" : gosub 40009
15033 X=p+10 : Y=Y+((3*S)*4) : S$="S         SACRIFICE" : gosub 40009
15034 X=p+10 : Y=Y+((3*S)*4) : S$="T        TRAUMATIZE" : gosub 40009
15035 X=p+10 : Y=Y+((3*S)*4) : S$="A            ATTACK" : gosub 40009
15036 X=p+10 : Y=Y+((3*S)*4) : S$="L          LASERATE" : gosub 40009
15037 X=p+10 : Y=Y+((3*S)*4) : S$="K              KILL" : gosub 40009
15038 X=p+10 : Y=Y+((3*S)*4) : S$="E            ENRAGE" : gosub 40009
15039 X=p+10 : Y=Y+((3*S)*4) : S$="R              REND" : gosub 40009
15040 X=p+10 : Y=Y+((3*S)*4) : S$="P         PERSECUTE" : gosub 40009
15041 X=p+10 : Y=Y+((3*S)*4) : S$="H              HURT" : gosub 40009
15042 X=p+10 : Y=Y+((3*S)*4) : S$="D         DISMEMBER" : gosub 40009
15043 X=p+10 : Y=Y+((3*S)*4) : S$="SPACE  LESS ACTIONS" : gosub 40009
15045 goto 15990
15050 if moreActions>1 then goto 15070
15051 X=p+10 : Y=Y+((3*S)*4) : S$="QUESTION MARK  HELP" : gosub 40009
15052 X=p+10 : Y=Y+((3*S)*4) : S$="F1      INVESTIGATE" : gosub 40009
15053 X=p+10 : Y=Y+((3*S)*4) : S$="C           COLLECT" : gosub 40009
15054 X=p+10 : Y=Y+((3*S)*4) : S$="U               USE" : gosub 40009
15055 X=p+10 : Y=Y+((3*S)*4) : S$="B         BUILDINGS" : gosub 40009
15056 X=p+10 : Y=Y+((3*S)*4) : S$="I         INVENTORY" : gosub 40009
15057 X=p+10 : Y=Y+((3*S)*4) : S$="Z             SLEEP" : gosub 40009
15058 X=p+10 : Y=Y+((3*S)*4) : S$="M            MODIFY" : gosub 40009
15059 X=p+10 : Y=Y+((3*S)*4) : S$="L            LISTEN" : gosub 40009
15060 X=p+10 : Y=Y+((3*S)*4) : S$="E            ENGAGE" : gosub 40009
15061 X=p+10 : Y=Y+((3*S)*4) : S$="A          ASSEMBLE" : gosub 40009
15062 X=p+10 : Y=Y+((3*S)*4) : S$="D       DISASSEMBLE" : gosub 40009
15063 X=p+10 : Y=Y+((3*S)*4) : S$="SPACE  MORE ACTIONS" : gosub 40009
15065 goto 15990
15070 if moreActions>2 then goto 15090
15071 X=p+10 : Y=Y+((3*S)*4) : S$="QUESTION MARK  HELP" : gosub 40009
15072 X=p+10 : Y=Y+((3*S)*4) : S$="F1      INVESTIGATE" : gosub 40009
15073 X=p+10 : Y=Y+((3*S)*4) : S$="I         INVENTORY" : gosub 40009
15074 X=p+10 : Y=Y+((3*S)*4) : S$="P          PRACTICE" : gosub 40009
15075 X=p+10 : Y=Y+((3*S)*4) : S$="A               ARM" : gosub 40009
15076 X=p+10 : Y=Y+((3*S)*4) : S$="T             TRAIN" : gosub 40009
15077 X=p+10 : Y=Y+((3*S)*4) : S$="C           COLLECT" : gosub 40009
15078 X=p+10 : Y=Y+((3*S)*4) : S$="H              HUNT" : gosub 40009
15079 X=p+10 : Y=Y+((3*S)*4) : S$="W              WORK" : gosub 40009
15080 X=p+10 : Y=Y+((3*S)*4) : S$="O             ORATE" : gosub 40009
15081 X=p+10 : Y=Y+((3*S)*4) : S$="R        REMUNERATE" : gosub 40009
15082 X=p+10 : Y=Y+((3*S)*4) : S$="K              KILL" : gosub 40009
15083 X=p+10 : Y=Y+((3*S)*4) : S$="SPACE  MORE ACTIONS" : gosub 40009
15085 goto 15990
15090 if moreActions>3 then goto 15111
15091 X=p+10 : Y=Y+((3*S)*4) : S$="QUESTION MARK  HELP" : gosub 40009
15092 X=p+10 : Y=Y+((3*S)*4) : S$="F1      INVESTIGATE" : gosub 40009
15093 X=p+10 : Y=Y+((3*S)*4) : S$="P          PRACTICE" : gosub 40009
15094 X=p+10 : Y=Y+((3*S)*4) : S$="A          ASSEMBLE" : gosub 40009
15095 X=p+10 : Y=Y+((3*S)*4) : S$="U               USE" : gosub 40009
15096 X=p+10 : Y=Y+((3*S)*4) : S$="L            LISTEN" : gosub 40009
15097 X=p+10 : Y=Y+((3*S)*4) : S$="S            SEARCH" : gosub 40009
15098 X=p+10 : Y=Y+((3*S)*4) : S$="F             FIGHT" : gosub 40009
15099 X=p+10 : Y=Y+((3*S)*4) : S$="I         INVENTORY" : gosub 40009
15100 X=p+10 : Y=Y+((3*S)*4) : S$="G            GATHER" : gosub 40009
15101 X=p+10 : Y=Y+((3*S)*4) : S$="H              HUNT" : gosub 40009
15102 X=p+10 : Y=Y+((3*S)*4) : S$="T             TRAIN" : gosub 40009
15103 X=p+10 : Y=Y+((3*S)*4) : S$="SPACE  MORE ACTIONS" : gosub 40009
15105 goto 15990
15111 X=p+10 : Y=Y+((3*S)*4) : S$="QUESTION MARK  HELP" : gosub 40009
15112 X=p+10 : Y=Y+((3*S)*4) : S$="F1      INVESTIGATE" : gosub 40009
15113 X=p+10 : Y=Y+((3*S)*4) : S$="R        REMUNERATE" : gosub 40009 
15114 X=p+10 : Y=Y+((3*S)*4) : S$="E            ENGAGE" : gosub 40009
15115 X=p+10 : Y=Y+((3*S)*4) : S$="A          ASSEMBLE" : gosub 40009
15116 X=p+10 : Y=Y+((3*S)*4) : S$="D       DISASSEMBLE" : gosub 40009
15117 X=p+10 : Y=Y+((3*S)*4) : S$="Y            YODDLE" : gosub 40009
15118 X=p+10 : Y=Y+((3*S)*4) : S$="B         BUILDINGS" : gosub 40009
15119 X=p+10 : Y=Y+((3*S)*4) : S$="U               USE" : gosub 40009
15120 X=p+10 : Y=Y+((3*S)*4) : S$="I         INVENTORY" : gosub 40009
15121 X=p+10 : Y=Y+((3*S)*4) : S$="L            LISTEN" : gosub 40009
15122 X=p+10 : Y=Y+((3*S)*4) : S$="T             TRAIN" : gosub 40009
15123 X=p+10 : Y=Y+((3*S)*4) : S$="SPACE  MORE ACTIONS" : gosub 40009
15125 goto 15990
15131 X=p+10 : Y=Y+((3*S)*4) : S$="QUESTION MARK  HELP" : gosub 40009
15132 X=p+10 : Y=Y+((3*S)*4) : S$="F1      INVESTIGATE" : gosub 40009
15133 X=p+10 : Y=Y+((3*S)*4) : S$="K         KLAXISAUR" : gosub 40009
15134 X=p+10 : Y=Y+((3*S)*4) : S$="L            LISTEN" : gosub 40009
15135 X=p+10 : Y=Y+((3*S)*4) : S$="A          ASSEMBLE" : gosub 40009
15136 X=p+10 : Y=Y+((3*S)*4) : S$="X       EXTRAPOLATE" : gosub 40009
15137 X=p+10 : Y=Y+((3*S)*4) : S$="S            SEARCH" : gosub 40009
15138 X=p+10 : Y=Y+((3*S)*4) : S$="O             ORATE" : gosub 40009
15139 X=p+10 : Y=Y+((3*S)*4) : S$="U               USE" : gosub 40009
15140 X=p+10 : Y=Y+((3*S)*4) : S$="R       RECONISANCE" : gosub 40009
15141 X=p+10 : Y=Y+((3*S)*4) : S$="C           COLLECT" : gosub 40009
15142 X=p+10 : Y=Y+((3*S)*4) : S$="E          EVALUATE" : gosub 40009
15143 X=p+10 : Y=Y+((3*S)*4) : S$="SPACE  MORE ACTIONS" : gosub 40009
15145 goto 15990
15990 X=p+int(W/2) : Y=Y+((3*S)*4) : rect X,Y,int(W/2)-4,3 round 3
15997 S=OS
15998 drawActions=0 : drawScore=0 : showingActions=1  : showingInfo=0 : showingHelp=0
15999 return
17030 if m(xmap,ymap,1)=255 and m(xmap,ymap,2)=255 and m(xmap,ymap,3)=255 then goto 20010
17012 X=p+10 : Y=Y+((3*S)*4) : S$="F1      INVESTIGATE" : gosub 40009
20000 rem * city actions *
20010 rem
21999 goto 8000
29000 rem *********************
29001 rem *** adjust scores ***
29002 rem *********************
29005 sScore=sScore+1 : return
29010 sScore=sScore-1 : return
29011 sWalk=sWalk+1 : gosub 29010 : sActions=sActions+.1 : return
29012 sRun=sRun+1 : gosub 29010 : sActions=sActions+.2 : return
29013 sJog=sJog+1 : gosub 29010 : sActions=sActions+.3 : return
29014 sSprint=sSprint+1 : gosub 29010 : sActions=sActions+.4 : return
29015 sRide=sRide+1 : gosub 29010 : sActions=sActions+.4 : return
29016 sRow=sRow+1 : gosub 29010 : sActions=sActions+.2 : return
29017 sPaddle=sPaddle+1 : gosub 29010 : sActions=sActions+.3 : return
29018 sSail=sSail+1 : gosub 29010 : sActions=sActions+.5 : return
29020 sWork=sWork+1 : gosub 29005 : sActions=sActions+1: return
29021 sEmployed=sEmployed+1 : gosub 29005 : sActions=sActions+2: return
29022 sVolunteer=sVolunteer+1 : gosub 29005 : sActions=sActions+3: return
29031 rem if 
29980 rem *********************
29981 rem *** tile movement ***
29982 rem *********************
29983 if ymap/2=int(ymap/2) then xmap=xmap+1 : ymap=ymap-1 : goto 30003 else ymap=ymap-1 : goto 30003
29984 if ymap/2=int(ymap/2) then xmap=xmap+1 : ymap=ymap+1 : goto 30003 else ymap=ymap+1 : goto 30003
29985 if ymap/2=int(ymap/2) then ymap=ymap-1 : goto 30003 else xmap=xmap-1 : ymap=ymap-1 : goto 30003 
29986 if ymap/2=int(ymap/2) then ymap=ymap+1 : goto 30003 else xmap=xmap-1 : ymap=ymap+1 : goto 30003
29990 xmap=xmap+1 : ymap=ymap-1 : goto 30003
29991 xmap=xmap+1 : ymap=ymap+1 : goto 30003
29992 xmap=xmap-1 : ymap=ymap-1 : goto 30003
29993 xmap=xmap-1 : ymap=ymap+1 : goto 30003
29994 xmap=xmap-1 : goto 30003
29995 xmap=xmap+1 : goto 30003
29996 ymap=ymap-1 : goto 30003
29997 ymap=ymap+1 : goto 30003
29998 ymap=ymap-2 : goto 30003
29999 ymap=ymap+2 : goto 30003
30000 rem **************************
30001 rem *** check map movement ***
30002 rem **************************
30003 X=0 : Y=0 : redrawWin=1
30004 if xmap<p then xmap=p : redrawWin=0 : return
30005 if xmap>xsize then xmap=xsize : redrawWin=0 : return
30006 if ymap<1 then ymap=1 : redrawWin=0 : return
30007 if ymap>H then ymap=H : redrawWin=0 : return
30008 X=xmap : Y=ymap
30010 if (Player$="I" or Player$="H") and (m(X,Y,1)=128 and m(X,Y,2)=128 and m(X,Y,3)=255) and vBoat=0 then xmap=oldX : ymap=oldY : redrawWin=0 : return
30011 if (Player$="I" or Player$="H") and (m(X,Y,1)=128 and m(X,Y,2)=128 and m(X,Y,3)=255) and vBoat=1 then Player$="B"
30020 if Player$="B" and (m(X,Y,1)=64 and m(X,Y,2)=255 and m(X,Y,3)=64) then Player$="I"
30021 if Player$="B" and (m(X,Y,1)<>128 and m(X,Y,2)<>128 and m(X,Y,3)<>255) then xmap=oldX : ymap=oldY : redrawWin=0 : return
30051 if Player$="I" and (xmap<>oldX or ymap<>oldY) then gosub 29011 : if tMove=0 then tMove=1 : tone 29,freq 30,wsaw,vol 30,dur .1,fmul 2.1 else tMove=0 : tone 29,freq 10,wsin,vol 30,dur .1,fmul 2.1
30052 if Player$="H" and (xmap<>oldX or ymap<>oldY) then tone 28,freq 330,wsqr,vol 100,dur 1,fmul 1.001 : gosub 29015
30053 if Player$="B" and (xmap<>oldX or ymap<>oldY) then tone 28,freq 440,wsaw,vol 100,dur 1,fmul 1.001 : gosub 29018
30070 if m(X,Y,4)&256=0 then m(X,Y,4)=m(X,Y,4)+256
30080 if iMap or iBinoculas or iSurvey then D=iD else D=1 : ' prelook entry for cities
30090 on T gosub 30110,30210,30310,30310,30110,30210,30110
30099 return
30100 rem **********************
30101 rem *** do look radius ***
30102 rem **********************
30110 rem * square look radius *
30112 if D>1 then for i=1 to D
30113 if X-D>0 then if m(X-D,Y,4)&256=0 then m(X-D,Y,4)=m(X-D,Y,4)+256
30114 if X+D<=mapx then if m(X+D,Y,4)&256=0 then m(X+D,Y,4)=m(X+D,Y,4)+256
30115 if Y-D>0 then if m(X,Y-D,4)&256=0 then m(X,Y-D,4)=m(X,Y-D,4)+256
30116 if Y+D<=mapy then if m(X,Y+D,4)&256=0 then m(X,Y+D,4)=m(X,Y+D,4)+256
30121 if D>1 then next i
30122 return
30210 rem * diamond look radius *
30211 if Y/2=int(Y/2) then goto 30232
30212 if D>1 then for i=1 to D
30213 if X-D>0 then if m(X-D,Y,4)&256=0 then m(X-D,Y,4)=m(X-D,Y,4)+256
30214 if X+D<mapx then if m(X+D,Y,4)&256=0 then m(X+D,Y,4)=m(X+D,Y,4)+256
30215 if Y-(2*D)>0 then if m(X,Y-(2*D),4)&256=0 then m(X,Y-(2*D),4)=m(X,Y-(2*D),4)+256
30216 if Y+(2*D)<mapy then if m(X,Y+(2*D),4)&256=0 then m(X,Y+(2*D),4)=m(X,Y+(2*D),4)+256
30217 if Y-D>0 and X-D>0 then if m(X-D,Y-D,4)&256=0 then m(X-D,Y-D,4)=m(X-D,Y-D,4)+256
30218 if Y+D<mapy and X-D>0 then if m(X-D,Y+D,4)&256=0 then m(X-D,Y+D,4)=m(X-D,Y+D,4)+256
30219 if Y-D>0 then if m(X,Y-D,4)&256=0 then m(X,Y-D,4)=m(X,Y-D,4)+256
30220 if Y+D<mapy then if m(X,Y+D,4)&256=0 then m(X,Y+D,4)=m(X,Y+D,4)+256
30221 if D>1 then next i
30222 return
30230 rem * diamond even look radius *
30232 if D>1 then for i=1 to D
30233 if X-D>0 then if m(X-D,Y,4)&256=0 then m(X-D,Y,4)=m(X-D,Y,4)+256
30234 if X+D<mapx then if m(X+D,Y,4)&256=0 then m(X+D,Y,4)=m(X+D,Y,4)+256
30235 if Y-(2*D)>0 then if m(X,Y-(2*D),4)&256=0 then m(X,Y-(2*D),4)=m(X,Y-(2*D),4)+256
30236 if Y+(2*D)<mapy then if m(X,Y+(2*D),4)&256=0 then m(X,Y+(2*D),4)=m(X,Y+(2*D),4)+256
30237 if Y-D>0 and X+D<mapx then if m(X+D,Y-D,4)&256=0 then m(X+D,Y-D,4)=m(X+D,Y-D,4)+256
30238 if Y+D<mapy and X+D<mapx then if m(X+D,Y+D,4)&256=0 then m(X+D,Y+D,4)=m(X+D,Y+D,4)+256
30239 if Y-D>0 then if m(X,Y-D,4)&256=0 then m(X,Y-D,4)=m(X,Y-D,4)+256
30240 if Y+D<mapy then if m(X,Y+D,4)&256=0 then m(X,Y+D,4)=m(X,Y+D,4)+256
30241 if D>1 then next i
30242 return
30310 rem * hex look radius *
30311 if Y/2=int(Y/2) then goto 30332
30312 if D>1 then for i=1 to D
30313 if Y-(2*D)>0 then if m(X,Y-(2*D),4)&256=0 then m(X,Y-(2*D),4)=m(X,Y-(2*D),4)+256
30314 if Y+(2*D)<mapy then if m(X,Y+(2*D),4)&256=0 then m(X,Y+(2*D),4)=m(X,Y+(2*D),4)+256
30315 if Y-D>0 and X-D>0 then if m(X-D,Y-D,4)&256=0 then m(X-D,Y-D,4)=m(X-D,Y-D,4)+256
30316 if Y+D<mapy and X-D>0 then if m(X-D,Y+D,4)&256=0 then m(X-D,Y+D,4)=m(X-D,Y+D,4)+256
30317 if Y-D>0 then if m(X,Y-D,4)&256=0 then m(X,Y-D,4)=m(X,Y-D,4)+256
30318 if Y+D<mapy then if m(X,Y+D,4)&256=0 then m(X,Y+D,4)=m(X,Y+D,4)+256
30321 if D>1 then next i
30322 return
30330 rem * hex even look radius *
30332 if D>1 then for i=1 to D
30333 if Y-(2*D)>0 then if m(X,Y-(2*D),4)&256=0 then m(X,Y-(2*D),4)=m(X,Y-(2*D),4)+256
30334 if Y+(2*D)<mapy then if m(X,Y+(2*D),4)&256=0 then m(X,Y+(2*D),4)=m(X,Y+(2*D),4)+256
30335 if Y-D>0 and X+D<mapx then if m(X+D,Y-D,4)&256=0 then m(X+D,Y-D,4)=m(X+D,Y-D,4)+256
30336 if Y+D<mapy and X+D<mapx then if m(X+D,Y+D,4)&256=0 then m(X+D,Y+D,4)=m(X+D,Y+D,4)+256
30337 if Y-D>0 then if m(X,Y-D,4)&256=0 then m(X,Y-D,4)=m(X,Y-D,4)+256
30338 if Y+D<mapy then if m(X,Y+D,4)&256=0 then m(X,Y+D,4)=m(X,Y+D,4)+256
30341 if D>1 then next i
30342 return
39000 rem ******************************
39001 rem *** check area mouse click ***
39002 rem ******************************
39003 sMouse=sMouse+1
39004 if MX>wsize and MY>H then goto 39101 else Mgoto=1
39005 if MX>wsize then Xgoto=MX : Ygoto=MY
39006 if MX<wsize then Xgoto=xmap-int(mapw/2)+int(MX/CX)-1 : Ygoto=ymap-int(maph/2)+int(MY/CY)-1
39015 if Xgoto=xmap and Ygoto=ymap then Mgoto=0 : Xgoto=0 : Ygoto=0 : goto 10005
39016 if Xgoto=0 and Ygoto=0 then Mgoto=0 : goto 10005
39025 if Xgoto>0 and Xgoto<xmap then xmap=xmap-1 : gosub 30001 : if X=0 then Xgoto=0 else if xmap=oldX then xmap=xmap-1 : ymap=ymap-1 : gosub 30001
39026 if Xgoto>0 and Xgoto>xmap then xmap=xmap+1 : gosub 30001 : if X=0 then Xgoto=0 else if xmap=oldX then xmap=xmap+1 : ymap=ymap+1 : gosub 30001
39027 rem if xmap=Xgoto then Xgoto=0
39035 if Ygoto>0 and Ygoto<ymap then ymap=ymap-1 : gosub 30001 : if Y=0 then Ygoto=0 else if ymap=oldY then ymap=ymap-1 : xmap=xmap+1 : gosub 30001
39036 if Ygoto>0 and Ygoto>ymap then ymap=ymap+1 : gosub 30001 : if Y=0 then Ygoto=0 else if ymap=oldY then ymap=ymap+1 : xmap=xmap-1 : gosub 30001
39037 rem if ymap=Ygoto then Ygoto=0
39040 redrawWin=1
39049 goto 8000
39100 rem * check panel mouse click *
39101 goto 10005
40000 rem -= START: SUPPORT =-
40001 rem 40003,40005,40009
40002 rem -=_*_=- INPUTS
40003 MB=mouseb : MX=mousex : MY=mousey : KP=key(K) : KC=keycode : return
40004 rem -=_*_=- ARRAY2COLOR
40005 R=cP(cC,1) : G=cP(cC,2) : B=cP(cC,3) : A=cP(cC,4) : color R,G,B,A : return
40006 fR=cP(cC,1) : fG=cP(cC,2) : fB=cP(cC,3) : fA=cP(cC,4) : color fR,fG,fB,fA : return
40007 bR=cP(cC,1) : bG=cP(cC,2) : bB=cP(cC,3) : bA=cP(cC,4) : color bR,bG,bB,bA : return
40008 rem -=_*_=- DISPLAYTEXT
40009 for xi=1 to len(S$)
40010  X=X+((3*S)*2)
40011  x$=mid$(S$,xi,1) : if x$=" " then goto 40014 else if asc(x$)>96 and asc(x$)<123 then x$=chr$(asc(x$)-32)
40012  iL=asc(x$)-64 : if iL<1 then iL=iL+64-47+26
40013  if fR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
40014 next
40015 return
40016 rem -=_*_=- DISPLAYCHAR
40017 iL=asc(x$)-64 : if iL<1 then iL=iL+64-47+26
40018 if fR=1 then on iL gosub 150004,150006,150008,150010,150012,150014,150016,150018,150020,150022,150024,150026,150028,150030,150032,150034,150036,150038,150040,150042,150044,150046,150048,150050,150052,150054,150056,150058,150060,150062,150064,150066,150068,150070,150072,150074
40019 return
49998 rem -= END: SUPPORT =-
49999 rem                                       0123456789
50000 rem -= START: ICONS =-
50001 rem 50004,50078,50152,50226,50300,50374
50075 rem
50076 rem -=_*_=- ACTIONS 
50077 rem *** A - attack ***
50078 color R,G,B,A : disc X,Y,6*S : color 255,255,255,255 : shinit : shline X-(5*S),Y : shcurve X,Y-(5*S),X+(5*S),Y: shcurve X,Y+(5*S),X-(5*S),Y : shdone : return
50079 rem *** B - build city ***
50080 color R,G,B,A : disc X,Y,6*S : color 255,255,0,255 : disc X,Y,4.5*S : color 0,0,0,255 : shinit : shline X,Y-(4*S) : shline X+(4*S),Y : shline X+(2.5*S),Y : shline X+(2.5*S),Y+(3*S) : shline X-(2.5*S),Y+(3*S) : shline X-(2.5*S),Y : shline X-(4*S),Y : shline X,Y-(4*S) : shdone : color 255,255,0,255: box X,Y+(2*S),.5*S,1*S : return
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
150040 color R,G,B,A : arc X-(.5*S),Y+(1.5*S),2*S,90,-270 : arc X-(.5*S),Y-(2*S),1.5*S,270,-270 : return
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
200000 rem * city data: name,area,radius,min,max,famous,army,wall,defense,warehouse,library,forge,guild,anti-guild,seen,leader,anti-leader *
200001 rem data Methusela,"Panchas Province",5,3,5,market,1,1,0,1000,0,2,merchants,thieves,busy,"a council","Jimmy the Hand"
200002 rem data Penicoast,"Canterbury Vale",3,2,10,church,3,1,1,100,2,0,priests,mages,praying,"The Cardinal",""
200003 rem data Maniturb,"Footrot Flats",17,.5,1.5,not,0,0,0,10,0,1,farmers,no,working,"Wallace Footrot","Horse and Dog"
200004 rem data Bethesda,"Greater Gnomes",3,1,10,games,2,1,0,100,1,2,knights,barbarians,practicing,"Sid Mier","John Madden"
200005 rem data Bennethorpe,"Gunnthrop Downs",5,0.5,2.5,"super gran",-1,1,0,10,1,0,heros,"anti-heros",relaxing,"Super Gran","Anti Gran"
200006 rem data Xanadu,"Raging Plains",3,5,50,"pleasure dome",10,1,0,100,0,3,weaponsmith,armorers,fighting,"Kubla Khan","Alexanda the Great"
200007 rem data Klaxisaur,"Earth Station",4,1,6,klaxisaur,4,0,2,10,1,1,klaxisaur,antisaur,t,unknown,"also unknown"
200008 rem data Erehwon,"The Back of Beyond",2,.1,1,pub,0,0,0,10,0,0,brewers,distillers,drunk,"always drunk","drunk or sleeping"
200009 rem data Branchline,"Knowheresville",2,.2,2,"not much at all",1,0,0,10,-1,0,no,deadpool,sullen,dead,dying
200010 rem data Lafayette,"Greater Rorytown",7,2.5,7,bread,0,1,0,100,1,0,bakers,masons,eating,"Jamie Oliver","Nigella Lawson"
200011 rem data Gintamo,"Hidden Valley",3,1.5,7.5,swords,7,3,3,10,1,3,samurai,ninja,training,"Kusanagi","the rohan"
200012 rem data Duskyville,"Texas Holdem",12,2,3,horses,2,0,0,100,0,2,breeders,gamblers,riding,"Marian 'John' Wayne","Billy the Kid"
200100 rem * data work-around *
200101 if firstPass and dci=0 then dim city$(20,20) : dci=1 else for i=1 to 16 : for j=1 to 20 : city$(i,j)="" : next : next
200111 for i=1 to 12
200120  j=rnd(16) : if len(city$(j,1))>0 then goto 200120
200201  if i=1 then city$(j,1)="Methusela" : city$(j,2)="a small province" : city$(j,3)="5" : city$(j,4)="3" : city$(j,5)="5" : city$(j,6)="market" : city$(j,7)="1" : city$(j,8)="1" : city$(j,9)="0" : city$(j,10)="1000" : city$(j,11)="0" : city$(j,12)="2" : city$(j,13)="merchants" : city$(j,14)="theives" : city$(j,15)="busy" : city$(j,16)="a council" : city$(j,17)="Jimmy the Hand" : city$(j,18)="0" : city$(j,19)="0" : city$(j,20)="0"
200202  if i=2 then city$(j,1)="Penicoast" : city$(j,2)="Canterbury Vale" : city$(j,3)="3" : city$(j,4)="2" : city$(j,5)="10" : city$(j,6)="churchs" : city$(j,7)="3" : city$(j,8)="1" : city$(j,9)="1" : city$(j,10)="100" : city$(j,11)="2" : city$(j,12)="0" : city$(j,13)="priests" : city$(j,14)="mages" : city$(j,15)="praying" : city$(j,16)="The Cardinal" : city$(j,17)="Fistandantilas" : city$(j,18)="0" : city$(j,19)="0" : city$(j,20)="0"
200203  if i=3 then city$(j,1)="Footrot Flats" : city$(j,2)="a farming district" : city$(j,3)="17" : city$(j,4)=".5" : city$(j,5)="1.5" : city$(j,6)="Dog and Horse" : city$(j,7)="0" : city$(j,8)="0" : city$(j,9)="0" : city$(j,10)="10" : city$(j,11)="0" : city$(j,12)="1" : city$(j,13)="farmers" : city$(j,14)="rangers" : city$(j,15)="working" : city$(j,16)="Wallace Footrot" : city$(j,17)="Horse and Dog" : city$(j,18)="0" : city$(j,19)="0" : city$(j,20)="0"
200204  if i=4 then city$(j,1)="Bethesda" : city$(j,2)="Greater Gnomes" : city$(j,3)="3" : city$(j,4)="1" : city$(j,5)="10" : city$(j,6)="games" : city$(j,7)="2" : city$(j,8)="1" : city$(j,9)="0" : city$(i,10)="100" : city$(j,11)="1" : city$(j,12)="2" : city$(j,13)="knights" : city$(j,14)="barbarians" : city$(j,15)="practicing" : city$(j,16)="Sid Mier" : city$(j,17)="John Madden" : city$(j,18)="0" : city$(j,19)="0" : city$(j,20)="0"
200205  if i=5 then city$(j,1)="Bennethorpe" : city$(j,2)="Gunnthrop Downs" : city$(j,3)="5" : city$(j,4)="0.5" : city$(j,5)="2.5" : city$(j,6)="super gran" : city$(j,7)="-1" : city$(j,8)="1" : city$(j,9)="0" : city$(i,10)="10" : city$(j,11)="1" : city$(j,12)="0" : city$(j,13)="heros" : city$(j,14)="anti-heros" : city$(j,15)="relaxing" : city$(j,16)="Super Gran" : city$(j,17)="Anti Gran" : city$(j,18)="0" : city$(j,19)="0" : city$(j,20)="0"
200206  if i=6 then city$(j,1)="Xanadu" : city$(j,2)="Raging Plains" : city$(j,3)="3" : city$(j,4)="5" : city$(j,5)="50" : city$(j,6)="pleasure dome" : city$(j,7)="10" : city$(j,8)="1" : city$(j,9)="0" : city$(j,10)="100" : city$(j,11)="0" : city$(j,12)="3" : city$(j,13)="weaponsmiths" : city$(j,14)="armorsmiths" : city$(j,15)="fighting" : city$(j,16)="Kubla Khan" : city$(j,17)="Alexanda the Great" : city$(j,18)="0" : city$(j,19)="0" : city$(j,20)="0"
200207  if i=7 then city$(j,1)="Klaxisaur" : city$(j,2)="Earth Station" : city$(j,3)="4" : city$(j,4)="1" : city$(j,5)="6" : city$(j,6)="klaxisaur" : city$(j,7)="4" : city$(j,7)="0" : city$(j,8)="2" : city$(j,9)="10" : city$(j,10)="1" : city$(j,11)="1" : city$(j,13)="klaxisaur" : city$(j,14)="antisaur" : city$(j,15)="running away" : city$(j,16)="unknown" : city$(j,17)="also unknown" : city$(j,18)="0" : city$(j,19)="0" : city$(j,20)="0"
200208  if i=8 then city$(j,1)="Erehwon" : city$(j,2)="The Back of Beyond" : city$(j,3)="2" : city$(j,4)=".1" : city$(j,5)="1" : city$(j,6)="pub" : city$(j,7)="0" : city$(j,8)="0" : city$(j,9)="0" : city$(j,10)="10" : city$(j,11)="0" : city$(j,12)="0" : city$(j,13)="brewers" : city$(j,14)="distillers" : city$(j,15)="drunk" : city$(j,16)="always drunk" : city$(j,17)="drunk or sleeping" : city$(j,18)="0" : city$(j,19)="0" : city$(j,20)="0"
200209  if i=9 then city$(j,1)="Branchline" : city$(j,2)="Knowheresville" : city$(j,3)="2" : city$(j,4)=".2" : city$(j,5)="2" : city$(j,6)="umm not much" : city$(j,7)="1" : city$(j,8)="0" : city$(j,9)="0" : city$(j,10)="10" : city$(j,11)="-1" : city$(j,12)="0" : city$(j,13)="no" : city$(j,14)="deadpool" : city$(j,15)="sullen" : city$(j,16)="dead" : city$(j,17)="dying" : city$(j,18)="0" : city$(j,19)="0" : city$(j,20)="0"
200210  if i=10 then city$(j,1)="Lafayette" : city$(j,2)="Greater Rorytown" : city$(j,3)="7" : city$(j,4)="2.5" : city$(j,5)="7" : city$(j,6)="bread" : city$(j,7)="0" : city$(j,8)="1" : city$(j,9)="0" : city$(j,10)="100" : city$(j,11)="1" : city$(j,12)="0" : city$(j,13)="bakers" : city$(j,14)="masons" : city$(j,15)="eating" : city$(j,16)="Jamie Oliver" : city$(j,17)="Nigella Lawson" : city$(j,18)="0" : city$(j,19)="0" : city$(j,20)="0"
200211  if i=11 then city$(j,1)="Gintamo" : city$(j,2)="A Hidden Valley" : city$(j,3)="3" : city$(j,4)="1.5" : city$(j,5)="7.5" : city$(j,6)="swords" : city$(j,7)="7" : city$(j,8)="3" : city$(j,9)="3" : city$(j,10)="10" : city$(j,11)="1" : city$(j,12)="3" : city$(j,13)="samurai" : city$(j,14)="ninja" : city$(j,15)="training" : city$(j,16)="Kusanagi" : city$(j,17)="the rohan" : city$(j,18)="0" : city$(j,19)="0" : city$(j,20)="0"
200212  if i=12 then city$(j,1)="Duskyville" : city$(j,2)="Rancheros Provincio" : city$(j,3)="12" : city$(j,4)="2" : city$(j,5)="3" : city$(j,6)="horses" : city$(j,7)="2" : city$(j,8)="0" : city$(j,9)="0" : city$(j,10)="100" : city$(j,11)="1" : city$(j,12)="2" : city$(j,13)="breeders" : city$(j,14)="gamblers" : city$(j,15)="riding" : city$(j,16)="Marion Morrison aka 'John Wayne'" : city$(j,17)="Billy the Kid" : city$(j,18)="0" : city$(j,19)="0" : city$(j,20)="0"
200291 next
200299 return
201000 rem ********************
201001 rem *** pregame text ***
201002 rem ********************
201010 OS=S : S=textS : R=0 : G=128 : B=0 : A=TC : pen 1 : X=textB : Y=textL+((3*S)*(4*L))
201011 on L goto 201012,201013,201014,201015,201016
201012 S$="YOU OPEN YOUR EYES " : gosub 40009 : S=OS : return
201013 S$="  YOU SEE ITS NIGHT" : gosub 40009 : S=OS : return
201014 S$="    YOU SEE A COIN " : gosub 40009 : S=OS : return
201015 S$="      YOU PASS OUT " : gosub 40009 : S=OS : return
201016 S$="        YOU WAKE UP" : gosub 40009 : S=OS : return
203700 rem **************************
203701 rem *** preload start city ***
203702 rem **************************
203705 X=p+abs(contenants) : Y=int(H/2)
203710 if m(X,Y,1)=128 and m(X,Y,2)=128 and m(X,Y,3)=255 then X=X+1 : goto 203710
203715 if m(X,Y,1)=64 and m(X,Y,2)=255 and m(X,Y,3)=64 then goto 203720 else Y=Y+1 : goto 203710
203720 if m(X-1,Y,1)=128 and m(X-1,Y,2)=128 and m(X-1,Y,3)=255 and m(X+1,Y,1)=128 and m(X+1,Y,2)=128 and m(X+1,Y,3)=255 and m(X,Y-1,1)=128 and m(X,Y-1,2)=128 and m(X,Y-1,3)=255 and m(X,Y+1,1)=128 and m(X,Y+1,2)=128 and m(X,Y+1,3)=255 then X=X-2 : Y=Y-2 : goto 203710
203730 xmap=X : ymap=Y : mapOX=xmap : mapOY=ymap
203740 m(X,Y,1)=255 : m(X,Y,2)=255 : m(X,Y,3)=255 : ' white dot for city on intro screen, thats our "center"
203750 Player$="I" : gosub 200101 : C=rnd(12) : city$(C,18)=str$(X) : city$(C,19)=str$(Y) : m(X,Y,4)=m(X,Y,4)+512 : m(X,Y,5)=C : gosub 30070
204700 rem **************************
204701 rem *** preload other city ***
204702 rem **************************
204705 X=mapx-abs(contenants) : Y=int(H/2)
204710 if m(X,Y,1)=128 and m(X,Y,2)=128 and m(X,Y,3)=255 then X=X-1 : goto 204710
204715 if m(X,Y,1)=64 and m(X,Y,2)=255 and m(X,Y,3)=64 then goto 204720 else Y=Y-1 : goto 204710
204720 if m(X-1,Y,1)=128 and m(X-1,Y,2)=128 and m(X-1,Y,3)=255 and m(X-1,Y,1)=128 and m(X-1,Y,2)=128 and m(X-1,Y,3)=255 and m(X,Y-1,1)=128 and m(X,Y-1,2)=128 and m(X,Y-1,3)=255 and m(X,Y+1,1)=128 and m(X,Y+1,2)=128 and m(X,Y+1,3)=255 then X=X+2 : Y=Y+2 : goto 204710
204750 CC=rnd(12) : if CC=C then goto 204750 else city$(CC,18)=str$(X) : city$(CC,19)=str$(Y) : m(X,Y,4)=m(X,Y,4)+512+1024 : m(X,Y,5)=CC : gosub 30070
204798 L=3 : gosub 201010
205600 rem * generate special resources *
205611 for Y=1 to H
205622  for X=p to mapx
205630   R=rnd(255) : G=rnd(255) : B=rnd(255) : A=rnd(255)
205650   if (m(X,Y,4)&512)=0 and B<60 then m(X,Y,1)=R : m(X,Y,2)=G : m(X,Y,3)=B
205655   if (m(X,Y,4)&256)=0 then m(X,Y,4)=A else if (m(X,Y,4)&512)=0 then m(X,Y,4)=A+256 else if (m(X,Y,4)&1024)=0 then m(X,Y,4)=A+256+512 else m(X,Y,4)=A+256+512+1024
205682  next X
205691 next Y
205797 gosub 206005
205798 L=4 : gosub 201010
205999 goto 8005 : ' setup done; jump to main part
206000 rem *************************
206001 rem *** set up individual ***
206002 rem *************************
206005 tHuman=0 : tLeader=0 : tNti=0 : tMonk=0 : tMage=0 : tKlax=0 : tGhost=0 : tTranslator=0 : tAggresive=0 : tWounded=0 : tMemory=0 : tRemember=0 : tTranscend=0 : tHibernate=0 : tHell=0 : tGuild=0 : tNtiGuild=0 : tHit=0 : tHome=0 : tLucky=0
206010 if city$(C,1)="" then gosub 209010 : goto 207010
206011 if city$(C,1)="Klaxisaur" then goto 208010
206020 tHuman=1
206030 R=rnd(11) : if R=5 or R=10 then tLeader=1
206040 R=rnd(11) : if R=5 or R=10 then tGhost=1
206050 R=rnd(KC) : if R/4=int(R/4) then tWounded=1
206060 R=rnd(KC) : if R/8=int(R/8) then tAggressive=1
206070 R=rnd(KC) : if R/4=int(R/4) then tWounded=tWounded+1
206080 R=rnd(KC) : if R/8=int(R/8) then tMonk=1
206090 R=rnd(KC) : if R/8=int(R/8) then tMage=1
206110 if tGhost then R=rnd(11) : if R=5 or R=10 then tTranslator=1
206120 if tLeader then tGuild=C : R=rnd(KC) : if R/2=int(R/2) then tNti=1
206130 if tGhost and tLeader then tTranslator=1 : tRemember=1
206140 if tMonk or tMage then tTranslator=1 : tMemory=1 : tTranscend=1
206150 if tGhost and tWounded and tAggressive then tTranscend=0 : R=rnd(KC) : if R/2=int(R/2) then tHuman=0 : tHell=1
206160 if tLeader and tNti then tNtiGuild=C
206170 if tLeader=0 and tWounded then R=rnd(KC) : if R/4=int(R/4) then R=rnd(KC) : if R/2=int(R/2) then tGuild=C else tNtiGuild=C
206180 if tLeader=0 and tGuild then R=rnd(KC) : if R/4=int(R/4) then tNtiGuild=C
206190 if tLeader=0 and tNtiGuild then R=rnd(KC) : if R/4=int(R/4) then tGuild=C
206210 if tMonk or tMage then if city$(C,1)="Penicoast" then tLuck=tLuck+1
206220 if city$(C,1)="Duskyville" then if tNtiGuild then tLuck=tLuck+1
206310 if tGuild=0 and tNtiGuild=0 then R=0 else tHome=C : goto 206999
206320 B=rnd(16) : if B=C then goto 206220
206330 if tWounded then R=rnd(KC) : if R/4=int(R/4) then tLeader=B
206340 if tWounded>1 then R=rnd(KC) : if R/2=int(R/2) then tLeader=B
206350 if tLeader then R=rnd(KC) : if R/2=int(R/2) then tNti=1
206360 if tLeader then if tNti then tNtiGuild=B else tGuild=B
206370 if tNtiGuild then R=rnd(KC) : if R/2=int(R/2) then tGuild=B
206380 if tGuild=0 and tNtiGuild=0 then R=rnd(KC) : if R/2=int(R/2) then R=rnd(KC) : if R/2=int(R/2) then tGuild=B else tNtiGuild=B
206390 tHome=B : if B=CC then tLucky=1
206400 if city$(B,1)="Klaxisaur" then tKlax=1 : if tGuild or tNtiGuild then tHuman=0 : if tNtiGuild and tGhost then tAggressive=1
206999 return
207000 rem ********************
207001 rem *** set up ruins ***
207002 rem ********************
207010 tHuman=1 
207020 R=rnd(KC) : if R/2=int(R/2) then tGhost=1
207030 R=rnd(KC) : if R/2=int(R/2) then tTranslator=1
207040 R=rnd(KC) : if R/2=int(R/2) then tAggresive=1
207050 R=rnd(KC) : if R/2=int(R/2) then tWounded=1
207060 if tHuman and tTranslator then R=rnd(KC) : if R/2=int(R/2) then tMonk=1
207070 if tHuman and tTranslator then R=rnd(KC) : if R/2=int(R/2) then tMage=1
207080 if tGhost and tAggressive and tWounded then tTranscend=0 : tHell=1 : R=rnd(KC) : if R/2=int(R/2) then tHuman=0
207090 if city$(C,2)="a strange place" then goto 207110
207100 R=rnd(KC) : if R/2=int(R/2) then tWounded=tWounded+1 : tHit=1
207110 if tMage or tMonk then if city$(C,2)="a strange place" then tHome=C
207120 if tGhost and tAggresive then tHome=C
207130 rem 
207999 return
208000 rem ************************
208001 rem *** set up Klaxisaur ***
208002 rem ************************
208010 R=rnd(KC) : if R/4=int(R/4) then tGhost=1
208020 R=rnd(11) : if R=5 or R=10 then goto 208140 else if R/2=int(R/2) then goto 208130
208120 tHuman=1 : R=rnd(KC) : if R/4=int(R/4) then tWounded=1
208129 goto 208210
208130 tHuman=1 : tKlax=1 : if tGhost=0 then R=rnd(KC) : if R/2=int(R/2) then tTranslator=1
208139 goto 208210
208140 tKlax=1 : if tGhost=1 then R=rnd(KC) : if R/2=int(R/2) then tAggresive=1
208141 R=rnd(KC) : if R/4=int(R/4) then tTranslator=1
208142 R=rnd(KC) : if R/4=int(R/4) then tLeader=1
208143 if tLeader then R=rnd(KC) : if R/2=int(R/2) then tNti=1
208210 R=rnd(KC) : if R/4=int(R/4) then tWounded=tWounded+1
208999 return
209000 rem ***************************
209001 rem *** set up random place ***
209002 rem ***************************
209010 R=rnd(11) : if R=5 or R=10 then goto 210201 else if R/2=int(R/2) then goto 210101
209999 '         ="S             SCORE"
210001 city$(C,1)="You are" : R=rnd(16)
210002 city$(C,2)="an abandoned ruins"
210003 city$(C,3)="1"
210004 city$(C,4)="0"
210005 city$(C,5)="1"
210006 city$(C,6)="falling stones"
210007 city$(C,7)="0" : if R/4=int(R/4) then city$(C,7)="1"
210008 city$(C,8)="1"
210009 city$(C,9)="1"
210010 city$(C,10)="0" : if R/4=int(R/4) then city$(C,7)="0"
210011 city$(C,11)="0"
210012 city$(C,12)="1"
210013 city$(C,13)="old"
210014 city$(C,14)="no"
210015 city$(C,15)="but not here" : if R/4=int(R/4) then city$(C,15)="entering"
210016 city$(C,16)=""
210017 city$(C,17)=""
210018 city$(C,18)=str$(X)
210019 city$(C,19)=str$(Y)
210020 city$(C,20)=str$(1) : if R/4=int(R/4) then city$(C,20)="0" else if R/2=int(R/2) then city$(C,20)="0"
210099 return : '="S             SCORE"
210101 city$(C,1)="A burnt building" : R=rnd(16)
210102 city$(C,2)="an old ruins"
210103 city$(C,3)="1"
210104 city$(C,4)="0"
210105 city$(C,5)="1"
210106 city$(C,6)="falling timber"
210107 city$(C,7)="0" : if R/4=int(R/4) then city$(C,7)="1"
210108 city$(C,8)="0"
210109 city$(C,9)="0"
210110 city$(C,10)="1"
210111 city$(C,11)="0"
210112 city$(C,12)="0" : if R/4=int(R/4) then city$(C,12)="1"
210113 city$(C,13)="no"
210114 city$(C,14)="no"
210115 city$(C,15)="but not here" : if R/4=int(R/4) then city$(C,15)="leaving"
210116 city$(C,16)=""
210117 city$(C,17)=""
210118 city$(C,18)=str$(X)
210119 city$(C,19)=str$(Y)
210120 city$(C,20)=str$(1) : if R/4=int(R/4) then city$(C,20)="0" else if R/2=int(R/2) then city$(C,20)="0"
210199 return : '="S             SCORE"
210201 city$(C,1)="You appear" : R=rnd(16)
210202 city$(C,2)="a strange place"
210203 city$(C,3)="3"
210204 city$(C,4)="1"
210205 city$(C,5)="1"
210206 city$(C,6)="ancient ruins"
210207 city$(C,7)="0" : if R/4=int(R/4) then city$(C,7)="1"
210208 city$(C,8)="1"
210209 city$(C,9)="1"
210210 city$(C,10)="1" : if R/4=int(R/4) then city$(C,10)="3" : if R/2=int(R/2) then city$(C,10)="2"
210211 city$(C,11)="1" : if R/4=int(R/4) then city$(C,11)="3" : if R/2=int(R/2) then city$(C,11)="2"
210212 city$(C,12)="1" : if R/4=int(R/4) then city$(C,12)="3" : if R/2=int(R/2) then city$(C,12)="2"
210213 city$(C,13)="old"
210214 city$(C,14)="ancient"
210215 city$(C,15)="but not heard" : if R/4=int(R/4) then city$(C,15)="coming at you" : if R/2=int(R/2) then city$(C,15)="floating here"
210216 city$(C,16)=""
210217 city$(C,17)=""
210218 city$(C,18)=str$(X)
210219 city$(C,19)=str$(Y)
210220 city$(C,20)=str$(1)
210299 return : '="S             SCORE"
