// ignore_for_file: unreachable_switch_default

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:vehicle_rental_app/core/utils/enum.dart';



class ApiServices {
  final http.Client _client = http.Client();
  final String baseUrl;

  ApiServices({String? token, String? baseUrlControll}) : baseUrl = (baseUrlControll?.isEmpty ?? true) ? "https://your-default-base-url.com/" : baseUrlControll!;

  Map<String, String> _headers({required String token}) => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        if (token.isNotEmpty) 'RequestVerificationToken': token,
      };

  Future<Map<String, dynamic>> request(
    String url,
    Method method,
    Map<String, dynamic>? params, {
    http.MultipartRequest? multipartRequest,
    String token = "",
  }) async {
    try {
      final uri = Uri.parse(baseUrl + url);
      final headers = _headers(token: token);
      http.Response response;

      switch (method) {
        case Method.POST:
          response = await _client.post(uri, headers: headers, body: jsonEncode(params));
          break;
        case Method.PUT:
          response = await _client.put(uri, headers: headers, body: jsonEncode(params));
          break;
        case Method.PATCH:
          response = await _client.patch(uri, headers: headers, body: jsonEncode(params));
          break;
        case Method.DELETE:
          response = await _client.delete(uri, headers: headers);
          break;
        case Method.UPLOAD:
          if (multipartRequest != null) {
            final streamed = await multipartRequest.send();
            response = await http.Response.fromStream(streamed);
          } else {
            throw Exception("Multipart request required for upload.");
          }
          break;
        case Method.GET:
        default:
          response = await _client.get(uri, headers: headers);
      }

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          'status': response.statusCode,
          'message': 'Error',
          'body': jsonDecode(response.body),
        };
      }
    } on SocketException {
      return {'error': 'No Internet connection'};
    } on FormatException {
      return {'error': 'Invalid format'};
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
