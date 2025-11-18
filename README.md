This is demo program in order to test capabilities of dynamic library concept in unix system.
Shell script generates large text file with coordinates which then is processed by another program which leverages libcoords.sodynamic library in order to process large text file (find largest coordinates).


In order to test you need to compile code with `make` command, then run generate_coordinates.sh file
it will generate text file approx 2Gb

After that run compiled binary (by default it is called `test`) with command `./test`

After successfull run, result will be printed in console

