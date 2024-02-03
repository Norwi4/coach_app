import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'model/coach.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:97/Couch/')
abstract class CoachApiClient {
  factory CoachApiClient(Dio dio, {String baseUrl}) = _CoachApiClient;

  factory CoachApiClient.create({String? apiUrl}) {
    final dio = Dio();
    if(apiUrl != null) {
      return CoachApiClient(dio, baseUrl: apiUrl);
    }
    return CoachApiClient(dio);
  }

  @GET('/GetAllCouches')
  Future<List<Coach>> getAllCouches();
}

