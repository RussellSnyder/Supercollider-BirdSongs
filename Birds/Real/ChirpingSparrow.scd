// ============================
// ===== CHIPPING SPARROW =====
// ============================
(
var loadGlobals = (thisProcess.nowExecutingPath.dirname +/+ "_BillsBirds.scd").load;

var chipup = [0, 0.8, 0.15, 1, 0.75, 0.3, 1, 0];
// original chip-up freq-envelope from bill
var freqenv = Env(~getLevels.value(chipup), ~getTimes.value(chipup),
'sine');
~chipping_sparrow = Task({
     17.do({ // do this 17 times
         x = Synth("billbird", [
             \t_gate, 1,
             \amp, 0.05,
             \freqenv, freqenv,
             \freqskew, 2400,
             \freq, 4000,
             \dur, 0.05,
             \ampenv, ~main_amp,
         ]);
         0.05.wait;
     })});
)

~chipping_sparrow.start; // play it!