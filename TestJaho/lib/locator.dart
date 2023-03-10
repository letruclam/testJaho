import 'package:get_it/get_it.dart';

import 'App/Jaho/Home/Function/HomeBloc.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
   locator.registerLazySingleton(() => HomeBloc());


}



