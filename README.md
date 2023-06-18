 
# Matlab Scripts per Ricerca Operativa
Scripts per risolvere i problemi di 
Ricerca Operativa - Ing. Informatica Unipi   

⚠️ **in development ...** ⚠️

---

# What you may be interested...

- PL / PLI
  - Primal and dual base solutions
  - Assignment problem
  - Primal simplex, step by step
  - Dual simplex, step by step
  - K-Tree
  - Gomory plane cuts
  - Symmetric TSP branch & bound, step by step
  - Nearest Node tree greedy algorithm
  - ...

- PLR
  - Flow simplex, step by step
  - Min path Dijkstra
  - Max flow Ford Fulkerson

- PNL
  - LKKT
  - Frank Wolfe
  - Projected Gradient
  - Plot functions surface on polygon region
  - Plot functions surface on non-linear constraint region

## images

- Plotting surface on region

![plot img](img/plotOnPolygon.png) 
![plot img](img/plotOnConstraints.png)
# Documentation  

**in development ...**

see [documentation.md](documentation.md)


# Run Locally  

## ⚠️ Requirements

- Matlab
- Optimization toolbox
- Symbolic toolbox

1. Clone the project  

~~~bash  
  git clone https://github.com/iSlans/matlab-scripts.git
~~~

2. Go to the project directory  

~~~bash  
  cd matlab-scripts
~~~

Use scripts from Matlab Editor, or use VS Code and run Matlab from terminal 

3. ⚠️ **Add Folder & Subfolders** to Matlab paths  

   1. by yourself, e.g. from Matlab editor
   2. or run this custom function in Matlab command window, inside `matlab-scripts` folder, it excludes `.git` and `.vscode` folders

~~~bash  
>> myaddpath(pwd) 
~~~

4. Try some my test scripts, in `test/` folder, open and try to run them. They are examples of how to use my scripts

~~~bash  
>> run('./test/test_ktree.m')
~~~  

