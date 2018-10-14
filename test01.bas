10 cls : print "test 01 - speed test" : print
20 home
25 a=0 : b=ticks
30 for i=1 to 10000
40  a=a+i
50 next
60 b=ticks-b
60 print "ticks:";b
70 print "add 1-10000:";a
