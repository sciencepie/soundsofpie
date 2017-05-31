
live_loop :fivequbeat do
  2.times do
    sample :bd_boom
    sleep 1
    sample :bd_808
    sleep 0.5
    sample :bd_808
    sleep 1
    sample :perc_snap
    sleep 0.5
    sample :perc_swash
    sleep 1
    sample :bd_boom
    sleep 0.5
    4.times do
      sample :bd_808, amp: 0.9
      sleep 0.5
    end
    sample :bd_boom
    sleep 0.5
    2.times do
      sample :bd_808, amp: 0.9
      sleep 0.5
    end
  end
  sample :bd_boom
  sleep 1
  sample :bd_808
  sleep 0.25
  sample :bd_808
  sleep 1.25
  sample :perc_snap
  sleep 0.5
  sample :perc_till, start:0.2, finish:0.8, beat_stretch: 2
  sleep 1
  sample :bd_boom
  sleep 0.5
  4.times do
    sample :bd_808, amp: 0.9
    sleep 0.5
  end
  sample :bd_boom
  sleep 0.5
  2.times do
    sample :bd_808, amp: 0.9
    sleep 0.5
  end
end

live_loop :drone do
  with_fx :reverb, room:0.68, mix:0.74 do
    with_fx :lpf, cutoff:70 do
      sample :bass_dnb_f, beat_stretch: 10, start:0.45, finish:0.35, pitch:-5
      sample :bass_dnb_f, beat_stretch: 10, start:0.55, finish:0.65, pitch:-3
      sample :bass_dnb_f, beat_stretch: 10, start:0.6, finish:0.5, pitch:-4
    end
    sample :bd_tek, beat_stretch: 1.2, start: 0.5, finish: 0.1
  end
  sleep 1
end
