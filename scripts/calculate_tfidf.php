<?php

require_once 'parser.php';

$df = array();
if (($fh = fopen($argv[2], 'r')) !== false) {
    while ($line = fgets($fh)) {
        list($term, $freq) = explode(' ', rtrim($line));
        $df[$term] = $freq;
    }
    fclose($fh);
}

if (($fh = fopen($argv[1], 'r')) !== false) {
    while ($line = fgets($fh)) {
        $tf = parse($line);
        print implode(' ', array_map(
            function ($term, $freq) use ($df) { return "$term " . ($freq / $df[$term]); },
            array_keys($tf),
            array_values($tf))) . "\n";
    }
    fclose($fh);
}
