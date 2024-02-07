import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> isConnection() async {
  InternetConnectionChecker connection = InternetConnectionChecker();

  if (await connection.hasConnection) {
    return true;
  } else {
    return false;
  }
}
