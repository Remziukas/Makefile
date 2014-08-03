# Makefile by example

[TOC]

## Introduction
Makefiles are special format files that together with the make utility will help you to automagically build and manage your projects. A makefile consists of a set of rules. A rule consists of 3 parts:

- a target 
- a list of pre-requisites
- a command, as follows:

```Makefile
target: pre-req-1 pre-req-2 ...
	command
```

## Variables (Macros)

The syntax for accessing a make variable is `$(VAR)`. Make has a whole host of built in rules that mean that very often, a project can be compile by a very simple makefile, indeed. Traditional variables (Make macros) used by implicit (built-in) rules:

* `CC`       - the c compiler to use
* `CXX`      - the c++ compiler to use
* `CFLAGS`   - compilation flags for c source files
* `CXXFLAGS` - compilation flags for c++ source files
* `CPPFLAGS` - flags for the c-preprocessor (typically include file paths and symbols defined on the command line), used by c and c++
* `LD`       - the linker to use
* `LDFLAGS`  - linker flags, i.e. `-g`, `-O1`, `-O2`, `-O3` and so on.
* `LDLIBS`   - libraries to link, i.e. `-lm`, `-lz`, `-pthread` and so on.

## Pattern rules

A pattern rule, which uses pattern matching character `%` as the filename, can be applied to create a target, if there is no explicit rule. Pattern rules are specified in a form like

```Makefile
%.o: %.cpp 
   $(CCX) $(CFLAGS) $(CPPFLAGS) -c $<
```
which means that object files are generated from c source files by running the command shown, where the "automatic" variable `$<` expands to the name of the first dependency.

## Automatic variables

"Automatic" variables are set by make after a rule is matched. There include:

 * `$@` - the target filename.
 * `$*` - the target filename without the file extension.
 * `$<` - the first prerequisite filename.
 * `$^` - the filenames of all the prerequisites, separated by spaces, discard duplicates.
 * `$+` - similar to `$^`, but includes duplicates.
 * `$?` - the names of all prerequisites that are newer than the target, separated by spaces.

## .PHONY 

Generally all targets in your `Makefile` which do not produce an output file with the same name as the target name should be `.PHONY`. This typically includes **all**, **install**, **clean**, **check** and so on.

## Example

And finally, the same `makefile` example to build the executable `./math` program from source `math.cpp`, `functions.cpp` and header `functions.h` files via make utility.

```Makefile
# Makefile
CXX        = g++
CXXFLAGS   = -g -c -Wall
LDFLAGS    = 
LDLIBS     =
OBJS       = math.o functions.o
DEPS       = functions.h
EXECUTABLE = math 


.PHONY: all
all: $(EXECUTABLE)
	@echo All done!

$(EXECUTABLE): $(OBJS)
	$(CXX) $(LDFLAGS) $^ -o $@ $(LDLIBS)

%.o: %.cpp $(DEPS)
	$(CXX) $(CXXFLAGS) $<

.PHONY: clean
clean: 
	rm -f $(OBJS) $(EXECUTABLE)
	@echo Clean done!
```

## References 

1. [GCC and Make](https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html "https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html")
2. [Makefiles by example](http://mrbook.org/tutorials/make/ "http://mrbook.org/tutorials/make/")
3. [How to make SIMPLE C++ Makefile?](http://stackoverflow.com/questions/2481269/how-to-make-simple-c-makefile "http://stackoverflow.com/questions/2481269/how-to-make-simple-c-makefile")
4. [A Simple Makefile Tutorial](http://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/ "http://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/")
5. [Managing Projects with GNU Make, By Robert Mecklenburg](http://oreilly.com/catalog/make3/book/ "http://oreilly.com/catalog/make3/book/")
