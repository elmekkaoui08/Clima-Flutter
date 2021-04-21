import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

 double lat;
 double lon;
void getLocation() async{
  print('Starting.................');
  GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();
  if(geolocationStatus == GeolocationStatus.granted){
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    lat = position.latitude;
    lon = position.longitude;

print(' lat $lat $lon');
    var url = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=bfcbb59c1e9139a0ea6885b26ceb8221";
    http.Response data = await http.get(Uri.parse(url));
    if(data.statusCode == 200){
      var dataAsJson = jsonDecode(data.body);
      print('----> ${dataAsJson['name']}');
    }else{
      print(data.statusCode);
    }

  }
}

void getData() async{

}