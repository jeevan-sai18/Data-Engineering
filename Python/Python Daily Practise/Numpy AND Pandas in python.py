#!/usr/bin/env python
# coding: utf-8

# In[2]:


import numpy as np
val=[20.1,54.9]
c=np.array(val)
print(c)


# In[6]:


import numpy as np
val=[20.1,54.9]
c=np.array(val)
print(c * 9 / 5 + 32)
print(type(c))


# In[7]:


import numpy as np


a = np.arange(1, 10)
print(a)


# In[8]:


x = range(1, 10)
print(x)    # x is an iterator
print(list(x))


# In[9]:


x = np.arange(10.4)
print(x)
x = np.arange(0.5, 10.4, 0.8)
print(x)


# In[10]:


x = np.arange(10.4)
print(x)
x = np.arange(0.5, 10.4, 0.8)
print(x)


# In[11]:


np.arange(12.04, 12.84, 0.08)


# In[12]:


x = np.arange(0.5, 10.4, 0.8, int)
print(x)


# In[13]:


print(np.linspace(1, 10))


# In[14]:


print(np.linspace(1, 10, 7))


# In[21]:


print(np.linspace(1, 10, 7, endpoint=False))


# In[22]:


import numpy as np


samples, spacing = np.linspace(1, 10, retstep=True)
print(spacing)
print(samples)


# In[23]:


import numpy as np
samples, spacing = np.linspace(1, 10, 20, endpoint=True, retstep=True)
print(spacing)
print(samples)
samples, spacing = np.linspace(1, 10, 20, endpoint=False, retstep=True)
print(spacing)
print(samples)


# In[26]:


import numpy as np
import pandas as pd
NaN = np.nan
dataframe = pd.DataFrame({'Name': ['Shobhit', 'Vaibhav',
                                   'Vimal', 'Sourabh',
                                   'Rahul', 'Shobhit'],
                          'Physics': [11, 12, 13, 14, NaN, 11],
                          'Chemistry': [10, 14, NaN, 18, 20, 10],
                          'Math': [13, 10, 15, NaN, NaN, 13]})
 
print (dataframe)


# In[27]:


import numpy as np
import pandas as pd
NaN = np.nan
dataframe = pd.DataFrame({'Name': ['Shobhit', 'Vaibhav',
                                   'Vimal', 'Sourabh',
                                   'Rahul', 'Shobhit'],
                          'Physics': [11, 12, 13, 14, NaN, 11],
                          'Chemistry': [10, 14, NaN, 18, 20, 10],
                          'Math': [13, 10, 15, NaN, NaN, 13]})
print(dataframe.count())


# In[28]:


# axis='columns' to count with respect to row

import numpy as np
import pandas as pd
NaN = np.nan
dataframe = pd.DataFrame({'Name': ['Shobhit', 'Vaibhav',
                                   'Vimal', 'Sourabh',
                                   'Rahul', 'Shobhit'],
                          'Physics': [11, 12, 13, 14, NaN, 11],
                          'Chemistry': [10, 14, NaN, 18, 20, 10],
                          'Math': [13, 10, 15, NaN, NaN, 13]})

print(dataframe.count(axis = 1))
 
print(dataframe.count(axis = 'columns'))


# In[29]:


import numpy as np
import pandas as pd
NaN = np.nan
dataframe = pd.DataFrame({'Name': ['Shobhit', 'Vaibhav',
                                   'Vimal', 'Sourabh',
                                   'Rahul', 'Shobhit'],
                          'Physics': [11, 12, 13, 14, NaN, 11],
                          'Chemistry': [10, 14, NaN, 18, 20, 10],
                          'Math': [13, 10, 15, NaN, NaN, 13]})

# it will give the count
# of individual columns count of null values
print(dataframe.isnull().sum())
 
# it will give the total null 
# values present in our dataframe
print("Total Null values count: ",
      dataframe.isnull().sum().sum())


# In[30]:


import pandas as pd
 
# creating a data frame
df = pd.read_csv("file1.csv")
print(df.head())


# In[31]:


import pandas as pd
 
# creating a data frame
df = pd.read_table("file1.csv", delimiter =", ")
print(df.head())


# In[33]:


import pandas as pd
# import csv module
import csv
 
with open("file1.csv") as csv_file:
    # read the csv file
    csv_reader = csv.reader(csv_file)
 
    # now we can use this csv files into the pandas
    df = pd.DataFrame([csv_reader], index = None)
 
# iterating values of first column 
for val in list(df[1]):
    print(val)


# In[34]:


import pandas as pd
 
# Creating dataframe a
a = pd.DataFrame()
 
# Creating Dictionary
d = {'id': [1, 2, 10, 12], 
     'val1': ['a', 'b', 'c', 'd']}
 
a = pd.DataFrame(d)
 
# printing the dataframe
a


# In[35]:


import pandas as pd
 
# Creating dataframe b
b = pd.DataFrame()
 
# Creating dictionary
d = {'id': [1, 2, 9, 8],
     'val1': ['p', 'q', 'r', 's']}
b = pd.DataFrame(d)
 
# printing the dataframe
b


# In[36]:


import pandas as pd
 
# Creating dataframe a
a = pd.DataFrame()
 
# Creating Dictionary
d = {'id': [1, 2, 10, 12],
     'val1': ['a', 'b', 'c', 'd']}
 
a = pd.DataFrame(d)
 
# Creating dataframe b
b = pd.DataFrame()
 
# Creating dictionary
d = {'id': [1, 2, 9, 8],
     'val1': ['p', 'q', 'r', 's']}
b = pd.DataFrame(d)
 
# inner join
df = pd.merge(a, b, on='id', how='inner')
 
# display dataframe
df


# In[37]:


import pandas as pd
 
# Creating dataframe a
a = pd.DataFrame()
 
# Creating Dictionary
d = {'id': [1, 2, 10, 12],
     'val1': ['a', 'b', 'c', 'd']}
 
a = pd.DataFrame(d)
 
# Creating dataframe b
b = pd.DataFrame()
 
# Creating dictionary
d = {'id': [1, 2, 9, 8],
     'val1': ['p', 'q', 'r', 's']}
b = pd.DataFrame(d)
 
# left outer join
df = pd.merge(a, b, on='id', how='left')
 
# display dataframe
df


# In[38]:


import pandas as pd
# Creating dataframe a
a = pd.DataFrame()
 
# Creating Dictionary
d = {'id': [1, 2, 10, 12],
     'val1': ['a', 'b', 'c', 'd']}
 
a = pd.DataFrame(d)
 
# Creating dataframe b
b = pd.DataFrame()
 
# Creating dictionary
d = {'id': [1, 2, 9, 8],
     'val1': ['p', 'q', 'r', 's']}
b = pd.DataFrame(d)
 
# right outer join
df = pd.merge(a, b, on='id', how='right')
 
# display dataframe
df


# In[39]:


import pandas as pd
 
# Creating dataframe a
a = pd.DataFrame()
 
# Creating Dictionary
d = {'id': [1, 2, 10, 12],
     'val1': ['a', 'b', 'c', 'd']}
 
a = pd.DataFrame(d)
 
# Creating dataframe b
b = pd.DataFrame()
 
# Creating dictionary
d = {'id': [1, 2, 9, 8],
     'val1': ['p', 'q', 'r', 's']}
b = pd.DataFrame(d)
 
# full outer join
df = pd.merge(a, b, on='id', how='outer')
 
# display dataframe
df


# In[ ]:




