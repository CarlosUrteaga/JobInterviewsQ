
# first interview, ask me about my projects, how I tackle, etc. 
# 5 minutes of codding

# how to cast a string into a int
# given the string = '12345', the string is always an integer
def str_to_int(string):
	size = len(string) - 1
	real_value= 0
	for char in string:
		real_value+= (char-48)*10**size
		size-=1
	return real_value
# I got stucket on this


# the next possible question
# complexity of the funciton is nlog(n)
# does this not work for floats? what do you need require to add the next code.
# str_to_int
def str_to_dec(string):
	real_value = 0
	size = 1
	for each in string:
		a = int(each)*10**(-(size))
		real_value+= int(each)*10**(-(size))
		size+=1
	return real_value

def string_to_float(string):
	strings = string.split('.')
	number = str_to_int(strings[0])
	number += str_to_dec(strings[1])
	return number

print(string_to_float('1234.1234'))

# second interview, ask more about difference between RF and GBM, 
# have a list of n elements, get the k most element
def k_most(k, array):
	a={}
	array2 = []
	for each in array:
		if each in a:
			a[each] += 1
		else:
			a[each] = 1

		if a[each]>=k:
			if each in array2:
				# print(array2)
				True
			else:
				array2.append(each)
	return array2

# third question
# talk 
# how to know if a value exist on a list, the list is ordered (ascending)
"""
online coding (wrong)
# you can write to stdout for debugging purposes, e.g.
print("This is a debug message")

# len 10
# size 10
# 5 / 2.5
# sorted ascending
def if_exit(value, array):
    size = len(array) 
    mid = int(size/2) 
    # if mid == 0 or value== array[mid]:
    if len(array)==1:
        print('here', mid)
        if array[mid]== value:
            print( 'True')
            return 0
        else:
            print( 'False')
            return 0
    if (value>array[mid]):
            if_exit(value,array[mid:])
    else:
        if value<array[mid]:
            if_exit(value,array[:mid])

# 2 4 6 8 (5)...
array = [2,4,6,8]
value = 1

print(if_exit(value, array))
"""
def return_if_exist(array, value):
	mid = int(len(array) / 2)
	if array[mid] == value:
			return 'True'
	if mid == 0: 
		return 'False'
	if array[mid]<value:
		return return_if_exist(array[mid:],value)
	if array[mid]>value:
		return return_if_exist(array[:mid],value)
	

array = [2,4,6,8]
value = 8
print(return_if_exist(array,value))
# question order nlogn, w


