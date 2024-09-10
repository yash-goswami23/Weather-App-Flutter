import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatehr_app/model/weather_model.dart';

// ignore: must_be_immutable
class BottomCard extends StatelessWidget {
  Color mainClr, shadowClr;
  WeatherModel weatherModel;
  BottomCard(
      {super.key,
      required this.mainClr,
      required this.shadowClr,
      required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    double tempMin = weatherModel.main!.tempMin! - 280.15;
    double tempMax = weatherModel.main!.tempMax! - 265.15;
    double feels = weatherModel.main!.feelsLike! - 273.15;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        color: Colors.white,
        shadowColor: shadowClr,
        elevation: 8,
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            color: mainClr,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: BottomItems(
                          ic: "feels",
                          label: "Feels Like",
                          value: "${feels.toStringAsFixed(2)} °")),
                  Expanded(
                      child: BottomItems(
                          ic: "tampmin",
                          label: "Temp min",
                          value: "${tempMin.toStringAsFixed(2)}°C")),
                  Expanded(
                      child: BottomItems(
                          ic: "tampmax",
                          label: "Temp max",
                          value: "${tempMax.toStringAsFixed(2)}°C")),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: BottomItems(
                          ic: "speed",
                          label: "Speed",
                          value: "${weatherModel.wind!.speed.toString()} mph")),
                  Expanded(
                      child: BottomItems(
                          ic: "pressure",
                          label: "Pressure",
                          value:
                              "${weatherModel.main!.pressure.toString()} hPa")),
                  Expanded(
                      child: BottomItems(
                          ic: "humidity",
                          label: "Humidity",
                          value:
                              "${weatherModel.main!.humidity.toString()} %")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BottomItems extends StatelessWidget {
  String label, value, ic;
  BottomItems(
      {super.key, required this.ic, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Image.asset(
            "images/$ic.png",
            height: 50,
          ),
          Text(
            value,
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
