ArchStatMzn
===========

Performs static analysis on C functions to confirm equivalancy.

These problems use MiniZinc for static analysis. Static analysis and constraint 
programming often use similar resolution tools designed specifically for 
solving potentially exponentially difficult computations. 

Minisat and other CNF solvers like it are well matched for discrete computational 
problems, making them ideal for representing a modern CPU, however constraint programming
sometimes has to venture into continuous territory possibly employing simplex
and other techniques not well suited for the discrete world view.

However, this is not to say that taking a continuous approach to some static 
analysis problems wouldn't prove more effective. These problems experiment
with this idea.

The main idea is to first take a set of problems used as a specification (input_programs 
labeled with -spec.c) solving for a result, then solve for the a result using 
the same input with a test program (input_programs labeled with -other.c)
and then testing to see if there is any possible input that leads to a differing result.

Testing is performed on problems from CSAPP (http://csapp.cs.cmu.edu)

More information on MiniZinc can be found at: http://minizinc.org
