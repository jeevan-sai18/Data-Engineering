#!/usr/bin/env python
# coding: utf-8

# In[2]:


l = [int(x) for x in input().split()]
print(l)
unique_list = list(set(l))
print(unique_list)


# In[7]:


# using reduce() method:
from functools import reduce
l = [int(x) for x in input().split()]
y = reduce(lambda re, x: re + [x] if x not in re else re, l, [])
print(y)


# In[8]:


#using operator.countOf() method: 
import operator as op
l = [int(x) for x in input().split()]
print(l)
unique_list=[]
for x in l:
    if op.countOf(unique_list,x) == 0:
        unique_list.append(x)
print(unique_list)


# In[9]:


#using pandas module:
import pandas as pd
l = [int(x) for x in input().split()]
print(l)
y = pd.Series(l).drop_duplicates().to_list()
print(y)


# In[10]:


#using numpy.Unique method:
import numpy as np
l = [int(x) for x in input().split()]
print(l)
x = np.array(l)
print(np.unique(x))


# In[11]:


#using collection.Counter() method:
from collections import Counter
l = [int(x) for x in input().split()]
print(l)
print(*Counter(l))


# In[12]:


#using dict.Fromkeys():
l = [int(x) for x in input().split()]
print(l)
y = list(dict.fromkeys(l))
print(y)


# In[13]:


#Sorted Python list:
#using sorted():
l = [int(x) for x in input().split()]
print(l)
print(sorted(l))


# In[17]:


# using sorted() with reverse argument:
l = [int(x) for x in input().split()]
print(l)
print(sorted(l, reverse=True))


# In[20]:


#using sorted() with key argument:

x = ['Jeevan','Chaithu', 'Sachin','virat']
print(x)
print(sorted(x, key=len))


# In[21]:


# JSON string to Python Dictionary

import json
x = '{"Name" : "Jeevan", "Age" : 22, "id" : 63, "Gender" : "Male"}'
Candidate = json.loads(x)
print(Candidate)
print(Candidate['Name'])
print(Candidate['Age'])


# In[22]:


# Converting a json data inside a file into python dictionary

import json
file = open('Student_information.json')
data = json.load(file)
print('Type:',type(data))
print(data)


# In[23]:


# Python Dictionary to JSON object

import json
employee = {
    "id": "101",
    "name": "Ani",
    "department": "QA",
    "salary": "45000"
}

object = json.dumps(employee, indent=4)
print(object)


# In[25]:


# JSON to a file in Python
import json

employee = {
    "id": "101",
    "name": "Ani",
    "department": "QA",
    "salary": "45000"
}

with open('employee_information.json', 'w') as file:
    json.dump(employee, file)


# In[26]:


import json
file = open('employee_information.json')
data = json.load(file)
print('Type:',type(data))
print(data)


# In[ ]:




