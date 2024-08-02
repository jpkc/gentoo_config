#!/bin/bash

mkdir ../06MB
find . -size +6M -exec mv {} ../06MB \;

mkdir ../05MB
find . -size +5M -exec mv {} ../05MB \;

mkdir ../04MB
find . -size +4M -exec mv {} ../04MB \;

mkdir ../03MB
find . -size +3M -exec mv {} ../03MB \;

mkdir ../02MB
find . -size +2M -exec mv {} ../02MB \;

mkdir ../01MB
find . -size +1M -exec mv {} ../01MB \;

mkdir ../768kB
find . -size +768 -exec mv {} ../768kB \;

mkdir ../512kB
find . -size +512 -exec mv {} ../512kB \;

mkdir ../256kB
find . -size +256 -exec mv {} ../256kB \;

mkdir ../128kB
find . -size +128 -exec mv {} ../128kB \;

mkdir ../064kB
find . -size +64 -exec mv {} ../064kB \;

mkdir ../032kB
find . -size +32 -exec mv {} ../032kB \;

