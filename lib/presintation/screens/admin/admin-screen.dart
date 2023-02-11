import 'package:agriculture/presintation/components/decoration-utils.dart';
import 'package:agriculture/presintation/components/drop-down-component.dart';
import 'package:agriculture/presintation/screens/admin/bloc/admin_bloc.dart';
import 'package:agriculture/utils/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../themes/appStyleConfig.dart';

class AdminScreen extends StatefulWidget {
  final String title;

  const AdminScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _loadFile(String governorate) {
    BlocProvider.of<AdminBloc>(context).add(OpenFileFromStorageEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: BlocListener<AdminBloc, AdminState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Container(
          width: screenWidth,
          decoration: backGroundPattern(),
          child: BlocBuilder<AdminBloc, AdminState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    color: AppStyleConfig.grey,
                    width: screenWidth,
                    child: Row(
                      children: [
                        GovernoratesDropDownMenu(),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    child: Text(
                      BTN_UPDATE_DATA,
                    ),
                    onPressed: () => BlocProvider.of<AdminBloc>(context)
                        .add(OpenFileFromStorageEvent()),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
