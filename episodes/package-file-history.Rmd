---
title: 'Package File History'
teaching: 10
exercises: 1
editor_options: 
  markdown: 
    wrap: 100
---

::: questions
-   What is required to turn your Python project into a package?
-   Why are there so many file types you can use to create packages in Python?
-   Which file type is the most appropriate for my project?
:::

::: objectives
-   Learn the difference between a python project and package
-   Understand the prerequisites for turning your project into a package
-   Explain the different ways of creating a Python Package
-   Understand the shortfalls of the previous packaging standards
:::

## Introduction

In this episode we are going to look at what turns your project of python code into a Python package. 
Throughout Pythons development there have been many different ways of doing this, we will aim to explore some of these. 
This is to both build an understanding of why the current standard is what it is and to have some context if you ever come across the other methods when looking at other projects.

::: callout
## What Python packaging files exist?

1. requirements.txt
2. setup.py
3. pyproject.toml

:::

## Requirements.txt

A `requirements.txt` is a text file where each line represents a package or library that your project depends on. A package managing tool like PIP can use this file to install all the necessary dependencies. 

While a requirements.txt file isn't normally directly used for packaging, its a simple and common filetype that offers some of the features that the packaging files do.

```
requests==2.26.0
numpy>=1.21.0
matplotlib<4.0
```

## Setup.py

Before the introduction of `pyproject.toml` the main tool supported for installing packages was `setup.py`. As the extension suggests a `setup.py` is a python file where the metadata and logic for building your package are contained. 

::: challenge

### Setup.py problems

Q: Discuss with each other what problems if any you think there may be with using a python file to create python packages

::: hint
### Hint

Think about the differences between a code file and a text file
:::

::: solution


1. As `setup.py` is a code file, there is a potential for malicious code to be hidden in them if the file comes from an untrusted source
2. There is quite a bit of 'boilerplate' in each file
3. The syntax has to be precise and may be confusing to those not familiar with Python

::::::::::::::::::::::
:::::::::::::::::::::::::

```python
from setuptools import setup

setup(
  name='fibonacci',
  version='1.0.0',
  description='A package to calculate the fibonacci sequence',
  long_description=open('README.md').read(),
  author='John Doe',
  author_email='john.doe@example.com',
  license='MIT',
)
```

## Pyproject.toml

Introduced in [PEP517](https://peps.python.org/pep-0517/), the latest file for packaging a python project is the `pyproject.toml` file.
Like a `.cfg` file, a `toml` file is designed to be easy to read and declarative. It is the current recommended way to package your Python 

::: callout
TOML stands for Tom's Obvious Minimal Language!
:::

When originally introduced, the `pyproject.toml` file aimed to replace `setup.py` as the place to declare build system dependencies. For example the most basic 
`pyproject.toml` would look like this.

```toml
[build-system]
# Minimum requirements for the build system to execute.
requires = ["setuptools", "wheel"]
```

Project metadata however was still being specified either in a `setup.py` or a `setup.cfg`, the latter being preferred.

With the introduction of [PEP621](https://peps.python.org/pep-0621/) in 2020, project metadata could also be stored in the `pyproject.toml` files, meaning you only now need the single file to specify all the build requirements and metadata required for your package! This is still the preferred way in the community.

We will be going into how to make a `pyproject.toml` file in more detail in one of the next episodes.

```toml
#Build system information
[build-system]
requires = ["setuptools", "wheel"]

#Project Metadata
[project]
name = "my_cool_package"
version = "0.0.0"
description = "A package to do awesome things"
dependencies = ["pandas", "numpy"]

#Config for an external tool
[tool.black]
line-length = 98
```

::: keypoints
- Python packages make code easier to install, reuse and maintain. 
- A single pyproject.toml file is all that is required to package your Python project.
- There are multiple standards out there for Python packaging, but pyproject.toml is the current recommended way.
:::
