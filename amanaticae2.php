<?php
$urltot='http://www.amanitaceae.org/?Genus+Amanita';
$datatot = file_get_contents($urltot);
$regexurl = "/\>\<B\>\<i\>Amanita (.*?)\<\/i\>\<\/B\>\<\/A\>/"; 
preg_match_all($regexurl,$datatot,$list);

$fp = fopen('spec_dict.csv', 'w');

foreach ($list as $fields) {
    fputcsv($fp, $fields);
}

fclose($fp);
?>
