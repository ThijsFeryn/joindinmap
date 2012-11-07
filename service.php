<?php
$curl = curl_init('http://api.joind.in/v2.1/events/?verbose=yes&format=json&filter=upcoming&resultsperpage=200');
curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
$json = curl_exec($curl);
$events = json_decode($json);
foreach($events->events as $event) {
    $latitude = $event->latitude;
    $longitude = $event->longitude;
    if($latitude == 0 || $longitude == 0){
        curl_setopt($curl,CURLOPT_URL,"http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=".$event->location);
        $json = curl_exec($curl);
        $geo = json_decode($json);
        if(isset($geo->results[0]->geometry->location->lat) && isset($geo->results[0]->geometry->location->lng)){
            $latitude = $geo->results[0]->geometry->location->lat;
            $longitude = $geo->results[0]->geometry->location->lng;
        }
        $event->latitude = $latitude;
        $event->longitude = $longitude;
    }
}
curl_close($curl);
echo json_encode($events);