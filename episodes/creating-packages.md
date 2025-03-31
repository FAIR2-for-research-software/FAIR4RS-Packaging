---
title: 'Creating Packages'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- Where do I start if I want to make a Python package?
- What will I need / want in my package?
- What's considered good practice with packaging?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Create and build a basic example Python package
- Understand all the parts and decisions in making the package

::::::::::::::::::::::::::::::::::::::::::::::::

## Introduction

This episode will see us creating our own Python project from scratch and installing it into a Python virtual environment ready for use. Feel free if you're feeling adventurous to create your own package content or follow along with this example of a Fibonacci counter.


## Fibonacci Counter

This package will allow a user to find any value from the Fibonacci sequence. The Fibonacci sequence is a series of whole numbers where each number is the sum of the two previous numbers. The first 8 numbers of the sequence are `0, 1, 1, 2, 3, 5, 8, 13`.

::: callout
### Reinventing the wheel
It is good to ask yourself if the package or features you are designing have been done before. Obviously we have chosen a simple function as the focus of this episode is on packaging code rather than developing novel code.

:::

## Creating the package contents

In this section we will go through creating everything required for the package. 

::: challenge
### What files and content go into a package?
Think back to the earlier episodes and try to recall all the things that can go into a package.

::: solution
1. Python Module - This is the directory with the Python code that does the work.
2. Configuration File - e.g. your pyproject.toml file
3. Other metadata files - e.g. LICENCE, README.md, citation.cff
4. Python Tests - A directory full of unit-tests and other tests
:::
:::

In this episode we will only be creating a minimal example so many of the files you have thought of won't be included. Next we will be creating our directory structure. In either your `documents` folder if you are on Windows or your `home` directory if you are on macOS or Linux, create a folder called `my_project` 

```
📦 my_project/
├── 📂 my_package/
│   └── 📄 fibonacci.py
├── 📄 pyproject.toml
└── 📂 tests/
    └── 📄 test_fibonacci.py
```

The first thing we will do in this project is create the Python module (the actual code!).

::: challenge
### Creating Python module

1. Create a Python file called `fibonacci.py` as shown in the structure above.
2. Add the following code which contains a function that returns the Fibonacci sequence
```python
def fibonacci(n_terms):
  num1 = 0
  num2 = 1
  next_num = 1
  count = 0

  while count < n_terms:
    print(num1)
    count += 1
    num1, num2 = num2, next_num
    next_num = num1 + num2
```
:::

::: challenge
### Using your Python module

Create a script in your project directory that imports and uses your Fibonacci script. This will serve as a good quick test that it works.

::: solution
1. Create the file in `/my_project`, for example `fibonacci_test.py`.
2. Import and run the Fibonacci function:
```python
from my_package.fibonacci import fibonacci

fibonacci(5)
```
:::
:::

## Configuration File

In this section we are going to look deeper into the `pyproject.toml`. Sections in a `.toml` file are called tables. In a `pyproject.toml` file there are 2 tables required for a minimum working `pyproject.toml`: a `[build-system]` table and a `[project]` table. Take a look at the minimum example `pyproject.toml` below. 

```toml

[build-system]
requires = ["setuptools"]


[project]
name = "fibonacci"
version = "0.1.0"
description = "A package to calculate the fibonacci sequence"
dependencies = ["pandas", "numpy"]
```

### [build-system]
The `[build-system]` table specifies information required to build your project directory into a package. The main key in this table is `requires`, this key states what build tool(s) should be used to do this building. There are multiple popular [build tools](https://packaging.python.org/en/latest/guides/tool-recommendations/#build-backends) that can be used to build your project, in this tutorial we will use `setuptools`, as it is simple and very popular.

### [project]
The `[project]` table is where your package's core metadata is declared. 

::: callout
### pyproject.toml documentation

The full list of accepted keys can be found [here](https://packaging.python.org/en/latest/specifications/pyproject-toml/) in the documentation
:::

::: challenge
### Create your configuration file

Create a `pyproject.toml` file with the two required tables. In the `[project]` table include the following keys:

- name
- version
- description
- authors
- keywords

::: solution

```toml
[build-system]
requires = ["setuptools"]

[project]
name = "fibonacci"
version = "0.1.0"
description = "A package which can produce the Fibonacci sequence"
authors = [{name = "your_name", email="youremail@email.com"}]
keywords = ["fibonacci", "maths"]
```
:::
:::

Running `py -m pip install .` will install your package. Just ensure your terminal's working directory is the same as the `pyproject.toml` file!

::: callout
### Editable Install
When installing your own package locally, there is an option called editable or `-e` for short.
`py -m pip install -e .`

With a default installation (without -e), any changes to your source package will only appear in your Python environment when your package is rebuilt and reinstalled. The editable option allows for quick development of a package by removing that need to be reinstalled, for this reason it is sometimes called development mode!



:::
::::::::::::::::::::::::::::::::::::: keypoints 

- A package can be built with as little as 2 files, a Python script and a configuration file
- pyproject.toml files have 2 key tables, [build-system] and [project]
- Editable installs allow for quick and easy package development

::::::::::::::::::::::::::::::::::::::::::::::::

