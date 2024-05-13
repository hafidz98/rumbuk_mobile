import 'package:get/get.dart';
import 'package:id_rumbuk_app/model/dto/api.config.dart';

class ReservationService extends GetConnect{
  final String apiEndpoint = ApiConfig.baseUrl + ApiConfig.reservation;


}