import 'package:weatehr_app/model/weather_model.dart';
import 'package:weatehr_app/widgets/bottom_card.dart';
import 'package:weatehr_app/widgets/main_card.dart';
import 'package:weatehr_app/widgets/colors_file.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatehr_app/widgets/search_text_feild.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RainScreen extends StatefulWidget {
  WeatherModel weatherModel;
  final Function(String str) onPressed;
  RainScreen({super.key, required this.weatherModel, required this.onPressed});

  @override
  State<RainScreen> createState() => _RainScreenState();
}

class _RainScreenState extends State<RainScreen> {
  ColorsFile cc = ColorsFile();
  @override
  Widget build(BuildContext context) {
    double temp = widget.weatherModel.main!.temp! - 273.15;
// tempMin, tempMax, feelslike, pressure, humidity, speed
// widget.weatherModel.main.feelsLike
// widget.weatherModel.wind.speed
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        backgroundColor: cc.getColor(cc.rainElement, cc.rainElementOpcty),
      ),
      backgroundColor: cc.getColor(cc.rainBackground, cc.rainBackgroundOpcty),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 2),
            SearchTextFeild(
              mainClr: cc.getColor(cc.rainElement, cc.rainElementOpcty),
              shadowClr: cc.getColor(cc.rainShadow, cc.rainShadowOpcty),
              onPressed: widget.onPressed,
            ),
            MainCard(
              mainClr: cc.getColor(cc.rainElement, cc.rainElementOpcty),
              shadowClr: cc.getColor(cc.rainShadow, cc.rainShadowOpcty),
              city: widget.weatherModel.name!,
              img: "rain",
              team: "${temp.toStringAsFixed(2)}°C",
              weahter: widget.weatherModel.weather![0].main!,
            ),
            BottomCard(
              mainClr: cc.getColor(cc.rainElement, cc.rainElementOpcty),
              shadowClr: cc.getColor(cc.rainShadow, cc.rainShadowOpcty),
              weatherModel: widget.weatherModel,
            )
          ],
        ),
      ),
    );
  }
}
