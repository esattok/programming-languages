import numpy as np

# Question 1: Subscript types
subscriptArr = np.array([1,2,3,4,5,6])
print(subscriptArr[0])
print(subscriptArr[True])
#print(subscriptArr[1.0])
#print(subscriptArr["M"])
print("-----------------------------------")


# Question 2: Python does range checking
rangeArr = np.array([1,2,3,4,5])
#print(rangeArr[15]); # Error
print(rangeArr[-1]); # last element
print(rangeArr[-3]); # 2 before the last element
print("-----------------------------------")


# Question 3, Question 4 subscript range bindings and allocations takes place at run time
size = 4 * 2;
dyArr = np.ones(size);
print(dyArr);


# Question 5: Python allows both rectangular and jagged arrays
rectArr = np.array([[12, 15], [23, 1], [11, 11]])
for i in range(len(rectArr)):
    for j in range(len(rectArr[i])):
        print(rectArr[i][j])


jaggedArr= np.array([[12, 2, 4], [1, 2, 3, 4, 5, 6], [3]], dtype=object)
for i in range(len(jaggedArr)):
    for j in range(len(jaggedArr[i])):
        print(jaggedArr[i][j])


# Question 6: Array objs can be initialized in python
initArr1 = range(5)
initArr2 = np.array([1, 2, 3, 4, 5])

# Question 7: slices are possible in python
baseList = np.array([1, 2, 3, 4, 5, 6])
slicedList = baseList[1:3]
print(slicedList)
