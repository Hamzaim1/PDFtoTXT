#import time
#start_time = time.time()
#for x in xrange(0,10000):
#	print ("")
#	for y in xrange(0,10000):
#		print ("")

#print("--- %s seconds ---" % (time.time() - start_time))

import time
start_time = time.time()
f = open("tp1-3.txt",'r')
lignes  = f.readlines()
f.close()
 
print lignes
 
for ligne in lignes:
    print ligne

print("--- %s seconds ---" % (time.time() - start_time))