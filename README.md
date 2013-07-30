PythonForMIC
============

PythonForMIC is a repository that aims to bring a working version of Python to Intel Xeon Phi.
PythonForMIC is required because the regular Python source code still lacks support for cross-compiling (as of current version, 3.3.2, July 2013). Therefore, we provide a patched version of Python, as well as a method in order to properly install it on Xeon Phi.

About this project
==================

The process used to install Python for Intel Xeon Phi, as well as the provided patch are done by third party people. This project is not officially supported by the Python Software Foundation but is open to any improvements !

This project is under Python Software Foundation License.

The current version consists of Python 2.6.6

Installation
============

Run the ./install.sh script. There might be errors going on, but Python executables are normally build within the ./\_binaries folder. You can then transfer the \_binaries folder on mic using the following command:

scp -r _binaries mic0:~/

Links and Special Thanks
========================

About the methodology, Emilio C.
http://software.intel.com/en-us/forums/topic/392736

Python patch, Paul Gibson:
http://randomsplat.com/id5-cross-compiling-python-for-embedded-linux.html


