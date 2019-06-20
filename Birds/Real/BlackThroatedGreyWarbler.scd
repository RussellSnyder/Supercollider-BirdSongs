// KINDA BROKEN :'-(

// ===================================
// === Black-Throated-Grey-Warbler ===
// ===================================

/*
(define (b-black-throated-gray-warbler beg)
  "(black-throated-gray-warbler beg) produces a black throated gray warbler call at time 'beg'"
  (let ((grayone '(.00 .50 .02 .60 .04 .45 .06 .62 .08 .40 .10 .65 .12 .35 .14 .70 .18 .30 .20 .70 .22 .30 .24 .70 .25 .20 .30 .80 .35 .10 .40 .90 .45 .00 .50 1.00 .55 .00 .60 1.00 .65 .00 .70 1.00 .75 .00 .80 1.00 .85 .00 .90 1.00 .95 .00 1.00 .50 ))
	(graytwo '(.00 .00 .01 .40 .02 .00 .03 .40 .04 .00 .05 .40 .06 .00 .07 .40 .08 .00 .09 .40 .10 .00 .25 .80 .40 .30 .55 1.00 .70 .00 .85 .80 1.00 .40 ))
	(graythree '(.00 1.00 .01 .60 .02 1.00 .03 .60 .04 1.00 .05 .60 .06 1.00 .07 .60 .08 1.00 .09 .60 .10 1.00 .11 .60 .12 1.00 .13 .60 .14 1.00 .15 .60 .16 1.00 .17 .60 .18 1.00 .19 .60 .20 1.00 .21 .55 .22 1.00 .23 .50 .24 1.00 .25 .50 .26 1.00 .27 .50 .28 1.00 .29 .50 .30 1.00 .31 .50 .32 1.00 .33 .50 .34 1.00 .35 .50 .36 1.00 .37 .50 .38 1.00 .39 .50 .40 1.00 .41 .50 .42 1.00 .43 .50 .44 1.00 .45 .50 .46 1.00 .47 .50 .48 1.00 .49 .50 .50 1.00 .51 .50 .52 1.00 .53 .50 .54 1.00 .55 .50 .56 1.00 .57 .50 .58 1.00 .59 .50 .60 1.00 1.00 .0))
	(grayfour '(.00 .00 1.00 1.0)))
    (bird beg .12 3700 600 .05 grayone main-amp)
    (bird (+ beg .18) .08 3000 800 .07 graytwo main-amp)
    (bird (+ beg .28) .12 3700 600 .12 grayone main-amp)
    (bird (+ beg .44) .08 3000 800 .15 graytwo main-amp)
    (bird (+ beg .54) .12 3700 600 .20 grayone main-amp)
    (bird (+ beg .72) .08 3000 800 .25 graytwo main-amp)
    (bird (+ beg .82) .12 3700 600 .25 grayone main-amp)
    (bird (+ beg .96) .2 3000 2000 .2 graythree main-amp)
    (bird (+ beg 1.2) .02 4500 500 .05 grayfour main-amp)
    (bird (+ beg 1.25) .02 4200 800 .05 grayfour main-amp)
    (bird (+ beg 1.3) .02 4000 900 .05 grayfour main-amp)))
																													*/

(
var loadGlobals = (thisProcess.nowExecutingPath.dirname +/+ "_BillsBirds.scd").load;

var grey_one, grey_one_bill = [0.00, 0.50, 0.02, 0.60, 0.04, 0.45, 0.06, 0.62, 0.08, 0.40,
	0.10, 0.65, 0.12, 0.35, 0.14, 0.70, 0.18, 0.30, 0.2, 0.70,
	0.22, 0.30, 0.24, 0.70, 0.25, 0.20, 0.30, 0.80, 0.35, 0.10,
	0.40, 0.90, 0.45, 0.00, 0.50, 1.00, 0.55, 0.00, 0.60, 1.00,
	0.65, 0.00, 0.70, 1.00, 0.75, 0.00, 0.80, 1.00, 0.85, 0.00,
	0.90, 1.00, 0.95, 0.00, 1.00, 0.50];
var grey_two, grey_two_bill = [0.00, 0.00, 0.01, 0.40, 0.02, 0.00, 0.03, 0.40, 0.04, 0.00,
	0.05, 0.40, 0.06, 0.00, 0.07, 0.40, 0.08, 0.00, 0.09, 0.40,
	0.10, 0.00, 0.25, 0.80, 0.40, 0.30, 0.55, 1.00, 0.70, 0.00,
	0.85, 0.80, 1.00, 0.40];
var grey_three, grey_three_bill = [0.00, 1.00, 0.01, 0.60, 0.02, 1.00, 0.03, 0.60, 0.04, 1.00,
	0.05, 0.60, 0.06, 1.00, 0.07, 0.60, 0.08, 1.00, 0.09, 0.60,
	0.10, 1.00, 0.11, 0.60, 0.12, 1.00, 0.13, 0.60, 0.14, 1.00,
	0.15, 0.60, 0.16, 1.00, 0.17, 0.60, 0.18, 1.00, 0.19, 0.60,
	0.20, 1.00, 0.21, 0.55, 0.22, 1.00, 0.23, 0.50, 0.24, 1.00,
	0.25, 0.50, 0.26, 1.00, 0.27, 0.50, 0.28, 1.00, 0.29, 0.50,
	0.30, 1.00, 0.31, 0.50, 0.32, 1.00, 0.33, 0.50, 0.34, 1.00,
	0.35, 0.50, 0.36, 1.00, 0.37, 0.50, 0.38, 1.00, 0.39, 0.50,
	0.40, 1.00, 0.41, 0.50, 0.42, 1.00, 0.43, 0.50, 0.44, 1.00,
	0.45, 0.50, 0.46, 1.00, 0.47, 0.50, 0.48, 1.00, 0.49, 0.50,
	0.50, 1.00, 0.51, 0.50, 0.52, 1.00, 0.53, 0.50, 0.54, 1.00,
	0.55, 0.50, 0.56, 1.00, 0.57, 0.50, 0.58, 1.00, 0.59, 0.50,
	0.60, 1.00, 1.00, 0.0];
var grey_four, grey_four_bill = [0.00, 0.00, 1.00, 1.0];
var times_bill = [0.18, 0.28, 0.44, 0.54, 0.72, 0.82,
	0.96, 1.20, 1.25, 1.30] - 0.18;
var greywarb_t = times_bill.differentiate;
var main_amp = ~main_amp;
grey_one = Env(~getLevels.value(grey_one_bill),
	~getTimes.value(grey_one_bill), 'sine');
grey_two = Env(~getLevels.value(grey_two_bill),
	~getTimes.value(grey_two_bill), 'sine');
grey_three = Env(~getLevels.value(grey_three_bill),
	~getTimes.value(grey_three_bill), 'sine');
grey_four = Env(~getLevels.value(grey_four_bill),
	~getTimes.value(grey_four_bill), 'sine');
~black_Throated_Grey_Warbler = Task({
	Synth("billbird",
		[\t_gate, 1,\amp, 0.05,\freqenv, grey_one, \freqskew, 600,
			\freq, 3700, \dur, 0.12,\ampenv, main_amp]);
	greywarb_t[1].wait;
	Synth("billbird",
		[\dur, 0.08, \freq, 3000, \freqskew, 800,\t_gate, 1,
			\amp, 0.7, \freqenv, grey_two, \ampenv, main_amp]);
	greywarb_t[2].wait;
	Synth("billbird",
		[\dur, 0.12, \freq, 3700, \freqskew, 600,\t_gate, 1,
			\amp, 0.12, \freqenv, grey_one, \ampenv, main_amp]);
	greywarb_t[3].wait;
	Synth("billbird",
		[\dur, 0.08, \freq, 3000, \freqskew, 800,\t_gate, 1,
			\amp, 0.15, \freqenv, grey_two, \ampenv, main_amp]);
	greywarb_t[4].wait;
	Synth("billbird",
		[\dur, 0.12, \freq, 3700, \freqskew, 600,\t_gate, 1,
			\amp, 0.2, \freqenv, grey_one, \ampenv, main_amp]);
	greywarb_t[5].wait;
	Synth("billbird",
		[\dur, 0.08, \freq, 3000, \freqskew, 800,\t_gate, 1,
			\amp, 0.25, \freqenv, grey_two, \ampenv, main_amp]);
	greywarb_t[6].wait;
	Synth("billbird",
		[\dur, 0.12, \freq, 3700, \freqskew, 600,\t_gate, 1,
			\amp, 0.25, \freqenv, grey_one, \ampenv, main_amp]);
	greywarb_t[7].wait;
	Synth("billbird",
		[\dur, 0.2, \freq, 3000, \freqskew, 2000,\t_gate, 1,
			\amp, 0.2, \freqenv, grey_three, \ampenv, main_amp]);
	greywarb_t[8].wait;
	Synth("billbird",
		[\dur, 0.02, \freq, 4500, \freqskew, 500,\t_gate, 1,
			\amp, 0.05, \freqenv, grey_four, \ampenv, main_amp]);
	greywarb_t[9].wait;
	Synth("billbird",
		[\dur, 0.02, \freq, 4200, \freqskew, 800,\t_gate, 1,
			\amp, 0.05, \freqenv, grey_four, \ampenv, main_amp]);
	greywarb_t[10].wait;
	Synth("billbird",
		[\t_gate, 1,\amp, 0.05, \freqenv, grey_four,\freqskew, 900,
			\freq, 4000,\dur, 0.02, \ampenv, main_amp]);
});
)

~black_Throated_Grey_Warbler.start