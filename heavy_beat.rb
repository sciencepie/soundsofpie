

live_loop :fivequbeat do
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

live_loop :weirdos do
  use_synth :dtri
  
  sleep 1
end