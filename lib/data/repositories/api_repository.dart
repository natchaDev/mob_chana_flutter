import 'package:mob_chana_flutter/data/services/api_service.dart';
import 'package:mob_chana_flutter/di/container.dart';

class ApiRepository {
  final ApiService _service = inject<ApiService>();

  // Future<SoccerLeaguesListInfo> getSoccerList() async {
  //   SoccerLeaguesListInfo soccerLeaguesListInfo = (await _service.getSoccerList()).data;
  //   return soccerLeaguesListInfo;
  // }

}
