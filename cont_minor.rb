pitch = -2
melody1 = ring(60, 67, 62, 68, 63, 70, 65, 72)


# TEST RINGS GENERAL HARMONY
cont_major = ring(60, 62, 64, 65, 67, 69, 71, 72)
cont_minor = ring(60, 62, 63, 65, 67, 68, 70, 72)
counter1 = 0

live_loop :beat do
  sample :bd_klub
  sleep 0.5
end

live_loop :cont_tone do
  with_fx :reverb, mix: 0.7 do
    val = choose([1, 0.5, 0.4, 0.2, 0.1])
    start = choose([0.3, 0.4, 0.7, 0.5, 0.2])
    finish = choose([0.1, 0.4, 0.5, 0.6, 0.7])
    sample :drum_bass_hard, start: start,finish: finish, beat_stretch: val, pan: choose([0.2, -0.2, 0.5, -0.1]), amp: 0.4
    sample :drum_bass_hard, start: finish, finish: start, beat_stretch: val,amp: 0.3
    sleep val*0.5
    sample :drum_bass_hard, start: start,finish: finish, beat_stretch: val, pan: choose([0.2, -0.2, 0.5, -0.1]), amp: 0.4
    
    sleep val*0.5
  end
end

live_loop :melody do
  use_synth :subpulse
  play melody1[counter1]+pitch+choose([0,12,-12]), amp: 0.2, pan: -0.3
  use_synth :blade
  play melody1[counter1]+pitch, amp: 0.1, pan: 0.3
  counter1 = (inc counter1)
  
  sleep 0.25
end