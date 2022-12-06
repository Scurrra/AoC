## https://twitter.com/Scurrra/status/1600001723149361152?s=20&t=3rE9DMaAOvqbCVmPuWzCLQ

import std/sets

let signal = readLines("in.txt")[0]

# task 1
var packet_marker = 3
for r in 3..signal.len:
    if toHashSet(cast[seq[char]](signal[(r-4+1)..r])).len == 4:
        packet_marker = r+1
        break
echo "Packet begins at position ", packet_marker

# task 2
var message_marker = 13
for r in 13..signal.len:
    if toHashSet(cast[seq[char]](signal[(r-14+1)..r])).len == 14:
        message_marker = r+1
        break
echo "Message begins at position ", message_marker