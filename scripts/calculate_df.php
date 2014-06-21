<?php

require_once 'parser.php';

$df = array();
while ($line = fgets(STDIN)) {
    foreach (parse($line) as $term => $freq) {
        if (!isset($df[$term])) $df[$term] = 0;
        ++$df[$term];
    }
}

print implode('', array_map(
    function ($term, $freq) { return "$term $freq\n"; },
    array_keys($df),
    array_values($df)));
