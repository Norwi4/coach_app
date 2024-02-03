import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'model/coach.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:97/Couch/')
abstract class CoachApiClient {
  factory CoachApiClient(Dio dio, {String baseUrl}) = _CoachApiClient;

  @GET('/GetAllCouches')
  Future<List<Coach>> getAllCouches();
}

CoachApiClient initApiClient() {
  final apiUrl = dotenv.env['API_URL'];
  final dio = Dio();
  if(apiUrl != null) {
    return CoachApiClient(dio, baseUrl: apiUrl);
  }
  return CoachApiClient(dio);
}
