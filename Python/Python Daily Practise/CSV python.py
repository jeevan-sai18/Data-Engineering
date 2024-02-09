#!/usr/bin/env python
# coding: utf-8

# In[8]:


import csv
rows = []
with open("file1.csv", 'r') as file:
   csvreader = csv.reader(file)
   header = next(csvreader)
   for row in csvreader:
       rows.append(row)
print(header)
print(rows)


# In[7]:


# File path
file_path = 'file1.csv'

# Reading from a file
with open(file_path, 'r') as file:
    content = file.read()
    print("Original content:\n", content)

# Modifying the content

modified_content = content.upper()
print("modified_content\n",modified_content)

# Writing back to the file
with open(file_path, 'w') as file:
    file.write(modified_content)
    print("\nModified content successfully written to the file.")

# Reading and printing the modified content
with open(file_path, 'r') as file:
    modified_content = file.read()
    print("\nModified content:\n", modified_content)


# In[1]:


with open('file1.csv') as file:
    content = file.readlines()
header = content[:1]
rows = content[3:]
print(header)
print(rows)


# In[3]:


import os
print(os.getcwd())


# In[7]:


import pandas as pd
import numpy as np

ser=pd.Series()
print("Series:",ser)
data=np.array(['j','e','e','v','a'])
ser=pd.Series(data)
print("Panda series\n",ser)


# In[8]:


import pandas as pd
df=pd.DataFrame()
print(df)
lst=['jeevan','sai']
df=pd.DataFrame(lst)
print(df)


# In[10]:


import pandas as pd
data=pd.read_csv("file1.csv")
data


# In[11]:


import pandas as pd
data=pd.read_csv("file1.csv")
print(data)


# In[14]:


import pandas as pd
data=pd.read_csv("file1.csv")
data.columns


# In[17]:


data.City


# In[11]:


import csv
with open('file1.csv', 'r') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
       print(row)


# In[12]:


import csv
header = ['Name', 'M1 Score', 'M2 Score']
data = [['Alex', 62, 80], ['Brad', 45, 56], ['Joey', 85, 98]]
filename = 'Students_Data.csv'
with open(filename, 'w', newline="") as file:
    csvwriter = csv.writer(file) # 2. create a csvwriter object
    csvwriter.writerow(header) # 4. write the header
    csvwriter.writerows(data) # 5. write the rest of the data


# In[13]:


import pandas as pd
data=pd.read_csv("Students_Data.csv")
print(data)


# In[24]:


import csv
header = ['Name', 'M1 Score', 'M2 Score']
data = [['Alex', 62, 80], ['Brad', 45, 56], ['Joey', 85, 98]]
filename = 'Student_scores.csv'
with open(filename, 'w') as file:
    for header in header:
        file.write(str(header)+', ')
    file.write('n')
    for row in data:
        for x in row:
            file.write(str(x)+', ')
        file.write('n')


# In[27]:


import pandas as pd
data=pd.read_csv("Student_scores.csv")
print(data)


# In[28]:


import pandas as pd
header = ['Name', 'M1 Score', 'M2 Score']
data = [['Alex', 62, 80], ['Brad', 45, 56], ['Joey', 85, 98]]
data = pd.DataFrame(data, columns=header)
data.to_csv('Stu_data.csv', index=False)


# In[30]:


import pandas as pd
data=pd.read_csv("Stu_s.csv")
print(data)


# In[34]:


import csv

with open('Students_Data1.csv', 'w', newline='') as csvfile:
    data = [
        {'Name': 'Alex', 'M1 Score': 62, 'M2 Score': 80},
        {'Name': 'Brad', 'M1 Score': 45, 'M2 Score': 56},
        {'Name': 'Joey', 'M1 Score': 85, 'M2 Score': 98}
    ]
    fieldnames = ['Name', 'M1 Score', 'M2 Score']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(data)


# In[35]:


import pandas as pd
data=pd.read_csv("Students_Data1.csv")
data


# In[18]:


def main():
    # Create a list of numbers
    numbers = [10, 5, 8, 20, 15]

    # Accessing Elements
    print("Accessing Elements:")
    first_element = numbers[0]
    last_element = numbers[-1]
    print("First Element:", first_element)
    print("Last Element:", last_element)
    print()

    # Slicing
    print("Slicing:")
    sliced_list = numbers[1:4]
    print("Sliced List:", sliced_list)
    print()

    # Adding Elements
    print("Adding Elements:")
    numbers.append(25)
    print("After Append:", numbers)
    numbers.extend([30, 35])
    print("After Extend:", numbers)
    print()

    # Removing Elements
    print("Removing Elements:")
    numbers.remove(8)
    print("After Remove:", numbers)
    popped_element = numbers.pop(2)
    print("Popped Element:", popped_element)
    print("After Pop:", numbers)
    del numbers[1]
    print("After Delete:", numbers)
    print()

    # Iterating Over Elements
    print("Iterating Over Elements:")
    for num in numbers:
        print(num)
    print()

    # List Comprehensions
    print("List Comprehensions:")
    squares = [x**2 for x in numbers]
    print("Squares:", squares)
    print()

    # Sorting
    print("Sorting:")
    numbers.sort()
    print("Sorted List:", numbers)
    print()

    # Finding Length
    print("Finding Length:")
    length = len(numbers)
    print("Length of List:", length)

if __name__ == "__main__":
    main()


# In[19]:



# Filtering even numbers from a list using lambda and filter
#Using filter with lambda:
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
even_numbers = list(filter(lambda x: x % 2 == 0, numbers))
print("Even Numbers:", even_numbers)

#Using reduce with lambda:
from functools import reduce
# Summing all elements in a list using lambda and reduce
numbers = [1, 2, 3, 4, 5]
sum_all = reduce(lambda x, y: x + y, numbers)
print("Sum of all numbers:", sum_all)


#b) Practical uses of Python lambda function:
#Sorting by a specific key:
students = [('Alice', 25), ('Bob', 20), ('Charlie', 22)]
sorted_students = sorted(students, key=lambda x: x[1])
print("Sorted Students by Age:", sorted_students)
# Output: [('Bob', 20), ('Charlie', 22), ('Alice', 25)]


#Conditional mapping:
numbers = [1, 2, 3, 4, 5]
squared_and_even = list(map(lambda x: x**2 if x % 2 == 0 else x, numbers))
print("Squared and Even Numbers:", squared_and_even)


# c) Using lambda function with map, filter, reduce:
# Using map with lambda:
# Doubling each element in a list using lambda and map
numbers = [1, 2, 3, 4, 5]
doubled_numbers = list(map(lambda x: x * 2, numbers))
print("Doubled Numbers:", doubled_numbers)


# In[ ]:




