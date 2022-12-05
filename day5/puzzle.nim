## https://twitter.com/Scurrra/status/1599679220686344192?s=20&t=HXlmy-3ppf69SobrOohAGw

import stacks
import std/strutils

let 
    f = open("in.txt")
    cargos_str = readLines("in.txt", 8)

# stacks construction
var 
    cargos9000 : array[1..9, Stack[char]] = [
        Stack[char](), 
        Stack[char](), 
        Stack[char](), 
        Stack[char](), 
        Stack[char](), 
        Stack[char](), 
        Stack[char](), 
        Stack[char](), 
        Stack[char]()
    ]
for i in 1..cargos_str.len():
    for c in 1..9:
        if (let cargo = cargos_str[cargos_str.len()-i][1 + 4*(c-1)]; cargo!=' '):
            cargos9000[c].push(cargo)    
var cargos9001 = cargos9000

var cmd : string
while f.readLine(cmd):
    if (cmd.len == 0 or cmd.len == 35):
        continue
    let 
        cmd_split = cmd.split(' ')
        cmd_quantity =  cmd_split[1].parseInt()
        cmd_from     =  cmd_split[3].parseInt()
        cmd_to       =  cmd_split[5].parseInt()
    
    var buffer = Stack[char]()
    for i in 1..cmd_quantity:
        buffer.push(
            cargos9001[cmd_from].pop()
        )
        cargos9000[cmd_to].push(
            cargos9000[cmd_from].pop()
        )
    for i in 1..cmd_quantity:
        cargos9001[cmd_to].push(
            buffer.pop()
        )
    
var 
    res9000 : string
    res9001 : string
for i in 1..9:
    res9000.add(cargos9000[i].peek())
    res9001.add(cargos9001[i].peek())

# task 1
echo "CraneMover 9000 result: ", res9000
# task 2
echo "CraneMover 9001 result: ", res9001