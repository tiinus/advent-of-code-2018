require 'pp'

input = File.read("input.txt")
freq_changes = input
  .split("\n")
  .map(&:to_i)
current_index = 0
current_freq = 0
tested_freq = []
found = false

until found
  tested_freq << current_freq
  current_freq += freq_changes[current_index]
  found = tested_freq.include? current_freq

  if current_index == freq_changes.length - 1
    current_index = 0
  else
    current_index += 1
  end
end

pp current_freq
