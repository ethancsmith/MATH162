# MATH162

$\LaTeX\$ project for Calc II notes primarily based on _Thomas' Calculus_.

## Build instructions.

If you have `make` installed on your system, a `Makefile` is included to aid the building of the various documents.
To build an individual lecture PDF (without solutions to examples) use the following command.
```shell
make <filename.pdf>
```
For example, the following call to `make` will build the lecture notes for \textsection 7.1 (Inverse functions) of _Thomas' Calculus_.
```shell
make 7-1_inverse_functions.pdf
```
To build all lecture PDFs as individual files (without solutions), run the following.
To build all lecture notes bound into a single PDF (without solutions to examples) run the following.
```shell
make main.pdf
```
To build all lecture notes bound into a single PDF **including solutions to examples** run the following.
```shell
make main_with_solutions.pdf
```
If `pandoc` is installed on your system, then following will make an MS Word version of the entire set of notes **with solutions included**.
```shell
make docx
```
However, the conversion sometimes breaks and is not typically as pretty.
Of course, a simple call to `make` with no arguments makes _everything_ mentioned above.
