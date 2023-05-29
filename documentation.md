
# Documentation 

- [Documentation](#documentation)
  - [Utils](#utils)
    - [log \& logging](#log--logging)
  - [Problems scripts](#problems-scripts)
    - [baseSolutionProblem](#basesolutionproblem)
    - [primalSimplex](#primalsimplex)

## Utils

### log & logging

Set logging level with `logging` command

```matlab
logging info
logging debug
```

only logs with (level <= selected level) will be printed

```matlab
log.info("Hello World")
log.debug("x = %d", x)
```


---

## Problems scripts

### baseSolutionProblem
```matlab
[x, y] = baseSolutionProblem(c, A, b, baseIndex)
```
    given c, A, b in primal form notation
    will return:
          - primal base solution x
          - dual base solution y

    c vector (col or row)
    A matrix
    b vector (col or row)
    baseIndex vector 

Example
```matlab

c = [-7 1];
b = [4 -6 5 22 6 16];
A = [
  -3 2
  -1 -3
  0 1
  3 2
  1 0
  2 -1
];
[x,y] = baseSolutionProblem(c, A, b, [4 5]);
% x' = [ 6 2 ] 
% y' = [ 0 0 0 1/2 -17/2 0 ] 
```


### primalSimplex
```matlab
primalSimplex(c, A, b, baseIndex [, depthLimit])
```
    solve step by step, using primal simplex, the problem
        max c*x
        A*x <= b

    depthLimit: default = 2   max steps to do

Example
```matlab
c = [-7 1];
b = [4 -6 5 22 6 16];
A = [
    -3 2
    -1 -3
    0 1
    3 2
    1 0
    2 -1
    ];
i = [2, 5];
primalSimplex(c, A, b, i);
% will print 2 (default) steps of primal simplex, with all details: h,k indices, ratios ...

% ex.
% Primal Simplex step 1 
% 
%              key                   value        
%     ___________________    ____________________
%      base                   2 5                
%      x                      6 0                
%      y                      0 -1/3 0 0 -22/3 0 
%      f function value       -42                
%      h exiting index        2                  
%      k entering index       4                  
%      r ratios               33 15 6            
%      new base               4 5                
```
 