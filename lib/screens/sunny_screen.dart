import 'package:weatehr_app/model/weather_model.dart';
import 'package:weatehr_app/widgets/bottom_card.dart';
import 'package:weatehr_app/widgets/main_card.dart';
import 'package:weatehr_app/widgets/colors_file.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatehr_app/widgets/search_text_feild.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SunnyScreen extends StatefulWidget {
  WeatherModel weatherModel;
  final Function(String str) onPressed;
  SunnyScreen({super.key, required this.weatherModel, required this.onPressed});

  @override
  State<SunnyScreen> createState() => _SunnyScreenState();
}

class _SunnyScreenState extends State<SunnyScreen> {
  // WeatherModel weatherModel = WeatherModel();
  ColorsFile cc = ColorsFile();

  @override
  Widget build(BuildContext context) {
    double temp = widget.weatherModel.main!.temp! - 273.15;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather App",
            style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          backgroundColor: cc.getColor(cc.sunnyElement, cc.sunnyElementOpcty),
        ),
        backgroundColor:
            cc.getColor(cc.sunnyBackground, cc.sunnyBackgroundOpcty),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 2),
              SearchTextFeild(
                mainClr: cc.getColor(cc.sunnyElement, cc.sunnyElementOpcty),
                shadowClr: cc.getColor(cc.sunnyShadow, cc.sunnyShadowOpcty),
                onPressed: widget.onPressed,
              ),
              MainCard(
                mainClr: cc.getColor(cc.sunnyElement, cc.sunnyElementOpcty),
                shadowClr: cc.getColor(cc.sunnyShadow, cc.sunnyShadowOpcty),
                city: widget.weatherModel.name!,
                img: "sunny",
                team: "${temp.toStringAsFixed(2)}°C",
                weahter: widget.weatherModel.weather![0].main!,
              ),
              BottomCard(
                mainClr: cc.getColor(cc.sunnyElement, cc.sunnyElementOpcty),
                shadowClr: cc.getColor(cc.sunnyShadow, cc.sunnyShadowOpcty),
                weatherModel: widget.weatherModel,
              )
            ],
          ),
        ),
      ),
    );
  }
}
