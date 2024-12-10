import 'package:auto_ease/data/models/car.dart';
import 'package:auto_ease/presentation/bloc/car_bloc.dart';
import 'package:auto_ease/presentation/bloc/car_state.dart';
import 'package:auto_ease/presentation/widgets/car_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                return CarCard(car: state.cars[index]);
              },
            );
          }
          else if(state is CarsError){
            return Center(child: Text('error : ${state.message}'),);
          }

          return Container();
        },
      ),
    );
  }
}
