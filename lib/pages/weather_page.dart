import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  
    @override   
    State<WeatherPage> createState() => _WeatherPageState();    

}

class _WeatherPageState extends State<WeatherPage> {
 

 //api key
 final weatherService = WeatherService(apiKey);
 waether? _weather;

//fetching weather
fetchWeather() async{ 


    //get the current city
    String cityName = await weatherService.getCurrentCity();

    //fetch weather for the city
    try{
        final weather = await weatherService.getWeather(cityName);
        setState{() {
         weather = weather;
        }};


}
catch(e){
    print(e);
    
  }
}

@override
void initState(){

}
