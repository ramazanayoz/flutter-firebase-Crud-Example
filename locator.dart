import 'package:get_it/get_it.dart';

import 'core/viewmodels/CRUDModel.dart';
import 'core/services/api.dart';

GetIt xlocator = GetIt.instance;

void setupLocator(){
  xlocator.registerLazySingleton(() => XApi('products') );
  xlocator.registerLazySingleton( () => XCrudModel() );
}