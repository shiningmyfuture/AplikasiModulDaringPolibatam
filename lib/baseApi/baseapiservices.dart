import 'package:http/http.dart' as http;
import 'apiresponse.dart';

class BaseApiService {
  static Future<ApiResponseModel> sendPostRequest(String url, String authToken, var requestBody) async {
    var uri = Uri.parse(url);
    var client = http.Client();
    try {
      var response = await client.post(uri, body: requestBody).catchError((error) {
        print(error.toString());
      });
      final String responseString = response.body;
      return apiResponseModelFromJson(responseString);
    } catch (error) {
      return ApiResponseModel(success: false, code: 400, message: "Error : " + error.toString(), content: "");
    } finally {
      client.close();
    }
  }
}
