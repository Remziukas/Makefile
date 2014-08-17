# --------------------------------------------------------------------------- 
#								INTRODUCTION
# --------------------------------------------------------------------------- 
# Makefiles are special format files that together with the make utility 
# will help you to automagically build and manage your projects.
#
# A makefile consists of a set of rules. 
# A rule consists of 3 parts: 
# a target, a list of pre-requisites and a command, as follows:
# target: pre-req-1 pre-req-2 ...
#	command
# --------------------------------------------------------------------------- 
#								 VARIABLES (MACROS)
# --------------------------------------------------------------------------- 
# The syntax for accessing a make variable is $(VAR).
# Make has a whole host of built in rules that mean that very often, 
# a project can be compile by a very simple makefile, indeed.
#
# Traditional variables (Make Macros) Used By Implicit (Built-in) Rules:
# CC       = the c compiler to use: gcc, clang, icc
# CXX      = the c++ compiler to use: g++, clang++, icpc
# CFLAGS   = compilation flags for c source files
# CXXFLAGS = compilation flags for c++ source files
# CPPFLAGS = flags for the c-preprocessor (typically include file paths 
# and symbols defined on the command line), used by c and c++
# LD       = the linker to use
# LDFLAGS  = linker flags, i.e. -g, -O1, -O2, -O3 and so on. 
# LDLIBS   = libraries to link, i.e. -lm, -lz, -pthread and so on.
# --------------------------------------------------------------------------- 
#								   PATTERN RULES
# --------------------------------------------------------------------------- 
# A pattern rule, which uses pattern matching character '%' as the filename, 
# can be applied to create a target, if there is no explicit rule. 
# Pattern rules are specified in a form like
#
# %.o: %.cpp 
#    $(CCX) $(CFLAGS) $(CPPFLAGS) -c $<
#
# which means that object files are generated from c source files by running 
# the command shown, where the "automatic" variable $< expands to the name 
# of the first dependency.
# --------------------------------------------------------------------------- 
#								AUTOMATIC VARIABLES
# --------------------------------------------------------------------------- 
# "Automatic" variables are set by make after a rule is matched. 
# There include:
# $@: the target filename.
# $*: the target filename without the file extension.
# $<: the first prerequisite filename.
# $^: the filenames of all the prerequisites, separated by spaces, 
# discard duplicates.
# $+: similar to $^, but includes duplicates.
# $?: the names of all prerequisites that are newer than the target,
# separated by spaces.
# --------------------------------------------------------------------------- 
#								      PHONY
# --------------------------------------------------------------------------- 
# Generally all targets in your Makefile which do not produce \ 
# an output file with the same name as the target name should \
# be PHONY. This typically includes all, install, clean, check. etc.
# ---------------------------------------------------------------------------

CXX        = g++
CXXFLAGS   = -g -c -Wall
LDFLAGS    = -g
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
