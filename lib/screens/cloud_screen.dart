import 'package:weatehr_app/model/weather_model.dart';
import 'package:weatehr_app/widgets/bottom_card.dart';
import 'package:weatehr_app/widgets/main_card.dart';
import 'package:weatehr_app/widgets/colors_file.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatehr_app/widgets/search_text_feild.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CloudScreen extends StatefulWidget {
  WeatherModel weatherModel;
  final Function(String str) onPressed;
  CloudScreen({super.key, required this.weatherModel, required this.onPressed});

  @override
  State<CloudScreen> createState() => _CloudScreenState();
}

class _CloudScreenState extends State<CloudScreen> {
  ColorsFile cc = ColorsFile();

  @override
  Widget build(BuildContext context) {
    double temp = widget.weatherModel.main!.temp! - 273.15;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        backgroundColor: cc.getColor(cc.cloudElement, cc.cloudElementOpcty),
      ),
      backgroundColor: cc.getColor(cc.cloudBackground, cc.cloudBackgroundOpcty),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 2),
            SearchTextFeild(
                mainClr: cc.getColor(cc.cloudElement, cc.cloudElementOpcty),
                shadowClr: cc.getColor(cc.cloudShadow, cc.cloudShadowOpcty),
                onPressed: widget.onPressed),
            MainCard(
              mainClr: cc.getColor(cc.cloudElement, cc.cloudElementOpcty),
              shadowClr: cc.getColor(cc.cloudShadow, cc.cloudShadowOpcty),
              city: widget.weatherModel.name!,
              img: "cloud",
              team: "${temp.toStringAsFixed(2)}°C",
              weahter: widget.weatherModel.weather![0].main!,
            ),
            SingleChildScrollView(
              child: BottomCard(
                  mainClr: cc.getColor(cc.cloudElement, cc.cloudElementOpcty),
                  shadowClr: cc.getColor(cc.cloudShadow, cc.cloudShadowOpcty),
                  weatherModel: widget.weatherModel),
            )
          ],
        ),
      ),
    );
  }
}
