require 'pp'

input = File.read("input.txt")
rows = input.split("\n")
claims = []
rows.each do |row|
  # example row: #1349 @ 869,323: 14x21
  claims << row.scan(/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/)[0]
end
claims = claims.map { |claim| { 
  id: claim[0].to_i,
  pos_x: claim[1].to_i,
  pos_y: claim[2].to_i, 
  size_x: claim[3].to_i, 
  size_y: claim[4].to_i } }

fabric = Hash.new(0)

claims.each do |claim|
  (claim[:pos_x]..(claim[:pos_x] + claim[:size_x] - 1)).each do |mark_x| 
    (claim[:pos_y]..(claim[:pos_y] + claim[:size_y] - 1)).each do |mark_y| 
      fabric[{pos_x: mark_x, pos_y: mark_y}] += 1
    end
  end
end

pp fabric.values.select { |a| a > 1 }.length

fabric = Hash.new(0)

possible = []
claims.each do |claim|
  possible << claim[:id]
end

claims.each do |claim|
  (claim[:pos_x]..(claim[:pos_x] + claim[:size_x] - 1)).each do |mark_x| 
    (claim[:pos_y]..(claim[:pos_y] + claim[:size_y] - 1)).each do |mark_y| 
      pos_xy = {pos_x: mark_x, pos_y: mark_y}
      id_at_position = fabric[pos_xy] 
      fabric[pos_xy] = claim[:id]
      

      if id_at_position > 0 
        possible.delete(id_at_position)
        possible.delete(claim[:id]) 
      end

    end
  end
end

pp possible