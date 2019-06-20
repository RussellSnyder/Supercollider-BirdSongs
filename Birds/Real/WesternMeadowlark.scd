// ============================
// ==== Western Meadowlark ====
// ============================

/*
(define (b-western-meadowlark beg)
  "(western-meadowlark beg) produces a western meadowlark call at time 'beg'"
  (let ((no-skw '(.00 .00 1.00 .0))
	(down-skw '(.00 1.00 .40 .40 1.00 .0))
	(fas-down '(.00 1.00 1.00 .0)))
    (set! beg (- beg .8))
    (bigbird (+ beg .800) .1 2010.000 0.000 .100 no-skw main-amp '(1 1 2 .04))
    (bigbird (+ beg 1.100) .15 3000.000 100.000 .110 down-skw main-amp '(1 1 2 .04))
    (bigbird (+ beg 1.300) .25 2000.000 150.000 .200 down-skw main-amp '(1 1 2 .04))
    (bigbird (+ beg 1.650) .15 3010.000 250.000 .110 down-skw main-amp '(1 1 2 .04))
    (bigbird (+ beg 1.850) .10 2200.000 150.000 .110 down-skw main-amp '(1 1 2 .04))
    (bigbird (+ beg 2.000) .10 3200.000 1400.000 .110 fas-down main-amp '(1 1 2 .04))
    (bigbird (+ beg 2.200) .05 2000.000 200.000 .110 fas-down main-amp '(1 1 2 .04))
    (bigbird (+ beg 2.300) .10 1600.000 0.000 .110 fas-down main-amp '(1 1 2 .04))))
*/

(
var loadGlobals = (thisProcess.nowExecutingPath.dirname +/+ "_BillsBirds.scd").load;

var no_skw = [0.00, 0.00, 1.00, 0.0];
var down_skw = [0.00, 1.00, 0.40, 0.40, 1.00, 0.0];
var fas_down = [0.00, 1.00, 1.0, 0.0];
var main_amp = ~main_amp;
var times_bill = [0.8, 1.1, 1.30, 1.65, 1.85, 2, 2.2, 2.3] - 0.8;
var lark_t = times_bill.differentiate;
// get array of durations in between events

var no = Env(~getLevels.value(no_skw),
~getTimes.value(no_skw), 'sine');
var down = Env(~getLevels.value(down_skw),
~getTimes.value(down_skw), 'sine');
var fas = Env(~getLevels.value(fas_down),
~getTimes.value(fas_down), 'sine');

~western_meadowlark = Task({
	Synth("billbigbird",
		[\dur, 0.1, \freq, 2010, \freqskew, 0,
			\amp, 0.1, \freqenv, no, \ampenv, main_amp,
			\partialNumbers, [1, 2],
			\partialAmps, [1, 0.04], \t_gate, 1]);
	lark_t[1].wait;
	Synth("billbigbird",
		[\dur, 0.15, \freq, 3000, \freqskew, 100, \amp, 0.11,
			\freqenv, down, \ampenv, main_amp,
			\partialNumbers, [1, 2],
			\partialAmps, [1, 0.04], \t_gate, 1]);
	lark_t[2].wait;
	Synth("billbigbird",
		[\dur, 0.25, \freq, 2000, \freqskew, 150, \amp, 0.2,
			\freqenv, down, \ampenv, main_amp,
			\partialNumbers, [1, 2],
			\partialAmps, [1, 0.04], \t_gate, 1]);
	lark_t[3].wait;
	Synth("billbigbird",
		[\dur, 0.15, \freq, 3010, \freqskew, 250, \amp, 0.11,
			\freqenv, down, \ampenv, main_amp,
			\partialNumbers, [1, 2],
			\partialAmps, [1, 0.04], \t_gate, 1]);
	lark_t[4].wait;
	Synth("billbigbird",
		[\dur, 0.1, \freq, 2200, \freqskew, 150, \amp, 0.11,
			\freqenv, down, \ampenv, main_amp,
			\partialNumbers, [1, 2],
			\partialAmps, [1, 0.04], \t_gate, 1]);
	lark_t[5].wait;
	Synth("billbigbird",
		[\dur, 0.1, \freq, 3200, \freqskew, 1400, \amp, 0.11,
			\freqenv, fas, \ampenv, main_amp,
			\partialNumbers, [1, 2],
			\partialAmps, [1, 0.04], \t_gate, 1]);
	lark_t[6].wait;
	Synth("billbigbird",
		[\dur, 0.05, \freq, 2000, \freqskew, 200, \amp, 0.11,
			\freqenv, fas, \ampenv, main_amp,
			\partialNumbers, [1, 2],
			\partialAmps, [1, 0.04], \t_gate, 1]);
	lark_t[7].wait;
	Synth("billbigbird",
		[\dur, 0.1, \freq, 1600, \freqskew, 0, \amp, 0.11,
			\freqenv, fas, \ampenv, main_amp,
			\partialNumbers, [1, 2],
			\partialAmps, [1, 0.04], \t_gate, 1]);


});
)

~western_meadowlark.start;