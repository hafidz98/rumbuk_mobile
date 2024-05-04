import 'package:get_it/get_it.dart';
import 'package:id_rumbuk_app/screens/login/login.controller.dart';

final getIt = GetIt.instance;

void setupGetIt(){
  getIt.registerLazySingleton<LoginController>(() => LoginController());
}