<?php

require_once 'parser.php';

$line = fgets(STDIN);
$base = parse($line);

while ($line = fgets(STDIN)) {
    $tfidf = parse($line);
    $sum = 0;
    foreach ($tfidf as $term => $freq) {
        $sum += isset($base[$term]) ? $base[$term] * $freq : 0;
    }
    print $sum . "\n";
}
