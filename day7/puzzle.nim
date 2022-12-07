## https://twitter.com/Scurrra/status/1600607473488039943?s=20&t=-NkPvwGOvlCoaDWM5gQTEg

import std/strutils
import std/sets
import stacks
from std/algorithm import sort, Ascending
from std/math import sum

type
    Directory = ref object
        id : int
        name : string
        parent : Directory
        children : seq[Directory]
        weight : int

let f = open("in.txt")

var
    tree = Directory(name : "/", parent : nil, weight : 0, id : 0)
    line : string
    node = tree
    id = 1

discard f.readLine(line)
while f.readLine(line):
    var args = line.split(' ')
    if args[0] == "$":
        if args[1] == "ls": 
            continue
        elif args[2] == "..":
            node = node.parent
            node.weight += node.children[^1].weight
        else: 
            node.children.add(Directory(name : args[2], parent : node, weight : 0, id : id))
            id += 1
            node = node.children[^1]
    elif args[0] != "dir":
        node.weight += args[0].parseInt()
while node.parent != nil:
    node = node.parent
    node.weight += node.children[^1].weight

# task 1
node = tree
var
    shitty_sum = 0
    weights : seq[int]   # it`s actually for the second task
    backlog = Stack[Directory]()
    seen = HashSet[int]()
backlog.push(node)
while not backlog.isEmpty:
    node = backlog.pop()
    weights.add(node.weight)
    if node.weight <= 100000:
        shitty_sum += node.weight        
    if not seen.contains(node.id):
        seen.incl(node.id)
        for dir in node.children:
            backlog.push(dir)
echo "Not an actual used space: ", shitty_sum

# task 2
weights.sort(Ascending)
let 
    unused = 70000000 - tree.weight
    to_be_freed = 30000000 - unused
for i in 0..len(weights)-1:
    if weights[i] >= to_be_freed:# and weights[i+1] >= to_be_freed:
        echo "To be freed : ", weights[i]
        break