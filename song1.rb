use_bpm 120
live_loop :bassline do
  sample :bd_haus, rate: 1
  sleep 1
end

live_loop :mo_bassline do
  sleep 12
  sample :bd_haus, rate: 0.7
  sleep 0.25
  sample :bd_haus, rate: 0.7
  sleep 0.25
  sample :bd_haus, rate: 0.7
  sleep 0.5
  sample :bd_haus, rate: 0.7
  sleep 0.5
  sample :bd_haus, rate: 0.7
  sleep 0.5
  sample :bd_haus, rate: 0.7
  sleep 1
  sample :bd_haus, rate: 0.7
  sleep 1
end

def dupl(obj, n)
  arr = []
  n.times do
    arr << obj
  end
  arr
end

live_loop :melody do
  (1..4).each do |n|
    melody_notes.ring.each do |note|
      (0..(n-1)).each do |m|
        unless note.nil?
          play (note + m*12), amp:(1-(0.3*m))
        end
      end
      sleep 0.5
    end
  end
end

live_loop :melody_overlay do
  sleep melody_notes.length * 0.25
  melody_overlay_notes.ring.each do |note|
    unless note.nil?
      play (note), amp: 0.5
      sleep 0.5
    end
  end
end

def melody_notes
  [
    60, dupl(nil, 7),
    61, dupl(nil, 7),
    62, dupl(nil, 7),
    63, dupl(nil, 3), 61, dupl(nil, 3)
  ].flatten
end

def melody_overlay_notes
  [
    72, nil, 71, nil, 72, nil, 73, 72,
    dupl(nil, 8),
    72, nil, 71, nil, 72, nil, 73, 72,
    dupl(nil, 8)
  ]
end