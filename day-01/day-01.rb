require 'pp'

input = File.read("input.txt")
freq_changes = input
  .split("\n")
  .map(&:to_i)

pp freq_changes
  .inject(&:+)
