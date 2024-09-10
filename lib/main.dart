import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatehr_app/model/weather_model.dart';
import 'package:weatehr_app/screens/cloud_screen.dart';
import 'package:weatehr_app/screens/rain_screen.dart';
import 'package:weatehr_app/screens/sunny_screen.dart';
import 'package:weatehr_app/screens/wind_screen.dart';
import 'package:weatehr_app/services/api_provider.dart';
import 'package:weatehr_app/services/location_provider.dart';
import 'package:weatehr_app/widgets/colors_file.dart';
import 'package:weatehr_app/widgets/search_text_feild.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LocationProvider locationProvider = LocationProvider();
  late String city = "hapur";
  @override
  void initState() {
    super.initState();
    var fCtiy = locationProvider.getCureentLocation();
    fCtiy.then((value) {
      city = value!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var cc = ColorsFile();
    WeatherApi weatherApi = WeatherApi();
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      home: FutureBuilder(
        future: weatherApi.getWeatherData(city),
        builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.cod == 200) {
              String weather = snapshot.data!.weather![0].main.toString();
              if (weather == "Rain" ||
                  weather == "Mist" ||
                  weather == "Storm") {
                return RainScreen(
                    weatherModel: snapshot.data!,
                    onPressed: (str) {
                      if (str.isNotEmpty) {
                        city = str;
                        setState(() {});
                      }
                    });
              } else if (weather == "Wind" ||
                  weather == "Tornado" ||
                  weather == "Wave") {
                return WindScreen(
                    weatherModel: snapshot.data!,
                    onPressed: (str) {
                      if (str.isNotEmpty) {
                        city = str;
                        setState(() {});
                      }
                    });
              } else if (weather == "Clear" ||
                  weather == "Clouds" ||
                  weather == "Snow") {
                return CloudScreen(
                    weatherModel: snapshot.data!,
                    onPressed: (str) {
                      if (str.isNotEmpty) {
                        city = str;
                        setState(() {});
                      }
                    });
              } else {
                return SunnyScreen(
                    weatherModel: snapshot.data!,
                    onPressed: (str) {
                      if (str.isNotEmpty) {
                        city = str;
                        setState(() {});
                      }
                    });
              }
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Weather App",
                    style: GoogleFonts.inter(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor:
                      cc.getColor(cc.sunnyElement, cc.sunnyElementOpcty),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Enter City Check Weather",
                        style: GoogleFonts.inter(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      SearchTextFeild(
                          mainClr: Colors.white,
                          shadowClr: Colors.black,
                          onPressed: (str) {
                            if (str.isNotEmpty) {
                              city = str;
                              setState(() {});
                            }
                          }),
                    ],
                  ),
                ),
              );
            }

            // return const SunnyScreen();
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Weather App",
                  style: GoogleFonts.inter(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                backgroundColor:
                    cc.getColor(cc.sunnyElement, cc.sunnyElementOpcty),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
