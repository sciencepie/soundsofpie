live_loop :drum do
  3.times do
    sample :bd_klub
    sleep 0.9
    sample :bd_808
    sleep 0.1
  end
  sample :bd_klub, pitch: -0.2, pan: choose([-0.1, 0, 0.1])
  sleep 0.4
  sample :elec_snare, amp: 0.3
  sleep 0.2
  sample :tab
  sleep 0.3
  sample :bd_808, pitch:-0.2
  sleep 0.1
  
end

live_loop :rand_bt do
  with_fx :reverb do
    sample :tabla_ghe8, amp: 0.1, pan: choose([0.3, -0.2, -0.3, 0.2])
  end
  3.times do
    4.times do
      sample :tabla_ghe1, amp: choose([0.05, 0.01, 0.09]), pitch: choose([0, -2, -5, 2,10])
      sleep 0.1
    end
    sleep 0.09
  end
end

live_loop :chords do
  3.times do
    use_synth :blade
    with_fx :lpf, cutoff: 60 do
      with_fx :wobble, phase:0.2 do
        with_fx :echo, amp: 1.2, decay:3 do
          play_chord [60, 64, 65], amp:0.2
          sleep 4
          play_chord [60, 63, 65], amp:0.2
          sleep 4
          play_chord [58, 62, 63], amp:0.2
          sleep 4
          play_chord [58, 61, 63], amp:0.2
          sleep 4
        end
      end
    end
  end
  1.times do
    use_synth :blade
    with_fx :lpf, cutoff: 60 do
      with_fx :wobble, phase:0.2 do
        with_fx :echo, amp: 1.2, decay:3 do
          play_chord [60, 64, 65], amp:0.2
          sleep 4
          #6.times do
          #  play_chord [60, 63, choose([65, 67, 69, 71])], amp:0.2
          #  sleep 0.5
          #end
          sleep 4
          play_chord [58, 62, 63], amp:0.2
          sleep 4
          play_chord [55, 58, 60], amp:0.2
          sleep 4
        end
      end
    end
  end
end

live_loop :fat_beat do
  with_fx :reverb do
    with_fx :lpf, cutoff: 50 do
      sample :bd_zum, amp: 0.5, beat_stretch: 0.5
    end
  end
  sleep 4
end

live_loop :melody do
  with_fx :flanger, depth: 10 do
    sample :ambi_glass_rub, amp: 0.2, beat_stretch: 8, pitch: 1.5, pan: -0.2
  end
  with_fx :panslicer, phase:0.1 do
    with_fx :bitcrusher, bits:16  do
      sample :ambi_soft_buzz, amp: 0.3, pitch: -12
    end
  end
  sleep choose([4,8])
  with_fx :flanger, depth: 10 do
    sample :ambi_glass_rub, amp: 0.2, beat_stretch: 8, pitch: 4.8, pan: -0.2
  end
  sleep choose([4,8])
end

live_loop :swoosh do
  sample :ambi_swoosh, amp: 0.6, beat_stretch:5, pitch: choose([10, 12, 14, 15, 16])
  sleep 4
end