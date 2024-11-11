import 'package:dio/dio.dart';
import 'package:login_signup/Models/swagger_model.dart';

class SwaggerServices {
  static Dio dio = Dio();
  static Map postData = {"name":"", "email":""};
  static getAll() async {
    try {
      const url = "https://localhost:7053/api/Students";
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return SwaggerModel.fromJson(response.data);
      } else {
        throw Exception("404");
      }
    } catch (e) {
      rethrow;
    }
  }
  static addData({required String name,required String email}) async {
    try {
      postData["name"] = name;
      postData["email"] = email;
      await dio.post(
          "https://localhost:7053/api/Students",
          data: postData
      );
    } catch (e) {
      if (e is DioError && e.type == DioErrorType.connectionError) {
        // Handle the connection error
        throw Exception("Unable to connect to the server. Please check your network connection.");
      } else {
        rethrow;
      }
    }
  }
  static login({required String name, email}) async {
    try {
      postData["name"] = name;
      postData["email"] = email;
      await dio.post(
        "http://localhost:7053/api/Students/login", // Update the URL as needed
        data: postData,
      );
      return true; // Indicate successful sign-in
    } catch (e) {
      if (e is DioError && e.type == DioErrorType.connectionError) {
        // Handle the connection error
        return false; // Indicate failed sign-in
      } else {
        rethrow;
      }
    }
  }
}