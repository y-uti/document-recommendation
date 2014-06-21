<?php

function parse($line)
{
    $tf = array();
    $data = explode(' ', trim($line));
    for ($i = 0; $i < count($data); $i += 2) {
        $tf[$data[$i]] = $data[$i + 1];
    }

    return $tf;
}
