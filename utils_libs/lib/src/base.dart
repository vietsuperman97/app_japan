// ignore: camel_case_types
class BASE_URL {
  BASE_URL._();
  //GET
  static const GET_INFO_USER = '/api/User/GetsCurrentUserInfo';

  //POST
  static const GET_MACHINE = '/api/machine/getsmachine';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  static const ENV  = 'assets/.env';

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const content_type = 'Content-Type';
  static const application_json = 'application/json';
  ////////////////////////////////////////////////////////
  static const multipart_form_data = 'multipart/form-data';

  static const auth_type = 'Authorization';
  ////////////////////////////////////////////////////////
  static String bearer(String token) => token;

  static const headerDemoKey = 'Demo-Header';
  static const headerDemoValue = 'demo header';

  static const RECHARGE = 3;
  static const SUCCESS = 2;
  static const FAIL = 1;
  static const ERROR = 0;
}
