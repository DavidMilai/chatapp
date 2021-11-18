import '../config.dart';
import 'dio_api.dart';

class Api extends DioApi {
  Api() : super(Config.baseUrl);

  Future login(String email, String password) {
    return dio.post("/login", data: {"email": email, "password": password});
  }
}

Api api = Api();
