import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class CommentsController with ChangeNotifier {
 List<dynamic> _data = [];
  
  List<dynamic> get data => _data;

  Future<void> fetchComments() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      // _data.clear();
      if (response.statusCode == 200) {
        print(response.body);
        var _dataNew = jsonDecode(response.body);
        _data = _dataNew;
        print('fgfgf $_data');
        notifyListeners();
      } else {
        throw Exception('Failed to load comments: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      print('ClientException: $e');
      throw Exception('Network error occurred. Please try again.');
    } on FormatException catch (e) {
      print('FormatException: $e');
      throw Exception('Data format error. Please contact support.');
    } catch (e) {
      print('Exception: $e');
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }
}
