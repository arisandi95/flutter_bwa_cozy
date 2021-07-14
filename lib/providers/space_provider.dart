import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/models/space.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier{
  Future getRecommendedSpaces() async{
    var url = Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces');
    final response = await http.get(url);

    // print(response.statusCode);
    // print(response.body);

    if(response.statusCode == 200){
      List data = convert.jsonDecode(response.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();

      return spaces;
    } else {
      // then throw an exception.
      // throw Exception('Failed to load data');
      return <Space>[];
    }
    
  }
}