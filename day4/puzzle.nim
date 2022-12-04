## https://twitter.com/Scurrra/status/1599308836514320384?s=20&t=6GAX_KWHL28Ho9OiAIoyww

import std/strutils
import std/sets
import std/sequtils

let f = open("in.txt")

var
    pair : string
    total_goofs = 0
    partial_goofs = 0

while f.readLine(pair):
    let data = pair.split({',', '-'}).map(
        proc(x: string): int = parseInt(x)
    )
    let 
        elf1 = toHashSet(toSeq(data[0]..data[1]))
        elf2 = toHashSet(toSeq(data[2]..data[3]))
    if (elf1 <= elf2 or elf2 <= elf1): 
        total_goofs += 1 
    if len(elf1 * elf2) != 0:
        partial_goofs += 1

# task 1
echo "Number of total goofs: ", total_goofs

# task 1
echo "Number of partial goofs: ", partial_goofs