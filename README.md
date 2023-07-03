- [Matlab Scripts per Ricerca Operativa](#matlab-scripts-per-ricerca-operativa)
- [What you may be interested...](#what-you-may-be-interested)
  - [images](#images)
- [Documentation](#documentation)
- [Run Locally](#run-locally)
  - [⚠️ Requirements](#️-requirements)


# Matlab Scripts per Ricerca Operativa

Scripts per risolvere i problemi di
Ricerca Operativa - Ing. Informatica Unipi

⚠️ **~~in development~~ ...** ⚠️

Ciao, ormai ho dato l'esame, non ho tanto tempo e voglia per dedicarmi attivamente a scrivere la documentazione e correggere gli script. Se volete potete contribuire / fare un vostro fork...

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

**~~in development~~ ...**

see [documentation.md](documentation.md)

# Run Locally

## ⚠️ Requirements

- Matlab
- Optimization toolbox
- Symbolic toolbox

1. Clone the project ([how to clone a repo](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository))

~~~bash
git clone https://github.com/iSlans/matlab-scripts.git
~~~

2. Go to the project directory (open the folder in Matlab)

~~~bash
cd matlab-scripts
~~~

3. ⚠️ **Add Folder & Subfolders** to Matlab paths
   
   a. By yourself, [e.g. from Matlab editor](https://andysbrainbook.readthedocs.io/en/latest/Matlab/Matlab_03_FunctionsPaths.html)
   b. Run this function in Matlab command window, inside `matlab-scripts` folder, it will add the paths, except `.git` and `.vscode` folders

~~~bash
>> myaddpath(pwd)
~~~

4. **Done! Now you can use the functions** 

5. You can find 
   - a lot of examples of how to use those functions in [test](test/) folder files.
   - documentation in [documentation.md](documentation.md) file