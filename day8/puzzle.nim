## https://twitter.com/Scurrra/status/1600753396301955072?s=20&t=GhUX--HWAbYmWfDL-YCCIA

import std/strformat

let f = open("in.txt")

type
    Direction = enum
        Top, Right, Buttom, Left

var 
    forest : seq[seq[int8]]
    dirs : seq[seq[seq[Direction]]]    # just because
    line : string

while f.readLine(line):
    var 
        forest_line : seq[int8]
        dirs_line : seq[seq[Direction]]
    for d in line:
        forest_line.add(int8(d) - int8('0'))
        dirs_line.add(@[])
    forest.add(forest_line)
    dirs.add(dirs_line)
    
var 
    k = 0
    visible = 2 * (forest.len() + forest[0].len() - 2) 
    max_scenic_score = 0
for i in 1..forest.len()-2:
    for j in 1..forest[i].len()-2:
        var score : array[4, int]
        # Top
        k = i - 1
        while k >= 0 and forest[i][j] > forest[k][j]:  k-=1
        if k+1 == 0:  
            dirs[i][j].add(Top)
            k += 1
        score[0] = i - k
        # Buttom
        k = i + 1
        while k < forest.len() and forest[i][j] > forest[k][j]:  k+=1
        if k-1 == forest.len()-1: 
            dirs[i][j].add(Buttom)
            k -= 1
        score[1] = k - i
        # Left
        k = j - 1
        while k >= 0 and forest[i][j] > forest[i][k]:  k-=1
        if k+1 == 0:  
            dirs[i][j].add(Left)
            k += 1
        score[2] = j - k
        # Right
        k = j + 1
        while k < forest[i].len() and forest[i][j] > forest[i][k]:  k+=1
        if k-1 == forest[i].len()-1: 
            dirs[i][j].add(Right)
            k -= 1
        score[3] = k - j
        
        if dirs[i][j].len() != 0:   visible+=1
        if (let scenic_score = score[0] * score[1] * score[2] * score[3];
                scenic_score > max_scenic_score):
                    max_scenic_score = scenic_score
        # echo "({i}, {j}) :  {dirs[i][j]}".fmt 

# task 1
echo "Visible trees : {visible}".fmt

# task 2
echo "Max scenic score : {max_scenic_score}".fmt