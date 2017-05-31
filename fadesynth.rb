# GENERAL
pitch_const = 0
speed = 0.9

# RING
cont_major = ring(60, 62, 64, 65, 67, 69, 71, 72)
cont_minor = ring(60, 62, 63, 65, 67, 68, 70, 72)
melody1 = ring(60, 65, 60, 67, 60, 60, 60, 72,60, 65, 60, 67, 60, 60, 58, 72,60, 65, 60, 67, 60, 60, 56, 72, 60, 65, 60, 67, 60, 60, 58, 72)
melody2 = ring(60, 60, 60, 60, 60, 56, 60, 60, 60, 60, 60, 60, 60, 60, 56, 60, 60, 60, 60, 60, 60, 60, 60, 58, 60, 60, 60)

# MELODY LOOP
bool_changesynth = 1

# INITIALISATION
count_melody = 0
count_synthchange = 0
if (bool_changesynth == 0)
  count_synthchange = 100
end

live_loop :melody do
  use_synth :sine
  play melody1[count_melody], amp: 0.01*count_synthchange
  use_synth :bnoise
  play melody1[count_melody], amp: 1-(0.01*count_synthchange)
  count_melody = (inc count_melody)
  if(bool_changesynth == 1)
    if(count_synthchange < 100)
      count_synthchange = (inc count_synthchange)
    end
  end
  if(bool_changesynth == 0)
    if(count_synthchange > 0)
      count_synthchange = (dec count_synthchange)
    end
  end
  sleep 0.125*speed
end

live_loop :tok_beat do
  sleep 1*speed
  #sample :bd_haus
  sleep 4*speed
  
end