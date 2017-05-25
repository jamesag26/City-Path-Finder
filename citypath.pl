:- use_module(library(lists)).

%Initialized city path and marks gives both path and visited first values 
citypath(X1,Y1,X2,Y2,Maze,Path) :-
	append([[X1,Y1]],[],Path),
	citypath1(X1,Y1,X2,Y2,Maze,Path).

%Moves down one unit along the path
citypath1(X1,Y1,X2,Y2,Maze,Path) :-
	Ytemp is Y1+1,
	%Checks to see if move would cause player to move outside of maze
	length(Maze,N),
	Ytemp =< N,
	%Checks to see if spot is an open space to move
	openspace(X1,Ytemp,Maze),
	%Checks to see if the spot has been visited before
	\+ member([X1,Ytemp],Path),
	%Appends new coordinates to Path
	append(Path,[[X1,Ytemp]],Path2),
	%Finds path from new coordinates to end 
	citypath1(X1,Ytemp,X2,Y2,Maze,Path2).

%Same breakdown as citypath from above:
%Increments/decrements coordinates then checks if the new coordinates are in the maze
%And if those coordinates are an open space or have been visited before
%Moves one unit up the path
citypath1(X1,Y1,X2,Y2,Maze,Path) :-
	Ytemp is Y1-1,
	Ytemp > 0,
	openspace(X1,Ytemp,Maze),
	\+ member([X1,Ytemp],Path),
	append(Path,[[X1,Ytemp]],Path2),
	citypath1(X1,Ytemp,X2,Y2,Maze,Path2).

%Moves one unit left on the path
citypath1(X1,Y1,X2,Y2,Maze,Path) :-
	Xtemp is X1-1,
	Xtemp > 0,
	openspace(Xtemp,Y1,Maze),
	\+ member([Xtemp,Y1],Path),
	append(Path,[[Xtemp,Y1]],Path2),
	citypath1(Xtemp,Y1,X2,Y2,Maze,Path2).

%Moves one unit right on the path
citypath1(X1,Y1,X2,Y2,[Head|Rest],Path) :-
	Xtemp is X1+1,
	length(Head,N),
	Xtemp =< N,
	openspace(Xtemp,Y1,[Head|Rest]),
	\+ member([Xtemp,Y1],Path),
	append(Path,[[Xtemp,Y1]],Path2),
	citypath1(Xtemp,Y1,X2,Y2,[Head|Rest],Path2).

%When full city path has been traversed
citypath1(X1,Y1,X2,Y2,Maze,Path) :- 
	%Checks to see if final coordinates have been reached
	X1 =:= X2,
	Y1 =:= Y2,
	%Prints length of path and the path itself in reverse order (first coordinate first)
	length(Path,Len),
	write("The path length is "),
	write(Len), nl,
	write("The path is "),
	write(Path).

%Checks if space in Maze is open space
openspace(X,Y,Maze) :-
	%Takes row from list and then checks the corresponding space 
	nth1(Y,Maze,Row),
	nth1(X,Row,0).