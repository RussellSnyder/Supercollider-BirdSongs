// ============================
// ===== Great Horned Owl =====
// ============================

/*
(define (b-great-horned-owl beg)
  "(great-horned-owl beg) produces a great horned owl call at time 'beg'"
  (let ((owlup '(.00 .00 .30 1.00 1.00 1.0))
	(owldown '(.00 1.00 1.00 .0)))
    (set! beg (- beg .3))
    (bigbird (+ beg .3) .1 300 0 .1 main-amp main-amp '(1 1 3 .02 7 .01))
    (bigbird (+ beg .6) .4 293 6 .1 owldown main-amp '(1 1 3 .02 7 .01))
    (bigbird (+ beg 1.75) .35 293 7 .1 owlup main-amp '(1 1 3 .02 7 .01))
    (bigbird (+ beg 2.5) .2 300 0 .1 owlup main-amp '(1 1 3 .02 7 .01))))
*/

(
var loadGlobals = (thisProcess.nowExecutingPath.dirname +/+ "_BillsBirds.scd").load;

var owl_up = [0.00, 0.00, 1.00, 0.0];
var owl_down = [0.00, 1.00, 0.40, 0.40, 1.00, 0.0];
var main_amp = ~main_amp;
var times_bill = [0.3, 0.6, 1.75, 2.5] - 0.3;
var owl_t = times_bill.differentiate;
// get array of durations in between events

var owlup = Env(~getLevels.value(owl_up),
~getTimes.value(owl_up), 'sine');
var owldown = Env(~getLevels.value(owl_down),
~getTimes.value(owl_up), 'sine');

~great_horned_owl = Task({
	Synth("billbigbird",
		[\dur, 0.1, \freq, 300, \freqskew, 0,
			\amp, 0.1, \freqenv, main_amp, \ampenv, main_amp,
			\partialNumbers, [1, 3,7],
			\partialAmps, [1, 0.02, 0.01], \t_gate, 1]);
	owl_t[1].wait;
	Synth("billbigbird",
		[\dur, 0.4, \freq, 293, \freqskew, 6,
			\amp, 0.1, \freqenv, owldown, \ampenv, main_amp,
			\partialNumbers, [1, 3,7],
			\partialAmps, [1, 0.02, 0.01], \t_gate, 1]);
	owl_t[2].wait;
	Synth("billbigbird",
		[\dur, 0.35, \freq, 293, \freqskew, 7,
			\amp, 0.1, \freqenv, owlup, \ampenv, main_amp,
			\partialNumbers, [1, 3,7],
			\partialAmps, [1, 0.02, 0.01], \t_gate, 1]);
	owl_t[3].wait;
	Synth("billbigbird",
		[\dur, 0.2, \freq, 300, \freqskew, 0,
			\amp, 0.1, \freqenv, owlup, \ampenv, main_amp,
			\partialNumbers, [1, 3,7],
			\partialAmps, [1, 0.02, 0.01], \t_gate, 1]);
	});
)

~great_horned_owl.start