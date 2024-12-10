import 'package:auto_ease/data/data_sources/firebase_car_data_source.dart';
import 'package:auto_ease/data/models/car.dart';
import 'package:auto_ease/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository{
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }

}