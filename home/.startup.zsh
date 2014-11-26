head -$((${RANDOM} % `wc -l < ~/.inspiration` + 1)) ~/.inspiration | tail -1
