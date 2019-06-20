// =====================================================
// SYNTHDEFs - 'billbird' and 'billbigbird'
// =====================================================
(
SynthDef("billbird", { arg dur, freq, freqskew, amp, t_gate;
         var freqenv, ampenv, freqenvctl, ampenvctl, sig;
         // make an empty 10 segment envelope
         freqenv = Env.newClear(10);
         ampenv = Env.newClear(10);
         // create a control argument array
         freqenvctl = NamedControl.kr(\freqenv, freqenv.asArray);
         ampenvctl = NamedControl.kr(\ampenv, ampenv.asArray);
         sig = SinOsc.ar(
             EnvGen.kr(freqenvctl, t_gate, freqskew, freq, dur), // freq
             0, // phase
             //    amp);
             EnvGen.kr(ampenvctl, t_gate, amp, timeScale: dur,
doneAction: 2)); // amplitude
         Out.ar(0, sig);
}).add;

SynthDef("billbigbird", { arg dur, freq, freqskew, amp, t_gate;
     var howmany = 20; // hard wire max number of partials
     var pnum = Array.fill(howmany, 0); // partial numbers (zero = 'silent' partials as default);
     var pamp = Array.fill(howmany, 1).normalizeSum; // partial amps
     var pnumctl = NamedControl.kr(\partialNumbers, pnum.asArray);
     var pampctl = NamedControl.kr(\partialAmps, pamp.asArray);
     var freqenv = Env.newClear(51);
     var ampenv = Env.newClear(51);
     var freqenvctl = NamedControl.kr(\freqenv, freqenv.asArray);
     var ampenvctl = NamedControl.kr(\ampenv, ampenv.asArray);
     var sig = DynKlang.ar(`[pnumctl, pampctl, nil],
		// KLANG: partials, amplitudes, phases
		EnvGen.kr(freqenvctl, t_gate, freqskew,freq, dur),
		// KLANG: fundamental frequency
                         0) // KLANG: offset
                         * EnvGen.kr(ampenvctl, t_gate, amp, timeScale:
dur, doneAction: 2); // amplitude envelope

     Out.ar(0, sig);
  }).add;

// =====================================================
// GLOBAL VARS
// =====================================================

~main_amp = Env([0, 1, 0.7, 1, 0], [0.25, 0.35, 0.15, 0.25], 'sine');
~getLevels = {arg array; array.clump(2).flop.at(1)};
~getTimes = {arg array; array.clump(2).flop.at(0).differentiate.drop(1)};
~getPartials = {arg array; array.clump(2).flop.at(0)}; // same as ~getLevels
~getPartialAmps = {arg array; array.clump(2).flop.at(1)};
)
