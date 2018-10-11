10 cls
100 X=200:Y=150:S=10
110 box X,Y,S*5,S*5
115 color 255,0,0,128
120 disc X,Y,S*7
125 color 0,255,0,128
130 shinit:shline X-(S*7),Y:shline X-(S*3),Y-(S*6):shline X+(S*3),Y-(S*6):shline X+(S*7),Y:shline X+(S*3),Y+(S*6):shline X-(S*3),Y+(S*6):shdone
135 color 0,0,255,128
140 shinit:shline X-(S*7),Y:shline X-(S*3),Y-(S*5):shline X+(S*3),Y-(S*5):shline X+(S*7),Y:shline X+(S*3),Y+(S*5):shline X-(S*3),Y+(S*5):shdone
