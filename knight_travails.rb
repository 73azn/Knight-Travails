$board = [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7], [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7], [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7]]


$kinght = [0,0]

def kinght_possible_moves(pos)
  top_r1 = [pos[0]+1,pos[1]+2]
  top_r2 = [pos[0]+2,pos[1]+1]
  top_l1 = [pos[0]-1,pos[1]+2]
  top_l2 = [pos[0]-2,pos[1]+1]
  down_r1 = [pos[0]+1,pos[1]-2]
  down_r2 = [pos[0]+2,pos[1]-1]
  down_l1 = [pos[0]-1,pos[1]-2]
  down_l2 = [pos[0]-2,pos[1]-1]
  moves = [top_r1,top_r2,top_l1,top_l2,down_r1,down_r2,down_l1,down_l2]

  moves = moves.filter {|pos| $board.include?(pos)}
  return moves
end

def valid_move(pos,to)

  moves = kinght_possible_moves(pos)


  
   
  return moves.include?(to)
end

def shortest_path(from,to)

queue = Queue.new
queue.push([from,[from],0])

while !queue.empty?
  
  cur,path = queue.pop()
  
  moves = kinght_possible_moves(cur)
  return path if cur == to
            
  
    queue.push([moves[0] , path+[moves[0]]]) if moves[0]
    queue.push([moves[1] , path+[moves[1]]]) if moves[1]
    queue.push([moves[2] , path+[moves[2]]]) if moves[2]
    queue.push([moves[3] , path+[moves[3]]]) if moves[3]
    queue.push([moves[4] , path+[moves[4]]]) if moves[4]
    queue.push([moves[5] , path+[moves[5]]]) if moves[5]
    queue.push([moves[6] , path+[moves[6]]]) if moves[6]
    

   
    
  
end




end

def kinght_move(from,to)
    path = shortest_path(from,to)
    print "You made it in #{path.length-1} moves!  Here's your Path:\n\n"
    
  path.each {|x,y|
print "\s[#{x},#{y}]\n"
}
puts ""


end

kinght_move([7,0],[0,7])


