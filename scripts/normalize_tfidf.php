<?php

while ($line = fgets(STDIN)) {
    $sum = 0;
    $tfidf = explode(' ', trim($line));
    for ($i = 0; $i < count($tfidf); $i += 2) {
        $sum += pow($tfidf[$i + 1], 2);
    }
    $sum = sqrt($sum);
    for ($i = 0; $i < count($tfidf); $i += 2) {
        printf("%s%s %s", $i == 0 ? "" : " ", $tfidf[$i], $tfidf[$i + 1] / $sum);
    }
    print "\n";
}
