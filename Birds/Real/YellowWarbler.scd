// ============================
// ===== YELLOW WARBLER =======
// ============================
(
var loadGlobals = (thisProcess.nowExecutingPath.dirname +/+ "_BillsBirds.scd").load;

var yellow_up, yellow_up_bill = [0, 0, 0.6, 1, 1, 0.5];
var yellow_swirl, yellow_swirl_bill = [0, 1, 0.05, 1, 0.6, 0, 0.8, 0.3,
1, 0.1];
var yellow_down, yellow_down_bill = [0, 1, 1, 0];
var yellow_last, yellow_last_bill = [0, 0, 0.3, 0.2, 0.8, 0.7, 1, 1];
var swirl_amp, swirl_amp_bill = [0, 0, 0.9, 1, 1, 0];
var main_amp = ~main_amp;
var times_bill = [0, 0.23, 0.45, 0.62, 0.85, 1.05, 1.15, 1.25, 1.4];
var yel_t = times_bill.differentiate;
yellow_up = Env(~getLevels.value(yellow_up_bill),
~getTimes.value(yellow_up_bill), 'sine');
yellow_swirl = Env(~getLevels.value(yellow_swirl_bill),
~getTimes.value(yellow_swirl_bill), 'sine');
yellow_down = Env(~getLevels.value(yellow_down_bill),
~getTimes.value(yellow_down_bill), 'sine');
yellow_last = Env(~getLevels.value(yellow_last_bill),
~getTimes.value(yellow_last_bill), 'sine');
swirl_amp = Env(~getLevels.value(swirl_amp_bill),
~getTimes.value(swirl_amp_bill), 'sine');

~yellow_warbler = Task({
	Synth("billbird", [\dur, 0.05, \freq, 5600, \freqskew, 400,
		\amp, 0.05, \freqenv, yellow_up,
		\ampenv, main_amp, \t_gate, 1]);
	yel_t[1].wait;
	Synth("billbird", [\dur, 0.12, \freq, 5000, \freqskew,
		1500, \amp, 0.15, \freqenv, yellow_swirl,
		\ampenv, swirl_amp, \t_gate, 1]);
	yel_t[2].wait;
	Synth("billbird", [\dur, 0.13, \freq, 5000, \freqskew,
		1700, \amp, 0.17, \freqenv, yellow_swirl,
		\ampenv, swirl_amp, \t_gate, 1]);
	yel_t[3].wait;
	Synth("billbird", [\dur, 0.16, \freq, 5000, \freqskew,
		2000, \amp, 0.20, \freqenv, yellow_swirl,
		\ampenv, swirl_amp, \t_gate, 1]);
	yel_t[4].wait;
	Synth("billbird", [\dur, 0.15, \freq, 5000, \freqskew,
		2000, \amp, 0.20, \freqenv, yellow_swirl,
		\ampenv, swirl_amp, \t_gate, 1]);
	yel_t[5].wait;
	Synth("billbird", [\dur, 0.075, \freq, 3700,
		\freqskew, 1000, \amp, 0.20, \freqenv, yellow_down,
		\ampenv, main_amp,\t_gate, 1]);
	yel_t[6].wait;
	Synth("billbird", [\dur, 0.075, \freq, 3700,
		\freqskew, 800, \amp, 0.15, \freqenv, yellow_down,
		\ampenv, main_amp,\t_gate, 1]);
	yel_t[7].wait;
	Synth("billbird", [\dur, 0.075, \freq, 3700,
		\freqskew, 800, \amp, 0.15, \freqenv, yellow_down,
		\ampenv, main_amp,\t_gate, 1]);
	yel_t[8].wait;
	Synth("billbird", [\dur, 0.2, \freq, 3700, \freqskew,
		2000, \amp, 0.2, \freqenv, yellow_last,
		\ampenv, swirl_amp, \t_gate, 1]);
});
)

~yellow_warbler.start;

