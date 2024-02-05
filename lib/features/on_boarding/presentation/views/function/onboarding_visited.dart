import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/services/service_locator.dart';

bool onBoardingVisited(){
  return getIt<MyCacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
}