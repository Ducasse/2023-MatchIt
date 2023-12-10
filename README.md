# MatchIt 
A samegame Implemented by Agouazi Lynda & CHAMI Nour & Sahnoune Thilleli.


SameGame is a puzzle game centered around matching tiles. The game board is comprised of a grid featuring colored tiles. 
The objective is to eliminate as many tiles as feasible by choosing groups of neighboring tiles that share the same color.

_Note: The repository is currently experiencing issues, and we are actively working to resolve them. 
Kindly utilize GitHub cloning in the Pharo environment to load the game. 
We appreciate your understanding. Thank you._
 * We completed the first part for identifying all the same color neighbors using a similar stack method
 * We are working on updating the board (make the upper boxes falls).

If you want to play MatchIt: Copy the code below in your pharo playground:

```smalltalk
Metacello new
    baseline: 'MatchIt';
    repository: 'github.com//Lynag16/MatchIt:main';
    onConflictUseLoaded;
    load.
```
You can open the game to check for interfaces by executing the open method
```smalltalk
MatchIt open
```
These images represent the main inetrfaces we created : 

![](images/Screenshot%20(725).png) 
![](images/Screenshot%20(724).png) 
![image](https://github.com/Lynag16/MatchIt/assets/95236950/34797db1-f8d0-4726-8ac6-60c960da47fe)
![image](https://github.com/Lynag16/MatchIt/assets/95236950/bf782394-b0b5-4716-8c45-6aa6d12d035e)


