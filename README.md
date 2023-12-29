# MatchIt 
A samegame Implemented by Agouazi Lynda & Nour CHAMI & Sahnoune Thilleli.


SameGame is a puzzle game centered around matching tiles. The game board is comprised of a grid featuring colored tiles. 
The objective is to eliminate as many tiles as feasible by choosing groups of neighboring tiles that share the same color.

# Code description 

* Logic (Model): This part is complete

 1. Identification of same-colored blocks.
 2. Removing all this same color neighbors (stack method)
 3. Handling empty spaces by making the upper boxes fall in the empty places .
 4. The Game ends when the board is empty.

* View : for this part We completed the very first and important game View and we are working on linking the changes after updating the board to the game View

# To install
_Note: The repository is currently experiencing issues with the baseline, and we are actively working to resolve them. 
Kindly utilize GitHub cloning in the Pharo environment to load the game. 
We appreciate your understanding. Thank you._

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
These images represent the main interfaces we created : 

![](images/Screenshot%20(725).png) 
![](images/Screenshot%20(724).png) 
![image](https://github.com/Lynag16/MatchIt/assets/95236950/34797db1-f8d0-4726-8ac6-60c960da47fe)
![image](https://github.com/Lynag16/MatchIt/assets/95236950/bf782394-b0b5-4716-8c45-6aa6d12d035e)


