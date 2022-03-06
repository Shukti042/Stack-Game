# Stack Game

Added a background for the game in the form of a grid. The grid "cell" is 90 pixels in size in both dimensions when the screen is 1280x720.The screen is not adjustable, it only works for 1280x720.

4 squares in a vertical stack move back and forth. They move as one and when any of them hit the edge of the window, all of them change direction. . Squares have a black border and are of orange color.

When the player hits the space key, the currently moving stack freezes and a new stack will appear just to the right of the frozen one. If the user stops the stack when it is not lined up with the previous stack, only the overlapping part should survive and be frozen. When the next stack is created, it is shorter to match the overlapping part. Because the squares move in steps,there will always be a whole number of squares overlapping, not partial squares. When the overlapping part is down to zero, the game is over. If the user successfully gets to the right hand side of the screen, they have won.

### Language Used

- Processing
