cont1 = (ring 60, 62, 63, 65, 67, 67)
cont2 = (ring 60, 62, 63, 65, 67, 68)
cont3 = (ring 60, 62, 63, 65, 67, 70, 67)
counter = 0
counter2 = 30
counter3 = 0
counter4 = 30
pitch_var = 8
detune_var = 0


live_loop :weirdosdetuned do
  with_fx :lpf, cutoff:counter2 do
    with_fx :hpf, cutoff:counter3 do
      use_synth :chipbass
      if (detune_var != 0)
        play cont3[counter]+pitch_var+detune_var, amp: 0.05
        counter = (inc counter)
        counter2 = (inc counter2)
        counter3 = (inc counter3)
        if (counter2 > 129)
          counter2 = choose ([60, 70, 80])
        end
        if (counter3 > 65)
          counter3 = 0
        end
      end
      sleep 0.2
    end
  end
end


live_loop :weirdos do
  with_fx :lpf, cutoff:counter2 do
    with_fx :hpf, cutoff:counter3 do
      use_synth :chipbass
      play cont3[counter]+pitch_var, amp: 0.1
      counter = (inc counter)
      counter2 = (inc counter2)
      counter3 = (inc counter3)
      if (counter2 > 129)
        counter2 = choose ([60, 70, 110])
      end
      if (counter3 > 65)
        counter3 = 0
      end
      sleep 0.2
    end
  end
end

live_loop :secsynth do
  use_synth :pulse
  with_fx :lpf, cutoff: counter4 do
    with_fx :pitch_shift, pitch: choose([0,-12]) do
      play cont1[counter]+pitch_var, amp: 0.05
    end
  end
  counter4 = (dec counter4)
  if (counter4 < 60)
    counter4 = choose([100, 90, 70])
  end
  sleep 0.2
end

live_loop :drummo do
  sample :bd_boom
  sleep 1
  3.times do
    sample :bd_pure
    sleep 1
  end
end