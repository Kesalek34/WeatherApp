import '..models/weather.dart';
import 'package:http/http.dart' as http;

class WaetherService {
 static const BASE_URL ="https://api.openweathermap.org/data/2.5/weather"; 
    final String apiKey;

   waetherSevice(this.apiKey);

   Future<Weather> getWeather(String cityName async) {
    final response = await http
    .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));


    if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather.fromJson(json);
    } else {
        throw Exception('Failed to load weather data');
    }

   }
Future<String> getCurrentCity() async {

LocatePermission() persmision = await Geolocator.checkPermission();  

if(permission == LocationPermission.denied){
    persmision = await Geolocator.requestPermission();
}   

Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high);
    

List<Placement> placemarks = await placemarkCoordinates{position.latitude, position.longitude};
   
   String? city = placemarks[0].locality;
   return city ?? "";


   }

}
