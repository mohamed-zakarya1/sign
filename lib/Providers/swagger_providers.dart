import 'package:flutter/material.dart';
import 'package:login_signup/Models/swagger_model.dart';
import 'package:login_signup/Services/swagger_services.dart';

class SwaggerProviders extends ChangeNotifier {
  SwaggerModel? model;
  fetchApi() async {
    model = await SwaggerServices.getAll();
    notifyListeners();
  }
  signUp(String name, String email) async {
    await SwaggerServices.addData(name: name, email: email);
    notifyListeners();
  }
  signIn(String name, String email) async {
    return await SwaggerServices.login(name: name, email: email);
  }
}