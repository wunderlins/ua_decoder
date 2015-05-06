#!/usrbin/env python

str_data = "01110010001101010100100100101111001101" + \
           "0100101010110001100101100110110110"

d = []
d.append(str_data[0:3])
d.append(str_data[3:9])
for i in range(1, 10):
	e = 9+(i*7); s = e-7
	d.append(str_data[s:e])

"""
data = [
	"011",  
	"100100",
	"0110101",
	"0100100",
	"1001011",
	"1100110",
	"1010010",
	"1010110",
	"0011001",
	"0110011",
	"0110110"
]
"""
data = d

def baseN(num,b,numerals="0123456789abcdefghijklmnopqrstuvwxyz"):
	return ((num == 0) and  "0" ) or ( baseN(num // b, b).lstrip("0") + numerals[num % b])

def b2i(str): 
	return int(str, 2)

def display(data, reverse=False):
	if reverse:
		print "\nLittle Endian\n----------------------------"
	else:
		print "\nBig Endian\n----------------------------"
	
	print "{word:<8} {b8:>4} {b10:>4} {b12:>4} {b16:>4} {dr:>4}".format(
		word="Bin", b8="Oct", b10="Dec", b12="b12", b16="Hex", dr="Rev"
	)
	for w in data:
		if reverse:
			w = w[::-1]
		print "{word:<8} {b8:>4} {b10:>4} {b12:>4} {b16:>4} {dr:>4}".format( \
			word=w, \
			b8=baseN(b2i(w), 8), \
			b10=baseN(b2i(w), 10), \
			b12=baseN(b2i(w), 12), \
			b16=baseN(b2i(w), 16), \
			dr =str(baseN(b2i(w), 10))[::-1] \
		)

display(data, False); display(data, True)

