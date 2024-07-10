import 'package:softbd/src/config/imports.dart';

class Services {

  static Services? _instance;

  Services._internal();
  factory Services(){
    _instance ??= Services._internal();
    return _instance!;
  }

  final _restApiClient = RestApi();

  Future<dynamic> getActivitiesData() async {
    final response = await _restApiClient.get(
        baseURL: baseUrl!,
        endpoint: endpoint_activities,
    );
    return response;
  }
}