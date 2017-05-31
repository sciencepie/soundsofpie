# GLOBAL
speed_const = 0.9
pitch_const = 0

# DRUM BOOLS
basedrum_bool = 0
tocks_bool = 0
reverb_mix = 0.5

# TEST RINGS GENERAL HARMONY
cont_major = ring(60, 62, 64, 65, 67, 69, 71, 72)
cont_minor = ring(60, 62, 63, 65, 67, 68, 70, 72)

# GLASS RUB & DRONE HUM VARIABLES
glassrub_melod = ring(-1, -8, -6)
glass_changerate = 6

# DARK DRONE
mix_slicer = 0
amp_dark = 1

# ROTATING BACKGROUND SYNTHS
cont_melody1 = ring(60, 67, 62, 70, 67, 62)
cont_melody2 = ring(60, 65)
harmony_var1 = ring(3,5,7,9,12)
harmony_var2 = ring(0,8,12)




# INITIALISATION, DO NOT CHANGE
counter = 0
countglass1 = 0
countglass2 = 0



live_loop :brasdrums2 do
  if (basedrum_bool == 1)
    sample :bd_808
  end
  with_fx :lpf, cutoff:40 do
    with_fx :panslicer, mix:0.4 do
      3.times do
        if (tocks_bool == 1)
          sample :tabla_te_ne, amp: 1.5
        end
      end
      sleep 0.2*speed_const
    end
    if (tocks_bool == 1)
      sample :tabla_te_m
    end
    sleep 0.2*speed_const
    2.times do
      if (tocks_bool == 1)
        sample :tabla_te_ne
      end
      sleep 0.1*speed_const
    end
  end
end

live_loop :synth_mel1 do
  with_fx :reverb, mix: reverb_mix do
    use_synth :hollow
    play_chord [cont_melody2[counter]+pitch_const, cont_melody2[counter]+7+pitch_const], amp: 0.3, pan: -0.3
    sleep 0.15*speed_const
    #use_synth :pulse
    play_chord [cont_melody2[counter], cont_melody2[counter]+harmony_var2[counter]], amp: 0.2, pan: 0.3
    counter = (inc counter)
    sleep 0.15*speed_const
  end
end

live_loop :yeahwhattt do
  with_fx :reverb, mix: 0.9 do
    sample :ambi_glass_rub, pitch: glassrub_melod[countglass2], amp:0.2
    sample :ambi_drone, pitch: glassrub_melod[countglass2+1], amp:0.3
    sleep 1
    countglass1 = (inc countglass1)
    if (countglass1 == glass_changerate)
      countglass2 = (inc countglass2)
      countglass1 = 0
    end
  end
end

live_loop :builddarkness do
  with_fx :slicer, phase:0.2, mix: mix_slicer do
    sample :ambi_dark_woosh, beat_stretch: 9, amp: 1*amp_dark
    
    sleep 1
  end
end


