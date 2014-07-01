<?php

while ($line = fgets(STDIN)) {
    $tf = array_count_values(explode(' ', rtrim($line)));
    print implode(' ', array_map(
        function ($t, $f) { return "$t $f"; },
        array_keys($tf), array_values($tf))) . "\n";
}
