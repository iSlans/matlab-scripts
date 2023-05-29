 
# Matlab Scripts per Ricerca Operativa
Scripts per risolvere i problemi di 
Ricerca Operativa - Ing. Informatica Unipi   


## Run Locally  

Clone the project  

~~~bash  
  git clone https://github.com/iSlans/matlab-scripts.git
~~~

Go to the project directory  

~~~bash  
  cd matlab-scripts
~~~

Add Folder & Subfolders to Matlab paths  
1. by yourself, e.g. from Matlab editor
2. or this my custom function to do it

~~~matlab  
>> myaddpath(pwd) 
~~~

Try some my test scripts, in `/test` folder

~~~bash  
>> run('./test/test_ktree.m')
~~~  

## Documentation  

- ### baseSolutionProblem
```matlab
baseSolutionProblem(c, A, b, baseIndex)
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


- ### primalSimplex
```matlab
primalSimplex(c, A, b, baseIndex [, depthLimit])
```

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
x = primalSimplex(c, A, b, i);
% will print 2 (default) steps of primal simplex, with all details: h,k indices, ratios ...
```
 
## License  
[MIT](https://choosealicense.com/licenses/mit/)  
