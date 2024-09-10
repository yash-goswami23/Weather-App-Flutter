import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SearchTextFeild extends StatelessWidget {
  Color shadowClr, mainClr;
  final Function(String str) onPressed;
  SearchTextFeild(
      {super.key,
      required this.mainClr,
      required this.shadowClr,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      color: Colors.white,
      shadowColor: shadowClr,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.streetAddress,
              focusNode: FocusNode(),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w200),
                filled: true,
                suffixIcon: IconButton(
                    onPressed: () => onPressed(controller.text),
                    icon: const Icon(Icons.search, size: 28)),
                fillColor: mainClr,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
