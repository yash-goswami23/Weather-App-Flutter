import 'package:flutter/material.dart';

class ColorsFile {
  String sunnyElement = "0xffFFE600"; //opcity 22
  double sunnyElementOpcty = 0.22;
  String sunnyBackground = "0xffFFEE54"; //opcity 40
  double sunnyBackgroundOpcty = 0.40; //opcity 40

  String sunnySearch = "0xffFFBDA";
  double sunnySearchOpcty = 0.51; //opcity 51

  String sunnyShadow = "0xffAA9F3E"; //opcity 22
  double sunnyShadowOpcty = 0.51;

  String windElement = "0xffB6ECEE"; //opcity 100
  double windElementOpcty = 1;

  String windShadow = "0xff1D6E80"; //opcity 100 E5F7FF
  double windShadowOpcty = 0.40;

  String windBackground = "0xffE5F7FF"; //opcity 40
  double windBackgroundOpcty = 0.80;

  String windSearch = "0xffE5F7FF"; //opcity 40
  double windSearchOpcty = 0.40;

  String rainElement = "0xffB8D0D9"; //opcity 100
  double rainElementOpcty = 1;

  String rainShadow = "0xff63808B"; //opcity 100
  double rainShadowOpcty = 0.60;

  String rainBackground = "0xff7BA7B8"; //opcity 90
  double rainBackgroundOpcty = 0.9;

  String rainSearch = "0xffE5F7FF"; //opcity 40
  double rainSearchOpcty = 0.40;

  String cloudElement = "0xffFAFBFB"; //opcity 100
  double cloudElementOpcty = 0.60;

  String cloudShadow = "0xffC9BCBC"; //opcity 100
  double cloudShadowOpcty = 0.60;

  String cloudBackground = "0xffF8E2AB"; //opcity 100
  double cloudBackgroundOpcty = 1;

  String cloudSearch = "0xffFAFBFB"; //opcity 40
  double cloudSearchOpcty = 0.4;

  Color getColor(clr, opacity) {
    return Color(int.parse(clr)).withOpacity(opacity);
  }
}
