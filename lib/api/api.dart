import '../config.dart';
import 'dio_api.dart';

class Api extends DioApi {
  Api() : super(Config.baseUrl);

  Future login(String phoneNumber, String password) {
    return dio.post("/login",
        data: {"phone_number": phoneNumber, "password": password});
  }
}

Api api = Api();
