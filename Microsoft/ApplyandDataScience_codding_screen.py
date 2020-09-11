
# first interview, ask me about my projects, how I tackle, etc. 
# 5 minutes of codding

# how to cast a string into a int
given the string = '12345', the string is always an integer
def string_to_number(string):
	size = len(string) - 1
	real_value= 0
	for char in string:
		real_value+= int(char)*10**size
		size-=1
	return real_value
# I got stucket on this


# the next possible question
# complexity of the funciton is nlog(n)
# does this not work for floats? what do you need require to add the next code.

def string_to_decimals(string):
	real_value = 0
	size = 1
	for each in string:
		a = int(each)*10**(-(size))
		real_value+= int(each)*10**(-(size))
		size+=1
	return real_value

def string_to_float(string):
	strings = string.split('.')
	number = string_to_number(strings[0])
	number += string_to_decimals(strings[1])
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


