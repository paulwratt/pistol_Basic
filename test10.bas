10 cls : print "test 10 - string arrays" : print
20 dim text$(5,5) : print "dim text$(5,5)"
100 rem * populate string array *
101 for i=1 to 5
110  text$(i,1)="test "+str$(i)+":"
112  for j=2 to 5
120   a=rnd(128-32)+32
130   text$(i,j)=chr$(a)
142  next
151 next
200 rem * output string array *
201 for i=1 to 5
212  for j=1 to 5
220   print text$(i,j);
242  next
250 print
261 next
