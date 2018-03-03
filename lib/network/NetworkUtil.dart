import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class NetworkUtil {
  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> request(String url){
    return http.get(url)
        .then((http.Response response){
        final String res = response.body;
        final int statusCode = response.statusCode;

        if(statusCode < 200 || statusCode > 400 || json == null){
          throw new Exception("Error while fetching data");
        }
        return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, encodedString){
    return http.post(url, headers: {'Content-type' : 'application/json'},
                     body: _decoder.convert(encodedString))
                .then((http.Response response){
                final String res = response.body;
                final int statusCode = response.statusCode;

                if(statusCode < 200 || statusCode > 400 || json == null){
                  throw new Exception("Error while fetching data");
                }
                return _decoder.convert(res);
    });
  }
}