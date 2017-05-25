# City-Path-Finder
This project is written in prolog. For this project given a beginning and ending coordinates and a maze, it will spit out a path from the beginning and ending coordinates if one exists. The maze will be contained in the form of a list of lists such as: 
          maze([[0, 0, 0, 0],
          [0, 1, 1, 0],
          [0, 1, 0, 0],
          [0, 1, 0, 1],
          [0, 0, 0, 0]]).
Where 0s represent open spaces to traverse and 1s represent blocked paths. This program will return the path taken from beginning to end along with the distance of that path. Even given an unsolvable path the program will successfully terminate.
Included here is the prolog file for solving a path in a given maze and a report explaining the decisions behind the design of the program and that goes more in depth in what each function does in the program.
