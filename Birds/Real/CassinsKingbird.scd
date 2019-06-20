// ============================
// ==== CASSINS KINGBIRD ======
// ============================

/* Original CLM Code
(define (b-cassins-kingbird beg)
  "(cassins-kingbird beg) produces a cassins kingbird call at time 'beg'"
  (let ((kingfirst '(.00 .30 .45 1.00 .90 .10 1.00 .0))
	(kingsecond '(.00 .00 .02 .50 .04 .00 .06 .55 .08 .05 .10 .60 .12 .05 .14 .65 .16 .10 .18 .70 .20 .10 .22 .75 .24 .15 .26 .80 .28 .20 .30 .85 .32 .25 .34 .90 .36 .30 .38 .95 .40 .40 .42 1.00 .44 .50 .46 1.00 .48 .45 .50 1.00 .52 .50 .54 1.00 .56 .40 .58 .95 .60 .40 .62 .90 .64 .40 .66 .85 .68 .35 .70 .80 .72 .30 .74 .75 .76 .25 .78 .70 .80 .20 .82 .65 .84 .10 .86 .60 .88 .00 .90 .55 .92 .00 .94 .50 .96 .00 1.00 .40 )))
    (set! beg (- beg .03))
    (bigbird (+ beg .03) .04 1700 1200 .15 kingfirst main-amp '(1 1 2 .5 3 0 4 .2))
    (bigbird (+ beg .12) .18 1700 900 .25 kingsecond main-amp '(1 1 2 .01 3 0 4 .1))))
*/
(
var loadGlobals = (thisProcess.nowExecutingPath.dirname +/+ "_BillsBirds.scd").load;

var kingfirst_bill = [0.00, 0.30, 0.45, 1.00, 0.90, 0.10, 1.00, 0.0];
var kingsecond_bill = [0.00, 0.00, 0.02, 0.50, 0.04, 0.00, 0.06, 0.55,
0.08, 0.05, 0.10, 0.60, 0.12, 0.05, 0.14, 0.65, 0.16, 0.10, 0.18, 0.70,
0.20, 0.10, 0.22, 0.75, 0.24, 0.15, 0.26, 0.80, 0.28, 0.20, 0.30, 0.85,
0.32, 0.25, 0.34, 0.90, 0.36, 0.30, 0.38, 0.95, 0.40, 0.40, 0.42, 1.00,
0.44, 0.50, 0.46, 1.00, 0.48, 0.45, 0.50, 1.00, 0.52, 0.50, 0.54, 1.00,
0.56, 0.40, 0.58, 0.95, 0.60, 0.40, 0.62, 0.90, 0.64, 0.40, 0.66, 0.85,
0.68, 0.35, 0.70, 0.80, 0.72, 0.30, 0.74, 0.75, 0.76, 0.25, 0.78, 0.70,
0.80, 0.20, 0.82, 0.65, 0.84, 0.10, 0.86, 0.60, 0.88, 0.00, 0.90, 0.55,
0.92, 0.00, 0.94, 0.50, 0.96, 0.00, 1.00, 0.40];
var main_amp = ~main_amp;
var times_bill = [0.3, 0.12];
var king_t = times_bill.differentiate;
// get array of durations in between events

var kingfirst = Env(~getLevels.value(kingfirst_bill),
~getTimes.value(kingfirst_bill), 'sine');
var kingsecond = Env(~getLevels.value(kingsecond_bill),
~getTimes.value(kingsecond_bill), 'sine');

~cassis_kingbird = Task({
	Synth("billbigbird",
		[\dur, 0.04, \freq, 1700, \freqskew, 1200,
			\amp, 0.15, \freqenv, kingfirst, \ampenv, main_amp,
			\partialNumbers, [1, 2, 3, 4],
			\partialAmps, [1, 0.5, 0, 0.2], \t_gate, 1]);
	0.1.wait;
	Synth("billbigbird",
		[\dur, 0.18, \freq, 1780, \freqskew, 800, \amp, 0.25,
			\freqenv, kingsecond, \ampenv, main_amp,
			\partialNumbers, [1, 2, 3, 4],
			\partialAmps, [1, 0.01, 0, 0.1], \t_gate, 1]);
});

// kingsecond.plot;
)

~cassis_kingbird.start;