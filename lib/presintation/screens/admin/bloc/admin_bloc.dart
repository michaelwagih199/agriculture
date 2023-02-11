import 'dart:convert';
import 'dart:io';

import 'package:agriculture/data/models/cold-functions-model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../../data/dal.dart';
import '../../../../data/models/cold-functions-result-model.dart';

part 'admin_event.dart';

part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  List<PlatformFile>? _paths;
  String? _extension = "csv";
  FileType _pickingType = FileType.custom;
  FirestoreHelper _firestoreHelper = new FirestoreHelper();
  var dal = FirestoreHelper();

  AdminBloc() : super(AdminInitial()) {
    getSvcFile();
  }

  void getSvcFile() {
    on<OpenFileFromStorageEvent>(
      (event, emit) {
        // emit(LoadingState());
        _openFileExplorer();
      },
    );
  }

  openFile(filepath) async {
    final File file = File(filepath);
    String content = await file.readAsString();
    LineSplitter ls = new LineSplitter();
    List<String> lines = ls.convert(content);
    List<ColdFunctionModel> coldFunctionsList = [];

    for (var i = 1; i < lines.length; i++) {
      var linesSpliter = lines[i].split(',');
      var date = linesSpliter[0].replaceAll(' ', '');
      var temp = double.parse(linesSpliter[1].replaceAll(' ', ''));
      if (temp! <= 0) continue;
      if (date.isEmpty) continue;
      coldFunctionsList.add(new ColdFunctionModel(date.substring(2), temp));
    }

    String? initdate = '';
    List<ColdFunctionResultModel> coldFunctionsLessThanTenList = [];
    List<ColdFunctionResultModel> coldFunctionsLessThanSevenList = [];
    int lessThanTenCounter = 0;
    int lessThanSevenCounter = 0;

    for (var i = 0; i < coldFunctionsList.length; i++) {
      initdate = coldFunctionsList[i].date;

      for (var j = 0; j < coldFunctionsList.length; j++) {
        if (coldFunctionsList[j].temp! < 10.0 &&
            coldFunctionsList[j].date == initdate) {
          lessThanTenCounter++;
        }
      }
      var model = new ColdFunctionResultModel(initdate, lessThanTenCounter);
      coldFunctionsLessThanTenList.add(model);
      lessThanTenCounter = 0;
      initdate = '';
    }

    saveColdFunction(coldFunctionsLessThanTenList);

    print('lessThanTen => $coldFunctionsLessThanTenList');
  }

  void _openFileExplorer() async {
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: false,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
      openFile(_paths![0].path);
    } on PlatformException catch (e) {
      emit(ErrorState('Unsupported operation ${e.message}'));
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      emit(ErrorState('Internal Server Error'));
      print(ex);
    }
  }

  Future<void> saveColdFunction(List<ColdFunctionResultModel> coldFunctionsLessThanTenList)async{
    for(var i = 0; i < coldFunctionsLessThanTenList.length; i++){
      Map<String,dynamic> data = new Map();
      data['date'] = coldFunctionsLessThanTenList[i].date!;
      data['numberOfunit'] = coldFunctionsLessThanTenList[i].numberOfunit;
      await dal.addToCollection(data, 'cloudFunction-$i');
    }

  }
}
