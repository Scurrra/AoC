## https://twitter.com/Scurrra/status/1598589410676641792?s=20&t=FOsF9Xc5weJpR4Cvq7PCjg

let 
    f = open("in.txt")
    
var
    round : string
    score = 0
    guide = 0
while f.readLine(round):
    # task 1
    case round[2]
    of 'X': score += 1
    of 'Y': score += 2
    of 'Z': score += 3
    else: score += 0
    
    case round
    of "A X", "B Y", "C Z": score += 3
    of "A Y", "B Z", "C X": score += 6
    else: score += 0

    # task 2
    case round[2]
    of 'X': 
        guide += 0
        case round[0]
        of 'A': guide += 3 # Z
        of 'B': guide += 1 # X
        of 'C': guide += 2 # Y
        else: guide += 0 
    of 'Y': 
        guide += 3
        case round[0]
        of 'A': guide += 1 # X
        of 'B': guide += 2 # Y
        of 'C': guide += 3 # Z
        else: guide += 0 
    of 'Z': 
        guide += 6
        case round[0]
        of 'A': guide += 2 # Y
        of 'B': guide += 3 # Z
        of 'C': guide += 1 # X
        else: guide += 0 
    else: guide += 0
close(f)

echo "Score: ", score
echo "Guided score: ", guide