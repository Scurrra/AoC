## https://twitter.com/Scurrra/status/1598957129473282048?s=20&t=atzm3V5BHrYafOCc39TTWQ

import std/sets
import std/sequtils

let f = readLines("in.txt", 300)
    
var
    score = 0
    label = 0
    cost = zip(
        concat(toSeq('a'..'z'), toSeq('A'..'Z')), 
        toSeq(1..52)
    )

# task 1
for rucksack in f:
    let intersect = toSeq(intersection(
        toHashSet(
            cast[seq[char]](rucksack[0..(rucksack.len() div 2 - 1)])
        ), toHashSet(
            cast[seq[char]](rucksack[(rucksack.len() div 2)..^1])
    )))[0]
    score += cost.filter(proc(p: (char, int)): bool = p[0] == intersect)[0][1]
echo "Score: ", score

# task 2
for i in 0..299:
    if i mod 3 != 0:    continue
    let intersect = toSeq(intersection(
        intersection(
            toHashSet(
                cast[seq[char]](f[i])
            ), toHashSet(
                cast[seq[char]](f[i+1])
        )), toHashSet(
            cast[seq[char]](f[i+2])
    )))[0]
    label += cost.filter(proc(p: (char, int)): bool = p[0] == intersect)[0][1]
echo "Group sum: ", label