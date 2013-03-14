Experimental sudoku solver

I only ever implemented the hard parts; it will work (rather efficiently, in fact) on most puzzles, but it will only find partial solutions to the more difficult ones (those that require guessing). Currently it uses two algorithms:
- Squares with only a single possibility
- Rows, columns, or boxes in which a number appears only once
- *Depth first search (guess and check) is not implemented*
