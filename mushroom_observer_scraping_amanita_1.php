<?php
$urltot='http://mushroomobserver.org/observer/observation_search?page=1&pattern=amanita';
$datatot = file_get_contents($urltot);
$regexrez = "/\<span id=\"timer\"\>\((.+?) results in/"; 
preg_match($regexrez,$datatot,$matchrez);
$iter= floor ($matchrez[1]/18 );
$BIGDATA = [];
$fp = fopen("dataall2.csv", 'w');

for ($j = 1; $j <= $iter; $j++){

$urltot='http://mushroomobserver.org/observer/list_observations?page='.$j.'&pattern=amanita';
$datatot = file_get_contents($urltot);

/*Search obs page*/
$regexobsurl = "/\<h5\>\<a href\=\"\/(.+?)\?q=/"; 
preg_match_all($regexobsurl,$datatot,$matchobsurl);
//var_dump($matchobsurl);



for ($i = 0; $i <= 17; $i++) {
 

$url = 'http://mushroomobserver.org/';
$url .= $matchobsurl[1][$i];

$data = file_get_contents($url);


/* Search observation number */
$regexobs = "/\>Observation (.+?): /"; 
preg_match($regexobs,$data,$matchobs);
//echo $matchobs[1];
$BIGDATA[1][0] = $matchobs[1]; 

/*Species name */
//$regexsp = "/: \<b\>\<i\>(.+?)\<\/i\>\<\/b\> /";
$regexsp = "/: \<b\>\<i\>(.*)\<\/span\>/";
preg_match($regexsp,$data,$matchsp);

//echo $matchsp[1];
$BIGDATA[1][1] = str_replace(array('&#8220','&#8221','amp;',',',';'),'',strip_tags($matchsp[1]));

/*north coordinate*/
$regexlocN = "/\<center\>(.+?)°[a-zA-Z]\<br/"; 
preg_match($regexlocN,$data,$matchlocN);
//echo $matchlocN[1];
$BIGDATA[1][2] = $matchlocN[1];

/*west coordinate*/
$regexlocW = "/°[a-zA-Z]\<br\/\>(.+?)°[a-zA-Z]&nbsp;/"; 
preg_match($regexlocW,$data,$matchlocW); 
//echo $matchlocW[1];
$BIGDATA[1][3] = $matchlocW[1];

/*east coordinate*/
$regexlocE = "/°[a-zA-Z]&nbsp;(.+?)°[a-zA-Z]\<br\/\>/"; 
preg_match($regexlocE,$data,$matchlocE);
//echo $matchlocE[1];
$BIGDATA[1][4] = $matchlocE[1];

/*south coordinate*/
$regexlocS = "/°[WE]\<br\/\>(.+?)°[NS]\</"; 
preg_match($regexlocS,$data,$matchlocS);
//echo $matchlocS[1];
$BIGDATA[1][5] = $matchlocS[1];

/*hemisphere coordinate*/
$regexloc = "/\°(.)\&nbsp\;/"; 
preg_match($regexloc,$data,$matchloc);
$regexloc2 = "/\°(.)\</"; 
preg_match($regexloc2,$data,$matchloc2);
$BIGDATA[1][6] = $matchloc[1].$matchloc2[1];
//var_dump($BIGDATA);
foreach ($BIGDATA as $fields) {
    fputcsv($fp, $fields);
}
} 
$percentage = $j/$iter;
echo $percentage;
}




fclose($fp);
?>


