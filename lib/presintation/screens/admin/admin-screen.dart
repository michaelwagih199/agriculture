import 'package:agriculture/presintation/components/decoration-utils.dart';
import 'package:agriculture/presintation/components/drop-down-component.dart';
import 'package:agriculture/utils/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../themes/appStyleConfig.dart';

class AdminScreen extends StatefulWidget {
  final String title;

  const AdminScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
// Initial Selected Value

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Container(
        width: screenWidth,
        decoration: backGroundPattern(),
        child: Column(
          children: [
            Container(
              color: AppStyleConfig.grey,
              width: screenWidth,
              child: Expanded(
                child: Row(
                  children: [
                    Container(
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue, // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(), // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            print(newValue);
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                    GovernoratesDropDownMenu(),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              child: Text(
                BTN_UPDATE_DATA,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
