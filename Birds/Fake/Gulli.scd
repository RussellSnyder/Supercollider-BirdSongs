// Gulli
(
{
	    var env = Env(Rand(0.7,1.0)*[0.0, 0.5, 0.0, 1.0, 0.9, 0.0, 0.1, 0.0, 0.1, 0.0, 0.1, 0.0], (1*[0.25, 0.01, 0.21, 1.0, 0.5, 0.2, 0.2, 0.2, 0.2, 0.2, 2.0]), [-4, 0, 3, 2, -20]);
    var envgen = EnvGen.ar(env, doneAction: 2);
     SinOscFB.ar(
        envgen * 1000 + 640, 0.6, 2
    ) * envgen * 0.1
}.play
);
