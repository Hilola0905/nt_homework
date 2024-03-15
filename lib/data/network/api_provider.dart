import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nt_homework/data/model/country_model.dart';

import '../model/user_model.dart';

class ApiProvider {
  Future<List<UserModel>> getUsers() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://fifth-exam.free.mockoapp.net/users"),
      );
      if (response.statusCode == HttpStatus.ok) {
        return (jsonDecode(response.body) as List?)
            ?.map((e) => UserModel.fromJson(e))
            .toList() ??
            [];
      }
    } catch (error) {
      return [];
    }

    return [];
  }
  Future<List<CountryModel>> getCountries() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://restcountries.com/v3.1/all"),
      );
      if (response.statusCode == HttpStatus.ok) {
        return (jsonDecode(response.body) as List?)
            ?.map((e) => CountryModel.fromJson(e))
            .toList() ??
            [];
      }
    } catch (error) {
      return [];
    }

    return [];
  }
}