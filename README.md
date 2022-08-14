# LaTeX Runner

Put the `run.sh` file in your LaTex project folder, and inside this folder run the commands:

```
mkdir build
./run.sh -verbose
```

The `run.sh` script will compile the `main.tex` file, hence make sure your LaTeX file is named as `main.tex`.

## Parameters


| Parameter | Description                         |
|-----------|-------------------------------------|
| `-verbose`  | Verbose flag                        |
| `-pdf`      | Open PDF file after compiling       |
| `-ignore`   | Ignore any error during compilation |
| `-xelatex`  | Use XeLaTeX                         |
| `-biber`    | Run Biber                           |
| `-bibtex`   | Run BibTeX                          |

