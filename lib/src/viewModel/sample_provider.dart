import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/src/model/sample.dart';


class SampleProvider extends ChangeNotifier{
  List<Sample>sampleList=[];
  int status=Status.IDLE;
  getData() async {
    sampleList.clear();
    status=Status.LOADING;
    notifyListeners();
    try{
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        final items = json.decode(response.body);
        print('items'+items.toString());
        (items as List).map((li) => sampleList.add(Sample.fromJson(li))).toList();
        // (items as List<Map<String,dynamic>>).forEach((element) {
        //   sampleList.add(Sample.fromJson(element));
        // });
        print('success');
        status=Status.LOADED;
        notifyListeners();
      } else {
        status=Status.ERROR;
        notifyListeners();
        throw Exception('Failed to load album');
      }
    }catch(e){
      print('error is'+e.toString());
    }
  }

}
class Status{
  static const int IDLE=0;
  static const int LOADING=1;
  static const int LOADED=2;
  static const int ERROR=3;

}