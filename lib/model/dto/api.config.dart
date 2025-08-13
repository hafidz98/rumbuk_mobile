class ApiConfig {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://purwacode.my.id:8991$app',
  );
  static const String app = '/v1/rumbuk';
  static const String auth = '/auth';
  static const String student = '/students';
  static const String reservation = '/reservation';
  static const String building = '/building';
  static const String floor = '/floor';
  static const String room = '/room';
  static const String availableRoom = '/available-room';
  static const String articles = '/articles';
}
