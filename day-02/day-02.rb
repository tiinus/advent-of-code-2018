require 'pp'

input = File.read("input.txt")
box_ids = input.split("\n")
count_two = 0
count_three = 0

box_ids.each do |tag|
  tag = tag
    .chars
    .group_by(&:itself)
    .map { |letter, list| [letter, list.count] }

  count_two += 1 unless tag.select { |a| a[1] == 2 }.empty?
  count_three += 1 unless tag.select { |a| a[1] == 3 }.empty?
end

pp count_two * count_three

box_ids.each_with_index do |id_1, i|
  box_ids.drop(i).each do |id_2|
    count_differ_index = []
    id_1.chars.each_with_index do |c, c_i|
      count_differ_index << c_i if c != id_2[c_i]
    end

    if count_differ_index.length == 1
      id_1_chars = id_1.chars.to_a
      id_1_chars.delete_at(count_differ_index[0])
      pp id_1_chars.join
      exit
    end
  end
end
