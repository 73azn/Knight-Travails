#static board 
$board = [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7], [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7], [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7], [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7]]


#get the knight moves

def knight_possible_moves(pos)
  #default movments
  top_r1 = [pos[0]+1,pos[1]+2]
  top_r2 = [pos[0]+2,pos[1]+1]
  top_l1 = [pos[0]-1,pos[1]+2]
  top_l2 = [pos[0]-2,pos[1]+1]
  down_r1 = [pos[0]+1,pos[1]-2]
  down_r2 = [pos[0]+2,pos[1]-1]
  down_l1 = [pos[0]-1,pos[1]-2]
  down_l2 = [pos[0]-2,pos[1]-1]
  moves = [top_r1,top_r2,top_l1,top_l2,down_r1,down_r2,down_l1,down_l2]
  #filter the outside of the board
  moves = moves.filter {|pos| $board.include?(pos)}
  return moves
end

#check the shortest path
def shortest_path(from,to)

#queue to check in each position 
queue = Queue.new

#push the current with path 
queue.push([from,[from]])
# it will traverse until reach the desiered position
until queue.empty?
    #take the current pos and the path that take to this pos
    cur,path = queue.pop()
  
  
    #return the path if it's on the pos
    return path if cur == to

    moves = knight_possible_moves(cur)
    
    #queue every movment with the path
    queue.push([moves[0] , path+[moves[0]]]) if moves[0]
    queue.push([moves[1] , path+[moves[1]]]) if moves[1]
    queue.push([moves[2] , path+[moves[2]]]) if moves[2]
    queue.push([moves[3] , path+[moves[3]]]) if moves[3]
    queue.push([moves[4] , path+[moves[4]]]) if moves[4]
    queue.push([moves[5] , path+[moves[5]]]) if moves[5]
    queue.push([moves[6] , path+[moves[6]]]) if moves[6]
      
  
end




end

def knight_moves(from,to)
    #get the short path
    path = shortest_path(from,to)

    print "You made it in #{path.length-1} moves!  Here's your Path:\n\n"
    
  path.each {|x,y|
print "\s[#{x},#{y}]\n"
  }
puts ""


end

knight_moves([0,0],[3,3])



