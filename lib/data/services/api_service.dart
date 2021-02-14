import '../../di/container.dart';
import 'base_service.dart';
import 'package:dio/dio.dart' as Http;
import '../../commons/fp.dart';
import 'base_service_failure.dart';

class ApiService {
  final BaseService api1 = inject<BaseService>('api1');

// Future<Http.Response<LanguageList>> getLanguageList() async {
//   return await api1.get('${api1.baseUrl}', mockResponse: await api1.mockResponseFromJsonFile('languages')).flatMap(check200).flatMap(
//     (Http.Response res) {
//       return res.mapData((data) => LanguageList.fromJson(res.data));
//     },
//   );
// }

}
