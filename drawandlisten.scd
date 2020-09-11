var w = Window("welcome!", Rect(0, 0, 1000, 1000)).front; //create and open a window
//w.onClose = {s.freeAll};
//next step: full screen window and view sized to user dimensions

var view = UserView(w,Rect(0, 0, 1000, 1000)); //create a view to draw on– it takes up whole window
view.background = Color.rand; //initialize background w random color

view.mouseDownAction = {CmdPeriod.run};

//b = button(w,Rect(20, 20, 340, 30));
//view.keyDownAction = {view.background = Color.rand}; // update color randomly with any key press
view.keyDownAction = { // when a key is pressed:
	view.background = Color.rand; //update the background color randomly
	{SinOsc.ar(MouseX.kr(minval: rrand(100,500), maxval: rrand(500,2000), warp: 0, lag: 0.2), 0, 0.2)}.play; //create a new randomized sound scale based on mouse X position
 	{SinOsc.ar(MouseY.kr(minval: rrand(100,500), maxval: rrand(500,2000), warp: 0, lag: 0.2), 0, 0.2) }.play; //create a new randomized sound scale based on mouse Y position

};