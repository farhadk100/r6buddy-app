class Constants{

  //create singleton
  static final Constants _instance = Constants._internal();
  factory Constants() => _instance;
  Constants._internal();

  static const String _rawUrl = 'jlpnt2.deta.dev/';
  static const String baseUrl = 'https://' + _rawUrl;
  static const String operatorsApi = baseUrl + 'operators';
}