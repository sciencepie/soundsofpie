# DOUBLE RING HARMONY

pitch = -5
melody1 = ring(60, 67, 63, 60, 67, 62, 60, 67, 63)
pitchring = ring(0,12,0,7,5,7,2,7)
melodyring = ring(3,6,9)
chords = ring(5,7,5,5,5,7)
sleepdrums1 = ring(0.2, 0.2, 0.4, 0.1)
sleepdrums2 = ring(0.2, 0.2, 0.1, 0.2)
sleepdrums3 = ring(0.4, 0.2, 0.1, 0.3)
sleepdrums4 = ring(0, 0.2, 0.2, 0.2)
# TEST RINGS GENERAL HARMONY
cont_major = ring(60, 62, 64, 65, 67, 69, 71, 72)
cont_minor = ring(60, 62, 63, 65, 67, 68, 70, 72)

counter1 = 0
counter2 = 0
counter3 = 0
counter4 = 0

live_loop :melody do
  use_synth :sine
  with_fx :echo, phase:0.4, mix: 0.4 do
    play melody1[counter1]+pitchring[counter2], amp: 0.5
  end
  play melody1[counter1]+pitchring[counter2]-12, amp: 0.5 if one_in(2)
  play melody1[counter1]+pitchring[counter2]-chords[counter1], amp: 0.5
  counter1 = (inc counter1)
  counter2 = (inc counter2) if (counter1 == melodyring[counter3])
  counter1 = 0 if (counter1 == melodyring[counter3])
  counter3 = (inc counter3)
  sleep 0.2
end

live_loop :neatbeat do
  sample :drum_bass_hard
  sleep sleepdrums1[counter4]
  sample :elec_blip, beat_stretch: choose([0.3,0.4,0.5]) if one_in(2)
  sleep sleepdrums2[counter4]
  sample :elec_blip2 if one_in(2)
  sleep sleepdrums3[counter4]
  sample :elec_blup, beat_stretch: 0.5
  sleep sleepdrums4[counter4]
  counter4 = (inc counter4)
end

