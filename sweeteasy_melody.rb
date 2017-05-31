live_loop :kickassbeat do
  sample :bd_fat
  
  with_fx :lpf, cutoff: 45 do
    3.times do
      sleep 0.1
      sample :bd_sone, amp: 0.2
      sleep 0.15
      sample :bd_gas, amp: 0.2
    end
  end
  sample :bd_fat
  
  with_fx :lpf, cutoff: 45 do
    5.times do
      sleep 0.1
      sample :bd_sone, amp: 0.2
      sleep 0.15
      sample :bd_gas, amp: 0.2
    end
  end
  sleep 0
end

#cont_major = ring(60, 62, 64, 65, 67, 69, 71, 72)
#cont_minor = ring(60, 62, 63, 65, 67, 68, 70, 72)
# 48, 50, 52, 53, 55, 57, 59, 60
# 58, 50, 51, 53, 55, 56, 58, 60
live_loop :melody do
  use_synth :sine
  with_fx :reverb do
    with_fx :echo do
      2.times do
        play 60
        play 65
        play 68
        sleep 1
        play 56
        play 60
        play 63
        sleep 2
        play 52
        play 55
        play 60
        sleep 1
        
      end
    end
    play 60
    play 65
    play 69
    sleep 1
    play 56
    play 60
    play 65
    sleep 2
    play 63
    play 55
    play 60
    sleep 1
  end
end

