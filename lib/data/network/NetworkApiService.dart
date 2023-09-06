import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:bahamas/Utils/constant.dart';
import 'package:bahamas/data/exceptions/app_exceptions.dart';
import 'package:bahamas/data/network/BaseApiServices.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class NetworkApiService extends BaseApiServices {
  dynamic headers = {
    "Content-Type": "application/x-www-form-urlencoded",
    'Accept': 'application/json',
  };
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      debugPrint('Url : $url');
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      debugPrint(response.body);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Future putApiResponse(String url, String uid, Map<dynamic, dynamic> body) async {
    dynamic responseJson;
    // try {
    http.Response response = await http.put(
      Uri.parse('$url$uid'),
      body: jsonEncode(body),
      // encoding: Encoding.getByName('utf-8'),
      headers: {"Content-Type": "application/json"},
    ).timeout(const Duration(seconds: 20));
    debugPrint("APi Url: ${response.request!.url}");
    responseJson = returnResponse(response);
    debugPrint("API RESPONSE : $responseJson");
    // } on SocketException {
    //   throw FetchDataException('No Internet Connection');
    // }
    return responseJson;
  }

  @override
  Future deleteApiRequest(
    // ignore: avoid_renaming_method_parameters
    String url,
  ) async {
    dynamic responseJson;
    // try {
    http.Response response = await http.delete(
      Uri.parse(url),

      // encoding: Encoding.getByName('utf-8'),
      headers: {"Content-Type": "application/json"},
    ).timeout(const Duration(seconds: 20));
    debugPrint("APi Url: ${response.request!.url}");
    responseJson = returnResponse(response);
    debugPrint("API RESPONSE : $responseJson");
    // } on SocketException {
    //   throw FetchDataException('No Internet Connection');
    // }
    return responseJson;
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Future putImageMultipart(String url, String uid, File? imageFile) async {
    dynamic responseJson;
    try {
      var request = http.MultipartRequest(
        "PUT",
        Uri.parse(
          url + uid,
        ),
      );
      request.headers.addAll(headers);
      request.files.add(http.MultipartFile.fromBytes(
        'profile_picture',
        imageFile!.readAsBytesSync(),
        filename: "test.${imageFile.path.split(".").last}",
        contentType: MediaType("image", imageFile.path.split(".").last),
      ));

      var response = await request.send();

      responseJson = response;
      responseJson = returnMultipartResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      debugPrint("catch in network");
      debugPrint(e.toString());
    }

    return responseJson;
  }

  // ignore: avoid_renaming_method_parameters
  Future postImageMultipartWithBody(
      String url, File? imageFile, var body) async {
    dynamic responseJson;
    // try {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(url),
    );
    request.headers.addAll(headers);
    request.files.add(http.MultipartFile.fromBytes(
      'event_image',
      imageFile!.readAsBytesSync(),
      filename: "test.${imageFile.path.split(".").last}",
      contentType: MediaType("image", imageFile.path.split(".").last),
    ));
    request.fields.addAll(body);
    var response = await request.send();

    responseJson = response;
    responseJson = returnMultipartResponse(response);
    debugPrint(responseJson.toString());
    // } on SocketException {
    //   throw FetchDataException('No Internet Connection');
    // } catch (e) {
    //   print("catch in network");
    //   print(e);
    // }

    return responseJson;
  }

  // Upload single image with data
  Future putImageMultipartWithBody(
    String url, File? imageFile, var body) async {
      debugPrint(url);
    dynamic responseJson;
    // try {
    var request = http.MultipartRequest(
      "PUT",
      Uri.parse(url),
    );
    request.headers.addAll(headers);
    request.files.add(http.MultipartFile.fromBytes(
      'image',
      imageFile!.readAsBytesSync(),
      filename: "test.${imageFile.path.split(".").last}",
      contentType: MediaType("image", imageFile.path.split(".").last),
    ));
    request.fields.addAll(body);

    var response = await request.send();

    responseJson = response;
    responseJson = returnMultipartResponse(response);
    debugPrint(responseJson.toString());
    // } on SocketException {
    //   throw FetchDataException('No Internet Connection');
    // } catch (e) {
    //   print("catch in network");
    //   print(e);
    // }

    return responseJson;
  }

   

  @override
  Future postMultipleMultipart(String url, List<File> imageList, dynamic body) async {
    dynamic responseJson;
    try {
      debugPrint('inside try body data: $body');
      debugPrint('inside try');
      List<http.MultipartFile> newMultiPartList = [];
      var request = http.MultipartRequest("POST", Uri.parse(url));
      request.headers.addAll(headers);
      for (int i = 0; i < imageList.length; i++) {
        int randomNumber = Random().nextInt(10000);
        var multipart = http.MultipartFile.fromBytes(
          'gallery',
          imageList[i].readAsBytesSync(),
          filename: "image$randomNumber.${imageList[i].path.split(".").last}",
          contentType: MediaType("image", imageList[i].path.split(".").last),
        );
        newMultiPartList.add(multipart);
      }
      debugPrint('After foor loop');
      debugPrint('new multipart list $newMultiPartList');
      request.fields.addAll(body);
      request.files.addAll(newMultiPartList);
      var response = await request.send();
      debugPrint('response $response');
      responseJson = response;
      responseJson = returnMultipartResponse(response);
    } on SocketException {
      Get.back();
      Constant.showSnackBar('Connection Issue', 'No Internet connection, check your internet.');
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  @override
  Future putMultipleMultipart(String url, List<File> imageList, var body) async {
    dynamic responseJson;
    try {
      List<http.MultipartFile> newMultiPartList = [];
      var request = http.MultipartRequest("PUT", Uri.parse(url));
      request.headers.addAll(headers);
      for (int i = 0; i < imageList.length; i++) {
        int randomNumber = Random().nextInt(10000);
        var multipart = http.MultipartFile.fromBytes(
          'gallery',
          imageList[i].readAsBytesSync(),
          filename: "image$randomNumber.${imageList[i].path.split(".").last}",
          contentType: MediaType("image", imageList[i].path.split(".").last),
        );
        newMultiPartList.add(multipart);
      }
      request.fields.addAll(body);
      request.files.addAll(newMultiPartList);
      var response = await request.send();
      responseJson = response;
      responseJson = returnMultipartResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }


  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            body: data,
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            encoding: Encoding.getByName('utf-8'),
          )
          .timeout(const Duration(seconds: 20));

      debugPrint("APi Url: ${response.request!.url}");
      debugPrint("Data Body : $data");
      debugPrint("API RESPONSE : ${response.body}");
      responseJson = await returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  Future getPostApiResponseWithRaw(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 30));
      debugPrint("APi Url: ${response.request!.url}");
      debugPrint("Data Body : $data");
      debugPrint("API RESPONSE : ${response.body}");
      responseJson = await returnResponse(response);
    } catch (e) {
      debugPrint("Erorrrrr: $e");
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  Future getPostWithBodyAddReview(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http.post(Uri.parse(url),
          body: data,
          headers: {
            'Content-type': 'application/json'
          }).timeout(const Duration(seconds: 30));
      debugPrint("APi Url: ${response.request!.url}");
      debugPrint("Data Body : $data");
      debugPrint("API RESPONSE : ${response.body}");
      responseJson = await returnResponse(response);
    } catch (e) {
      debugPrint("Erorrrrr: $e");
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  Future getPostApiResponseForLinkBankCard(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            body: data,
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            encoding: Encoding.getByName('utf-8'),
          )
          .timeout(const Duration(seconds: 20));
      debugPrint("APi Url: ${response.request!.url}");
      debugPrint("Data Body : $data");
      debugPrint("API RESPONSE : ${response.body}");
      responseJson = await returnResponseForLinkBankCard(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  // Response exceptions
  dynamic returnResponseForLinkBankCard(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      // throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            // ignore: prefer_adjacent_string_concatenation
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            // ignore: prefer_adjacent_string_concatenation
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }

  // Response exception for images
  dynamic returnMultipartResponse(http.StreamedResponse response) async {
    final responseBody = await response.stream.bytesToString();
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(responseBody);
        return responseJson;
      case 400:
        throw BadRequestException(responseBody);
      case 500:
      case 404:
        throw UnauthorisedException(responseBody);
      default:
        throw FetchDataException(
            // ignore: prefer_adjacent_string_concatenation
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
