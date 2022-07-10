
/*
All service are pointed here  to get access to the api
This creates an instance of Api and provides to children classes
*/


import 'package:blockpatterntest/network/services/api.dart';

class BaseApi {
  Api api = Api();
}
