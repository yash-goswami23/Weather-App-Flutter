import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MainCard extends StatelessWidget {
  Color mainClr, shadowClr;
  String team, city, img, weahter;
  MainCard(
      {super.key,
      required this.mainClr,
      required this.shadowClr,
      required this.city,
      required this.img,
      required this.team,
      required this.weahter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        margin: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        color: Colors.white,
        shadowColor: shadowClr,
        elevation: 8,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: mainClr,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                // alignment: Alignment.topCenter,
                children: [
                  Text(
                    city,
                    style: GoogleFonts.inter(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "images/$img.png",
                    height: 150,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                weahter,
                style: GoogleFonts.inter(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                team,
                style: GoogleFonts.inter(
                    fontSize: 45, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12)
            ],
          ),
        ),
      ),
    );
  }
}


/*
MainCard(
                mainClr: cc.getColor(cc.sunnyElement, cc.sunnyElementOpcty),
                shadowClr: cc.getColor(cc.sunnyShadow, cc.sunnyShadowOpcty),
                city: "Hapur",
                img: "sunny",
                team: "35.C")
*/ 