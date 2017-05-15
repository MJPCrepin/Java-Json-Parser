Simple JSON Parser written in Java
---

JSON Lexer and Parser using [JFlex](http://jflex.de/) and [CUP](http://www2.cs.tum.edu/projects/cup/).

Fully JSON ([ECMA-404](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf)) compliant. See comments in:
* cup/Parser.cup
* jflex/Scanner.jflex 
* input.test

The lexer (scanner.jflex) will scan for the specified tokens in a JSON file.
The parser (parser.cup) will then interpret the JSON to check for correct syntax.

Test folder contains separate case tests, [borrowed from James Alastair McLaughlin](https://github.com/udp/json-parser/tree/master/tests).

_Coursework for module GC04 (compilers part) in MSc Computer Science at UCL. Builder & task provided by Rae Harbird (r.harbird@ucl.ac.uk). Parser & Lexer by Manuel Crepin (manuel.crepin.16@ucl.ac.uk) & Nidhi Goel (nidhi.goel.16@ucl.ac.uk)_.

Install
---

Requirements:
* UNIX environment
* [Oracle Java JDK](http://www.wikihow.com/Install-Oracle-Java-JDK-on-Ubuntu-Linux)
* Apache Ant

Assuming the proper JDK is installed:

1) Install Apache Ant (to build the parser)  
	`sudo apt install ant`

2) Build using Ant (from root folder of parser)  
	`ant jar`

3) Run tests (default contains definitive JSON test case)  
	`java -jar jar/Compiler.jar input.test`

Parser will specify whether parse was successful, or at which line(s) the error is.
