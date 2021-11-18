import '../config.dart';
import 'dio_api.dart';

class Api extends DioApi {
  Api() : super(Config.baseUrl);

  Future login(String email, String password) {
    return dio.post("auth/login", data: {"email": email, "password": password});
  }

  Future getUser() {
    return dio.get(
      "api/users",
    );
  }
}

Api api = Api();
