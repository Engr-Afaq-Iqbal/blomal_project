import 'package:http/http.dart' as http;

import '../Utils/utils.dart';

class ApiServices {
  static String apiExceptionFormat(method, url, code, res) =>
      '$method, EndPoint => $url\nStatus Code => $code\nResponse => $res';

  static Future<String?> getMethod(
      {required String feedUrl,
      required String xRequestId,
      required String xRequestTimeStamp}) async {
    var headers = {
      'Accept': 'application/json',
      'Accept-Language': 'en',
      'X-Request-Id': '$xRequestId',
      'X-Request-Timestamp': '$xRequestTimeStamp',
    };
    var request = http.Request('GET', Uri.parse(feedUrl));

    request.headers.addAll(headers);

    return await request.send().then((http.StreamedResponse response) async {
      String result = await response.stream.bytesToString();
      logger.i(headers);
      logger.i(apiExceptionFormat('GET', feedUrl, response.statusCode, result));
      if (response.statusCode == 200) {
        return result;
      }

      return null;
    }).onError((error, stackTrace) async {
      logger.e('StackTrace $stackTrace');

      return null;
    });
  }

  static Future<String?> postMethod(
      {required feedUrl,
      Map<String, String>? fields,
      required String xRequestId,
      required String xRequestTimeStamp}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'accept': 'application/json',
      'X-Request-Id': '$xRequestId',
      'X-Request-Timestamp': '$xRequestTimeStamp',
      'X-Client-Referrer': 'swagger',
      'Accept-Language': 'en'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$feedUrl'));
    if (fields != null) {
      request.fields.addAll(fields);
      logger.i(request.fields);
    }

    request.headers.addAll(headers);

    return await request.send().then((http.StreamedResponse response) async {
      String result = await response.stream.bytesToString();
      logger
          .i(apiExceptionFormat('POST', feedUrl, response.statusCode, result));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return result;
      }

      return null;
    }).onError((error, stackTrace) async {
      logger.e('StackTrace $stackTrace');
      return null;
    });
  }
}
