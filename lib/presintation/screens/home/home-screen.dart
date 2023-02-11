import 'package:agriculture/utils/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/decoration-utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.title,
              style: GoogleFonts.tajawal(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            )),
      ),
      body: Container(
        width: screenWidth,
        decoration: backGroundPattern(),
        child: Column(
          children: [
            ElevatedButton(
              child: Text(' وحدات البرودة'),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(CLOUD_FUNCTIONS_ROUT);
              },
            ),
            ElevatedButton(
              child: Text('أمراض النبات'),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed("ATTENDANCE_ROUTE");
              },
            ),
          ],
        ),
      ),
    );
  }
}
