// ============================
// ===== ORCHARD ORIOLE =======
// ============================
(
var loadGlobals = (thisProcess.nowExecutingPath.dirname +/+ "_BillsBirds.scd").load;

var oriup, oriup_bill = [0, 0, 1, 1,];
var oridwn, oridwn_bill = [0, 1, 1, 0];
var oriupdwna, oriupdwna_bill = [0, 0, 0.6, 1, 1, 0.6];
var oriupdwnb, oriupdwnb_bill = [0, 0.5, 0.3, 1, 1, 0];
var oribiga, oribiga_bill = [0, 0.9, 0.15, 1, 0.4, 0.3, 0.6, 0.6, 0.85,
0, 1, 0];
var orimid, orimid_bill = [0, 1.00, 0.05, 0.50, 0.10, 1.00, 0.25, 0.00,
0.85, 0.50, 1.00, 0.0];
var oridwnup, oridwnup_bill = [0.00, 0.30, 0.25, 0.00, 1.00, 1.0];
var oriamp, oriamp_bill = [0.00, 0.00, 0.10, 1.00, 1.00, 0.0];
var main_amp = ~main_amp;
var times_bill = [0.38, 0.41, 0.50, 0.65, 0.70, 1, 1.1, 1.3, 1.48, 1.65,
1.7, 1.8, 1.92, 2.2, 2.28, 2.4] - 0.38; // from bill
var ori_t = times_bill.differentiate;


// get array of durations in between events
oriup = Env(~getLevels.value(oriup_bill),
	~getTimes.value(oriup_bill),'sine');
oridwn = Env(~getLevels.value(oridwn_bill),
	~getTimes.value(oridwn_bill), 'sine');
oriupdwna = Env(~getLevels.value(oriupdwna_bill),
	~getTimes.value(oriupdwna_bill), 'sine');
oriupdwnb = Env(~getLevels.value(oriupdwnb_bill),
	~getTimes.value(oriupdwnb_bill), 'sine');
oribiga = Env(~getLevels.value(oribiga_bill),
	~getTimes.value(oribiga_bill), 'sine');
orimid = Env(~getLevels.value(orimid_bill),
	~getTimes.value(orimid_bill), 'sine');
oridwnup = Env(~getLevels.value(oridwnup_bill),
	~getTimes.value(oridwnup_bill), 'sine');
oriamp = Env(~getLevels.value(oriamp_bill),
	~getTimes.value(oriamp_bill), 'sine');

~orchard_oriole = Task({
	Synth("billbird", [\dur, 0.03, \freq, 3700, \freqskew, 100,
		\amp, 0.5, \freqenv, oridwn, \ampenv, main_amp, \t_gate, 1]);
	ori_t[1].wait;
	Synth("billbird", [\dur, 0.05, \freq, 2500, \freqskew,
		1000, \amp, 0.1, \freqenv, oriup, \ampenv, main_amp, \t_gate, 1]);
	ori_t[2].wait;
	Synth("billbigbird", [\dur, 0.1, \freq, 2000, \freqskew,
		800, \amp, 0.2, \freqenv, oriupdwna, \ampenv, main_amp,
		\partialNumbers, [1, 2, 3],
		\partialAmps, [1, 0.2, 0.5], \t_gate, 1]);
	ori_t[3].wait;
	Synth("billbird", [\dur, 0.3, \freq, 3900, \freqskew,
		1200, \amp, 0.1, \freqenv, oridwn, \ampenv, main_amp, \t_gate, 1]);
	ori_t[4].wait;
	Synth("billbigbird", [\dur, 0.21, \freq, 2000,
		\freqskew, 1200, \amp, 0.15, \freqenv, oribiga, \ampenv, main_amp,
		\partialNumbers, [1, 2],
		\partialAmps, [1, 0.05], \t_gate, 1]);
	ori_t[5].wait;
	Synth("billbird", [\dur, 0.05, \freq, 4200, \freqskew,
		1000, \amp, 0.1, \freqenv, oridwn, \ampenv, main_amp, \t_gate, 1]);
	ori_t[6].wait;
	Synth("billbigbird", [\dur, 0.1, \freq, 2000, \freqskew,
		1000, \amp, 0.25, \freqenv, orimid, \ampenv, main_amp,
		\partialNumbers, [1, 2],
		\partialAmps, [1, 0.05], \t_gate, 1]);
	ori_t[7].wait;
	Synth("billbigbird", [\dur, 0.1, \freq, 2000, \freqskew,
		1000, \amp, 0.25, \freqenv, orimid, \ampenv, main_amp,
		\partialNumbers, [1, 2],
		\partialAmps, [1, 0.05], \t_gate, 1]);
	ori_t[8].wait;
	Synth("billbird", [\dur, 0.1, \freq, 2300, \freqskew,
		3200, \amp, 0.1, \freqenv, oriupdwnb, \ampenv, oriamp, \t_gate, 1]);
	ori_t[9].wait;
	Synth("billbird", [\dur, 0.03, \freq, 1800, \freqskew,
		300, \amp, 0.05, \freqenv, oriup, \ampenv, main_amp, \t_gate, 1]);
	ori_t[10].wait;
	Synth("billbird", [\dur, 0.03, \freq, 2200, \freqskew,
		100, \amp, 0.4, \freqenv, oridwn, \ampenv, main_amp, \t_gate, 1]);
	ori_t[11].wait;
	Synth("billbird", [\dur, 0.07, \freq, 2500, \freqskew,
		2000, \amp, 0.15, \freqenv, oriupdwnb, \ampenv, oriamp, \t_gate, 1]);
	ori_t[12].wait;
	Synth("billbigbird", [\dur, 0.2, \freq, 2400,
		\freqskew, 1200, \amp, 0.25, \freqenv, oridwnup, \ampenv, main_amp,
		\partialNumbers, [1, 2],
		\partialAmps, [1, 0.04], \t_gate, 1]);
	ori_t[13].wait;
	Synth("billbird", [\dur, 0.02, \freq, 2200, \freqskew,
		3000, \amp, 0.4, \freqenv, oriup, \ampenv, main_amp, \t_gate, 1]);
	ori_t[14].wait;
	Synth("billbird", [\dur, 0.02, \freq, 2200, \freqskew,
		3000, \amp, 0.4, \freqenv, oriup, \ampenv, main_amp, \t_gate, 1]);
	ori_t[15].wait;
	Synth("billbigbird", [\dur, 0.17, \freq, 2000,
		\freqskew, 1000, \amp, 0.2, \freqenv, oriupdwna, \ampenv, main_amp,
		\partialNumbers, [1, 2],
		\partialAmps, [1, 0.04], \t_gate, 1]);
});

~orchard_oriole.start;
)
