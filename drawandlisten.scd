//first run just the server boot
Server.default.boot; //boot server

//now run the rest all at once & enjoy:)
var view = UserView(w,Rect(0, 0, 10000, 10000)); //create a view to draw on
view.background = Color.rand; // set random background color
view.front; //open the view

t = StaticText(view, Rect(10, 10, 700, 350));//add a message:
t.string = "Hi! to begin, press any key and move your mouse to explore a sonic space.
\n press any key again to add a new layer of sound on top.
\n click once to stop all sound (and dismiss this message)
\n \n some ideas to get you started:
\n close your eyes and move the mouse. what do you hear?
\n try writing your name with the mouse.  what do you hear?
\n try adding tons of layers... how do the sounds evolve?
\n put on music on your computer and play along";


// make the text look not awful
t.background=Color.rand; // set text background color randomly
t.align = \left;
t.font = Font("Helvetica", 20);

view.mouseDownAction = {//on click:
	CmdPeriod.run; //stop all sound
	t.close; //dismiss the message
};
view.keyDownAction = { // when a key is pressed:
	view.background = Color.rand; //update the background color randomly
	{SinOsc.ar(MouseX.kr(minval: rrand(100,500), maxval: rrand(500,2000), warp: 0, lag: 0.2), 0, 0.2)}.play; //create a new randomized sound scale based on mouse X position
 	{SinOsc.ar(MouseY.kr(minval: rrand(100,500), maxval: rrand(500,2000), warp: 0, lag: 0.2), 0, 0.2) }.play; //create a new randomized sound scale based on mouse Y position

};
