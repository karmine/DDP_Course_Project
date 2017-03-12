Clustering, Ranking and Location of Spanish Universities with Repositories on Web
========================================================
author: Sergio Contador
date: March 2017
autosize: true

Introduction
========================================================
There are in total 82 spanish universities, 60 with institutional repositories on web. This application works with this 60 group.  

You can explore different data from universities and theirs institutional repositories with Hiecharchical Clustering Method using NBClust Criterion to calculate the optimum number of cluster partitions.  

The application shows the ranking of the universities based on data selected.  

Also, you can locate the university you want on map, with icon links to the web pages of both, university and institutional repository.
        
Clustering Universities
========================================================
Explore the data with Hiecharchical Clustering Method using NBClust criterion to calculate the optimum number of cluster partitions. You can select 3 parameter to control the algorithm: 5 distance metric, 6 clustering method and 30 NbCluts index. 

The application uses 7 different types of data: fundation -> year of fundation of the university, number.professor -> number total of professors of the university in year 2015, number.student -> number total of students of the university in year 2015, size.university -> number total of professors plus students of the university in year 2015, size.repository -> number of scientific sources storing in the institutional repository of the university, ranking.rwwu -> ranking web of universities and ranking.alexa -> another ranking web of universities

Ranking Universities
========================================================
The application creates the ranking table of the universities based on data clustering selected.


```
   university size.repository
1        USAL          105237
2         UAB           84125
3         UPC           77261
4         UPV           57447
5          UA           38305
6          UV           35159
7      UNIOVI           34193
8         UGR           33424
9         UCM           32204
10         US           31209
```

Locating Universities
========================================================
The application locate the university you want on map, with icon links to the web pages of both, university and institutional repository.

We recommend you to try and see all those funtionalities [here](https://scontador.shinyapps.io/ddp_course_project)!!






