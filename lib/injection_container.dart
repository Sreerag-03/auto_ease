import 'package:auto_ease/data/data_sources/firebase_car_data_source.dart';
import 'package:auto_ease/data/repositories/car_repository_impl.dart';
import 'package:auto_ease/domain/repositories/car_repository.dart';
import 'package:auto_ease/domain/usecases/get_cars.dart';
import 'package:auto_ease/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection(){
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(()=> FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(
      ()=> FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>())
      );
    getIt.registerLazySingleton<CarRepository>(
      ()=> CarRepositoryImpl(getIt<FirebaseCarDataSource>())
      );
    getIt.registerLazySingleton<GetCars>(
      ()=> GetCars(getIt<CarRepository>())
      );  
    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));   
  } catch (e) {
    throw e;
  }
}