// ============================
// ========= Bobwhite =========
// ============================


/* (define (b-bobwhite beg)
  "(bobwhite beg) produces a bobwhite call at time 'beg'"
  (let ((bobup1 '(.00 .00 .40 1.00 1.00 1.0))
	(bobup2 '(.00 .00 .65 .50 1.00 1.0)))
    (set! beg (- beg .4))
    (bigbird (+ beg .4) .2 1800 200 .1 bobup1 main-amp '(1 1 2 .02))
    (bigbird (+ beg 1) .20 1800 1200 .2 bobup2 main-amp '(1 1 2 .02))))
*/


(
var loadGlobals = (thisProcess.nowExecutingPath.dirname +/+ "_BillsBirds.scd").load;

var bobup1_bill = [0.00, 0.00, 0.40, 1.00, 1.00, 1.0];
var bobup2_bill = [0.00, 0.00, 0.65, 0.50, 1.00, 1.0];
var main_amp = ~main_amp;
var times_bill = [0.4, 1.0];
var king_t = times_bill.differentiate;
// get array of durations in between events

var bobup1 = Env(~getLevels.value(bobup1_bill),
~getTimes.value(bobup1_bill), 'sine');
var bobup2 = Env(~getLevels.value(bobup2_bill),
~getTimes.value(bobup2_bill), 'sine');

~bobwhite_bird = Task({
	Synth("billbigbird",
		[\dur, 0.2, \freq, 1800, \freqskew, 200,
			\amp, 0.1, \freqenv, bobup1, \ampenv, main_amp,
			\partialNumbers, [1, 2],
			\partialAmps, [1, 0.02], \t_gate, 1]);
	0.55.wait;
	Synth("billbigbird",
		[\dur, 0.2, \freq, 1800, \freqskew, 1200, \amp, 0.2,
			\freqenv, bobup2, \ampenv, main_amp,
			\partialNumbers, [1, 2],
			\partialAmps, [1, 0.02], \t_gate, 1]);
});
)

~bobwhite_bird.start;