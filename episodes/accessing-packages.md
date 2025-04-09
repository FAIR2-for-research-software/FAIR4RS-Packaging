---
title: 'Accessing Packages'
teaching: 30
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- What are the different ways of downloading Python packages?
- What are package managers?
- How can I access my own package?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Learn about package managers such as PIP
- Install packages using PIP
- Install packages from source

::::::::::::::::::::::::::::::::::::::::::::::::


## Introduction

Due to Python's popularity as a language, it is quite likely that you won't be the first person to set off on solving any particular task.
Many others have worked on common problems and then shared their solution in the form of a package, which you can conveniently integrate into your own code and use!

::: callout

### Popular Packages
Some of the most popular packages you may have heard of are:

- Numpy
- Pandas
- Tensorlow
- Matplotlib
- Requests

:::

To use a package that is installed you use the key word `import` in Python.

```python
# This imports the pandas package and gives it a new name 'pd'.
import pandas as pd 

# Use the package to read a file
pd.read_csv("/my_data.csv") 
```

## Python Package Index (PyPI)

The Python Package Index or PyPI is an online repository of Python packages hosting over 500,000 packages! While there are alternatives such as [conda-forge](https://conda-forge.org), PyPI is by far the most commonly used and likely to have all you need.

::: challenge

### Exercise 1: Explore PyPI

Explore [PyPI](https://pypi.org/project/pip/) to get familiar with it, try searching for packages that are relevant to your research domain / role!

:::

::: callout
### pip

pip (package installer for Python) is the standard tool for installing packages from PyPI. 
You can think of PyPI being the supermarket full of packages and pip being the delivery van bringing it to you.

:::


### Using pip

pip itself is a Python package that can be found on [PyPI](https://pypi.org/project/pip/). It however comes preinstalled with most Python installations, for example [python.org](https://python.org) and inside virtual environments.

The most common way to use pip is from the command line. At the top of a package page on PyPI will be the example line you need to install the package

```
py -m pip install numpy
```

The above will install [numpy](https://pypi.org/project/numpy/) from PyPI, a popular scientific computing package enabling a wide range of mathematical and scientific functions. 

::: callout
You may notice a wheel file download during the pip install, for example `Downloading numpy-2.0.0-cp312-cp312-win_amd64.whl`. A wheel in Python is a prebuilt package format that allows for quicker and more efficient installation, so when it is downloaded your local computer doesn't need to do any building. The alternative is source files which often take the form `.zip` or `.tar.gz`, which when downloaded will then need to be built then installed, which is often far slower.

:::

::: challenge
### Exercise 2: Create venv and install Numpy

Step 1: Create a venv in the .venv directory using the command `py -m venv .venv` and activate it with

::: tab

### Windows 

`.\.venv\Scripts\activate`



### macOS / Linux

`source .venv/bin/activate`


:::

When activated you should see the name of your environment in brackets at the start of your terminal line

Step 2: Install Numpy into your new environment

Step 3: Check your results with `py -m pip list`

Step 4: Deactivate your environment with `deactivate`

:::

::: spoiler

### Virtual Environments

Check out [this documentation](https://docs.python.org/3/l[PyPI](https://pypi.org/project/pip/)ibrary/venv.html) or the FAIR4RS course on virtual environments to learn more!

:::


pip can also be used to install packages from source. This means that the package file structure (source) is on your local computer and pip installs it using the instructions from the `setup.py` or `pyproject.toml` file. This is especially handy for packages either not on PyPI, like ones downloaded from github, or for your own packages you're developing.

::: tab

### Windows 

`py -m pip install .`



### macOS / Linux

`python3 -m pip install .`


:::

::: instructor

It may be worth checking with the class at this point that they are all familiar with the -m notation, and what the above command does exactly

:::

Here the `.` means to install your current directory as a Python package. For this to work the directory your command line interface is currently in needs to have a packaging file, i.e. `setup.py` or `pyproject.toml`. 



::: keypoints
- pip is the most common tool used to download and access python packages from PyPI.
- PyPI is an online package repository which users can choose to upload their packages to for others to use.
- pip can also be used to install packages on your local system (installing from source)
:::






