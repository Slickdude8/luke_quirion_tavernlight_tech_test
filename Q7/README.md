This one I was only able to partially complete in the allotted time. I will still explain my thought process.

Initially, I attempted to use the ModularWindows class, where I was able to make the window pop up using a talk action /jump, and then a button would be clicked.
I realized this method wouldn't work because ModularWindows cannot be resized nor can button locations be changed within.

This led to my research into making a dialogue window. For the purposes of this test, I edited the Quest Log scripts so that I was able to just reload the modules whenever I made changes.
The language used for otui files (I was unable to find a proper name) was very similar to CSS, so with some slight alterations, I was able to get a Jump button to show, where I used math.random to pick a random location on the screen to move to when clicked.

This is where I was a bit stumped, I tried multiple ways to add a pseudo-animation method utlizing delays, and it seems like there is no way to get CSS animations in the otui language either.
My logic would've been I would change the position of the button by setting the right margin, then checking if either it was at the edge of the window, or it was clicked on, and then resetting the right margin.
I was unable to find a way to make an update/tick method where I could decriment those delays.

If I had more time, what I would do is create a full new jump.lua file as well as a jump.otui, I would copy the code that I have now in questlogwindow.otui, that way the quest log functionality wouldn't be hindered, and I would call the jump window using a talk action.
In the jump.lua file, I would attempt to implement my delay function using os.time.