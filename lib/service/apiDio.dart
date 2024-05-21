import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';

import 'package:be_my_eyes/gameOver.dart';
import 'package:be_my_eyes/guide/guideHome.dart';
import 'package:be_my_eyes/home.dart';
import 'package:be_my_eyes/profile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

var options = BaseOptions(
  // baseUrl: 'http://192.168.1.3:8002',
  baseUrl: 'http://3.91.132.16:8004',
);

var dio = Dio(options);

final storage = new FlutterSecureStorage();

class apiDio {
  Map<String, dynamic> loginData(String username, String pass) {
    return {
      'email': username,
      'password': pass,
    };
  }

  login(username, pass, context) async {
    try {
      var login_Data = loginData(username, pass);
      print(login_Data);
      String dataJson = json.encode(login_Data);
      print(dataJson);
      Response response = await dio.post(
        '/login',
        data: dataJson,
        options: Options(
          contentType: Headers.jsonContentType, // Set content type to JSON
        ),
      );
      print(response.data[0]);
      if (response.data["userdata"] != 'error') {
        // await EasyLoading.showSuccess(response.data[0]);
        await storage.write(key: 'username', value: response.data["userdata"]);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(
              name: response.data["userdata"],
            ),
          ),
        );
      } else {
        // EasyLoading.showError(response.data[0]);
      }
    } catch (e) {
      print(e);
    }

    // .then((response) => print(response.data[0]))
    // .catchError((error) => print(error));
  }

  Map<String, dynamic> regData(String username, String email, String pass) {
    return {
      'email': email,
      'password': pass,
      'username': username,
    };
  }

  register(username, email, pass, context) async {
    try {
      var reg_Data = regData(username, email, pass);
      print(reg_Data);
      String dataJson = json.encode(reg_Data);
      Response response = await dio.post(
        '/register',
        data: dataJson,
        options: Options(
          contentType: Headers.jsonContentType, // Set content type to JSON
        ),
      );

      print(response.data[0]);

      if (response.data["userdata"] != 'error') {
        // await EasyLoading.showSuccess(response.data[0]);
        await storage.write(key: 'username', value: response.data["userdata"]);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GuideHome(
              name: response.data["userdata"],
            ),
            //     Home(
            //   name: response.data[1],
            // ),
          ),
        );
      } else {
        // EasyLoading.showError(response.data[0]);
      }
    } catch (e) {
      print(e);
    }

    // .then((response) => print(response.data[0]))
    // .catchError((error) => print(error));
  }

  getData() async {
    final username = await storage.read(key: 'username');
    var login_Data = loginData(username!, "pass");
    String dataJson = json.encode(login_Data);
    Response response = await dio.post(
      '/getdata',
      data: dataJson,
      options: Options(
        contentType: Headers.jsonContentType, // Set content type to JSON
      ),
    );
    print(response.data);
    return response.data;
  }

  testApi() async {
    try {
      Response response = await dio.post('/predictLvl/',
          // data: ChildDataJson,
          options: Options(
            contentType: Headers.jsonContentType, // Set content type to JSON
          ));

      print(response.data["res"]);
      return response.data["res"];
    } catch (e) {
      // Handle any errors here
      print(e);
      return null; // Or return an error message
    }
  }

  Map<String, dynamic> createChildGameData(
      int a1,
      int a2,
      int a3,
      int a4,
      int a5,
      int a6,
      int t0,
      int t1,
      int t2,
      int t3,
      int t4,
      int t5,
      String username) {
    return {
      'ans1': a1,
      'ans2': a2,
      'ans3': a3,
      'ans4': a4,
      'ans5': a5,
      'ans6': a6,
      't0': t0,
      't1': t1,
      't2': t2,
      't3': t3,
      't4': t4,
      't5': t5,
      'UserName': username,
    };
  }

  addChildRate(int a1, int a2, int a3, int a4, int a5, int a6, int t0, int t1,
      int t2, int t3, int t4, int t5, context) async {
    final username = await storage.read(key: 'username');
    try {
      // Create the Dart object with the desired structure
      var ChildRatingData = createChildGameData(
          a1, a2, a3, a4, a5, a6, t0, t1, t2, t3, t4, t5, username!);

      // Convert the Dart object to JSON
      String ChildDataJson = json.encode(ChildRatingData);

      // Make the Dio POST request with JSON data
      Response response = await dio.post('/predictLvl/',
          data: ChildDataJson,
          options: Options(
            contentType: Headers.jsonContentType, // Set content type to JSON
          ));

      print(response.data["res"]);
      // time
      if (response.data["res"] != 'error') {
        // await EasyLoading.showSuccess(response.data[0]);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GameOver(
              level: response.data["res"],
              name: response.data["uname"],
              time: response.data["time"].toString(),
            ),
          ),
        );
      } else {
        // EasyLoading.showError(response.data[0]);
      }
      return response
          .data["res"]; // Assuming your FastAPI endpoint returns a message.
    } catch (e) {
      // Handle any errors here
      print(e);
      return null; // Or return an error message
    }
  }

  uploadVideo(Uint8List fileBytes, String vidfilename) async {
    print(vidfilename);
    try {
      FormData formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          fileBytes,
          filename: vidfilename, // Ensure this matches the actual file name
          // contentType: MediaType('video', 'mp4'), // Specify the content type
        ),
        // 'person_name': personName,
      });

      Options options = Options(
        headers: {
          'accept': 'application/json',
          'Content-Type': 'multipart/form-data',
        },
      );

      Response response = await dio.post(
        '/video/',
        data: formData,
        options: options,
      );

      if (response.statusCode == 200) {
        print('Upload successful');
        // print(response.data["res"]["results"]);
        return response.data["res"]["results"];
      } else {
        print('Failed to upload');
        print(response.data);
        // return response.data;
      }
    } catch (error) {
      print('Error uploading video: $error');
    }
  }
}
