// ============================
// = scissor-tailed flycatcher=
// ============================

/*
(define (b-scissor-tailed-flycatcher beg)
  "(scissor-tailed-flycatcher beg) produces a scissor-tailed flycatcher call at time 'beg'"
  (let ((scissor '(.00 .00 .40 1.00 .60 1.00 1.00 .0)))
    (bigbird beg .05 1800 1800 .2 scissor main-amp '(1 .5 2 1 3 .5 4 .1 5 .01))))
*/

(
var loadGlobals = (thisProcess.nowExecutingPath.dirname +/+ "_BillsBirds.scd").load;

var scissor = [0, 0, 0.4, 1, 0.6, 1, 1, 0];
var freqenv = Env(~getLevels.value(scissor), ~getTimes.value(scissor),
'sine');
var main_amp = ~main_amp;
~scissor_tailed_flycatcher = Task({
	Synth("billbird",
		[\dur, 0.05, \freq, 1800, \freqskew, 1800, \amp, 0.2,
			\freqenv, freqenv, \ampenv, main_amp,
			\partialNumbers, [1,2,3,4,5],
			\partialAmps, [0.5,1,0.5,0.1,0.01], \t_gate, 1]);
});
)

~scissor_tailed_flycatcher.start;