class Constants{

  //create singleton
  static final Constants _instance = Constants._internal();
  factory Constants() => _instance;
  Constants._internal();

  static const String apiKey = '479c7457e946ad02f88c921d306048e06e7a0eaf89a6ff6e';

  static const String _rawUrl = 'jlpnt2.deta.dev/';
  static const String baseUrl = 'https://' + _rawUrl;
  static const String operatorsApi = baseUrl + 'operators';
  static const String gadgetsApi = baseUrl + 'gadgets';
  static const String weaponsApi = baseUrl + 'weapons';
}