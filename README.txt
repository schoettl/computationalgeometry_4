Run time of quick hull algorithm
================================

Results
-------

2 plots and the table


How to reproduce
----------------

On Linux we download QuickHull <www.qhull.org> via Git, build it, and use a
Bash script to produce the required run time data. With a R script we output a
overview table and two plots showing the run times over the number of data
points.

The results can be reproduced with this commands in Bash:

    git clone https://gitorious.org/qhull/qhull.git
    cd qhull/
    make
    cd ..
    ./make-table.sh '2 8' '1 2'
    R --vanilla < plots.R
