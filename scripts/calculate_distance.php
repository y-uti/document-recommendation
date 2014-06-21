<?php

require_once 'parser.php';

$line = fgets(STDIN);
$base = parse($line);
$base_terms = array_keys($base);

while ($line = fgets(STDIN)) {
    $tfidf = parse($line);
    $terms = array_unique(array_merge($base_terms, array_keys($tfidf)));
    $sum = 0;
    foreach ($terms as $t) {
        $sum += pow((isset($tfidf[$t]) ? $tfidf[$t] : 0) - (isset($base[$t]) ? $base[$t] : 0), 2);
    }
    print sqrt($sum) . "\n";
}
