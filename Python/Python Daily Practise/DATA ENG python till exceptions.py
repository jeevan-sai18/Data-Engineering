#!/usr/bin/env python
# coding: utf-8

# In[1]:


print("Hello world")


# In[2]:


#Variables
a=5
print(a)


# In[4]:


# Arithmetic operators
a=5
b=2

print(a+b)
print(a-b)
print(a*b)
print(a/b)
print(a%b)


# In[6]:


# Comparison operators

print(a==b)
print(a!=b)
print(a<b)
print(a>b)
print(a<=b)
print(a>=b)


# In[2]:


# Logical operators
a=5
b=2
print((a>b) and (a<10))
print((a<b) or (a<10))
print(not(a==b))


# In[13]:


# Conditional Statements

num=float(input("Enter a number: "))

if num>0:
    print("The number is positive.")
elif num< 0:
    print("The number is negative.")
else:
    print("The number is zero.")


# In[23]:


# for loop

colors=["red","green","blue","yellow"]

print("Using for loop:")
for i in colors:
    print(i)


# In[15]:


# while loop

count=5

print("Using while loop:")
while count>0:
    print(count)
    count-=1


# In[21]:


# Nested loop

for i in range(1,3):
    for j in range(1,6):
        print(f'{i}*{j}={i*j}')
    print('.............')


# In[18]:


a=int(input("enter num"))
for i in range(1,11):
    print(f'{a}*{i}={a*i}')


# In[22]:


rows=4
i=1

while i<=rows:
    j=1
    while j<=i:
        print("*",end=" ")
        j+=1
    print()
    i+=1


# In[24]:


# break

numbers=[1,2,3,4,5,6,7,8,9,10]

for num in numbers:
    if num==5:
        print("Found 5, breaking out of the loop")
        break
    print(num)


# In[28]:


# countinue
for num in numbers:
    if num % 2 == 0:
        continue
    print(num)
print("Skip even ones")


# In[31]:


# pass
x=10

if x>0:
    print("x is positive")
elif x<0:
    print("x is negative")
else:
    pass  # Placeholder for handling the case when x is zero


# In[33]:


# Creating a list
fruits=["apple","banana","orange","grape"]

# Accessing elements
print(fruits[0])

# Modifying elements
fruits[1]="kiwi"

# Adding elements
fruits.append("pear")

# Removing elements
fruits.remove("orange")

# List iteration
for fruit in fruits:
    print(fruit)
print(fruits)


# In[34]:


# Slicing
fruits=["apple","banana","orange","grape"]
print(fruits[1:3])


# In[44]:


# Creating a dictionary
person = {"name":"John","age":30,"city":"New York"}

# Accessing values
print(person["name"])

print(person.keys())
print(person.values())
print(person.items())
print(person)


# In[49]:


# Creating a set
colors = {"red","green","blue"}

# Adding and removing elements
colors.add("yellow")
print(colors)
colors.remove("red")
print(colors)

# Set methods
intersection=colors.intersection({"green", "orange"})
difference=colors.difference({"green", "orange"})

print(intersection)
print(difference)


# In[52]:


# String Functions

text="Hello, World!"
length=len(text)
print(length)
uppercase_text=text.upper()
lowercase_text=text.lower()
print(uppercase_text)
print(lowercase_text)

sentence="This is a sample sentence."
words=sentence.split(" ")
print(words)


# In[54]:


# Number functions

number=-10
absolute_value=abs(number)
print(absolute_value)

pi=3.14159
rounded_pi=round(pi)
print(rounded_pi)


# In[1]:


#  Date and time functions
from datetime import datetime,timedelta

# Current date and time
current_datetime=datetime.now()
print(current_datetime)

# Adding days to the current date
new_date=current_datetime+timedelta(days=5)
print(new_date)


# In[56]:


#default fun
def greetings():
    print("Hi...")
greetings()


# In[57]:


def table(a):
    for i in range(1,11):
        print(f'{a}*{i}={a*i}')
table(int(input("Enter num:")))


# In[58]:


#positional arguments
def posa(a,b):
    print(b,a)
posa(10,20)


# In[59]:


#default arguments
def defa(a,b=20):
    print(a,b)
defa(30)
defa(30,40)


# In[60]:


#keyword arguents
def kewa(b,a):
    print(a,b)
kewa(a=20,b=40)


# In[61]:


#variable length positional args
def vlpa(*args):
    print(type(args))
    for i in args:
        print(i,end=' ')
vlpa(1,2,3,4,5)


# In[62]:


#variable length keyword args
def vlka(**kwargs):
    for i in kwargs:
        print(i,kwargs[i])
vlka(name='amit',roll=101,marks=60,branch='cse')


# In[65]:


def jeevan():
    '''jeevan created user define funtion'''
    print("jeevan sai")
jeevan()
help(jeevan)


# In[5]:


#map function

def square(x):
    return x**2
numbers=[1,2,3,4,5]

# Use map() to apply the square function to each element in the list
squared_numbers=map(square,numbers)
# Convert the result to a list (as map returns an iterator)
result_list=list(squared_numbers)
print(result_list)


# In[6]:


# lambda function

square = lambda x: x**2
result = square(5)
print(result) 


# In[7]:


# lambda + map functions
numbers=[1,2,3,4,5]
squared_numbers=map(lambda x: x**2, numbers)
result_list=list(squared_numbers)
print(result_list)


# In[67]:


#oops concept
class My_class:
    def __init__(self):
        self.x=0
        self.y=0
        self.z=0
        print("Hi jeevan")
    def setdata(self):
        self.x=100
        self.y=10
        self.a=20
    def getdata(self):
        print(f'value of x is "{self.x}" and value of y is {self.y} and value of z is {self.z}')
obj1=My_class()
obj1.setdata()
obj1.getdata()


# In[68]:


class My_class:
    def __init__(self,a,b):
        self.a=a
        self.b=b
        print(f'Value of a is {a} and b is {b}')
obj=My_class(int(input("enter a:")),int(input("enter b:")))


# In[69]:


class My_Class:
    count=0
    def __init__(self,a,b):
        print('Welcome parameterised. constructor:')
        self.a=a
        self.b=b
        print(self.a,self.b)
    def __del__(self):
        print('Bye..we are going to destroy')

obj1=My_Class(100,200)
del obj1


# In[70]:


class mine:
    def __init__(self,a):
        self.a=a
        print("HI..",self.a)
    def greet(self):
        print("hello boss...")
obj=mine("Jeevan")
obj.greet()


# In[71]:


class jeevan:
    def __init__(self):
        print("jeevan")
    def goo(self):
        print("Shut up")
class sai(jeevan):
    def __init__(self):
        super().__init__()
        print("sai")
    def goo(self):
        super().goo()
        print("shut up rascel")
obj=sai()
obj.goo()


# In[72]:


class Student:
    stream='chemical'
    def __init__(self,roll):
        self.roll=roll
obj=Student(101)
b=Student(102)
print(obj.stream)
print(b.stream)
print(obj.roll)


# In[73]:


#basic inheritance
class parent:
    def m1(self):
        print("parent class")
class child(parent):
    def m2(self):
        print("child class")
obj=child()
obj.m1()
obj.m2()


# In[74]:


#multi level Inheritence
class gf:
    def m1(self):
        print("Grand father")
class pa(gf):
    def m2(self):
        print("Father")
class son(pa):
    def m3(self):
        print("son")
obj=son()
obj.m1()
obj.m2()
obj.m3()


# In[75]:


#multiple inheritence
class father:
    def m1(self):
        print("father")
class mother:
    def m2(self):
        print("mother")
class child(father,mother):
    def m3(self):
        print("son")
o=child()
o.m1()
o.m2()
o.m3()


# In[76]:


# Hierarchical Inheritentence
class parent:
    def m1(self):
        print("mother")
class s1(parent):
    def m2(self):
        print("bro")
class d1(parent):
    def m3(self):
        print("daughter")
o1=s1()
o2=d1()
o1.m1()
o2.m1()
o1.m2()
o2.m3()


# In[77]:


class Person:
    def __init__(self):
        self.height=157
        self.weight=75
        self.comp='fair'
    def display(self):
        print(self.height,self.weight,self.comp)
class Student(Person):
    def __init__(self):
        self.name="Amit"
        self.course='Btech'
        super().__init__()
    def display(self):
        print(self.name,self.course)
        super().display()

obj=Student()
obj.display()


# In[82]:


l=[1,2,3,4]
a=2
z=100
d={1:'A',2:'B'}
try:
    x=10/a
    print(l[1])
    print(z)
    print('a'+'10')
    print(d[1])
    print('..............')
    print('Done..')
except IndexError as e:
    print(e)
except ZeroDivisionError as e:
    print(e)
except NameError as e:
    print(e)
except TypeError as e:
    print(e)
except KeyError as e:
    print(e,'Error')
else:
    print('Hey every thing is fine go ahead...')
finally:
    print('Hey bye bye..')


# In[83]:


try:
    print('Hi')
except Exception as e:
    print(e)
else:
    print('Hello')
    print('Hello')
finally:
    print('Bye..')


# In[84]:


try:
    raise KeyError("y")
except Exception as e:
    print(e)


# In[3]:


class Myclass(Exception):
    def __init__(self,msg):
        super().__init__(msg)
n=int(input("Value-"))
if n<0:
    try:
        raise  Myclass('negative val:')
    except Myclass as e:
        print(e)
else:
    print('Value',n)


# In[86]:


l=[1,2,3]
a=5
r=8

try:
    print(l[0])
    print(10/a)
    print(r)
except Exception as e:
    print(e)
else:
    print("well done proggramer jeevan")
finally:
    print("Don't stop till you reach the goal")


# In[87]:


class myclass(Exception):
    def __init__(self,msg):
        super().__init__(msg)
n=int(input("enter value:"))
if n<0:
    try:
        raise myclass('negative')
    except Exception as e:
        print(e)
else:
    print(n)


# In[1]:


# access specifiers

# public
class MyClass:
    def public_method(self):
        print("This is a public method.")

obj = MyClass()
obj.public_method()  # Accessing a public method


# In[2]:


# Protected
class MyClass:
    def __init__(self):
        self._protected_attribute = 42

obj = MyClass()
print(obj._protected_attribute)  # Accessing a protected attribute


# In[3]:


# Private
class MyClass:
    def __init__(self):
        self.__private_attribute = 42

    def __private_method(self):
        print("This is a private method.")

obj = MyClass()
# Attempting to access a private attribute or method will result in an error.
# obj.__private_attribute
# obj.__private_method()


# In[6]:


# Polymorphism with a Function
# method overriding
class Cat:
    def speak(self):
        return "Meow!"

class Dog:
    def speak(self):
        return "Woof!"

def animal_sound(animal):
    return animal.speak()

# Creating objects of different classes
cat = Cat()
dog = Dog()

# Calling the speak method on different objects
print(animal_sound(cat))  
print(animal_sound(dog)) 


# In[ ]:





# In[ ]:




