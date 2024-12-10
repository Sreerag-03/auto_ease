import 'package:auto_ease/data/models/car.dart';

abstract class CarRepository{
  Future<List<Car>> fetchCars();
}