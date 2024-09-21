import 'package:new_final_project/api_integration_class/model/services/base_service.dart';
import 'package:http/http.dart' as http;

class UserService extends BaseService {

  @override
  Future<dynamic> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      // Successful
      if (response.statusCode == 200) {
        return response.body;
      }
      return {"error": response.statusCode, "message": response.reasonPhrase};
    } catch (ex) {
      return {"error": ex.toString(), "message": "Something went wrong"};
    }
  }
}
