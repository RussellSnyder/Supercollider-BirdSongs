//Techno Bass-Bird
(
{
	var env = Env([0.0, 0.9, 0.0, 0.5, 0.0, 0.3, 0.0, 0.0, 0.9, 0.0, 0.9, 0.0], (Rand(2.8,3.0)*[0.1, 0.31, 0.1, 0.31, 0.1, 0.31, 0.2, 0.4, 0.1, 0.1, 10.2]), [-4, 0, 3, 2, -20, 6,5,4,-30]);
    var envgen = EnvGen.ar(env, doneAction: 2);
    var hotchickatee = SinOscFB.ar(
        envgen * 1500 + 640, 1.0, 2
	) * envgen * 0.2;
	Mix.fill(1,Formlet.ar(hotchickatee, Saw.kr(SinOsc.kr(3.1,0,10,10),300,100), 0.9, 0.5));
}.play
);
