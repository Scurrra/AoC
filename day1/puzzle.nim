import strutils
from std/algorithm import sort, Descending
from std/math import sum

let
    lines = readLines("in1.txt", 2250)

var
    cals: seq[int] = @[]

# counting calories for each elf
cals.add(0)
for line in lines:
    if line.len() != 0:
        cals[^1] += parseInt(line)
    else:
        cals.add(0)

# puzzle 1
echo "Max calories: ", cals.max()

# puzzle 2
cals.sort(Descending)
echo "Sum of 3 maximal: ", sum(cals[0..2])