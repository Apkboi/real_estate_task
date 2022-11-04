import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:real_estate_task/data/models/agent_model.dart';
import '../../../data/models/house_model.dart';

part 'house_event.dart';

part 'house_state.dart';

class HouseBloc extends Bloc<HouseEvent, HouseState> {
  final List<HouseModel> _houses = [
    HouseModel(
        houseName: 'Timber House',
        houseAgent: HouseAgent(
            agentName: 'Agent A', agentImage: 'assets/jpgs/person3.jpg'),
        houseAddress: 'Nikon Town Lekki Peninsula II,Lekki',
        houseImages: [
          'assets/jpgs/house2.jpg',
          'assets/jpgs/house1.jpg',
          'assets/jpgs/house3.jpg'
        ],
        rooms: 5,
        measurement: 400),
    HouseModel(
        houseName: 'Light House',
        houseAgent: HouseAgent(
            agentName: 'Agent B', agentImage: 'assets/jpgs/person2.jpg'),
        houseAddress: 'Nikon Town Lekki Peninsula II,Lekki',
        houseImages: [
          'assets/jpgs/house1.jpg',
          'assets/jpgs/house2.jpg',
          'assets/jpgs/house3.jpg'
        ],
        rooms: 5,
        measurement: 450),
    HouseModel(
        houseName: 'Paint House',
        houseAgent: HouseAgent(
            agentName: 'Agent C', agentImage: 'assets/jpgs/person1.jpg'),
        houseAddress: 'Nikon Town Lekki Peninsula II,Lekki',
        houseImages: [
          'assets/jpgs/house2.jpg',
          'assets/jpgs/house1.jpg',
          'assets/jpgs/house3.jpg'
        ],
        rooms: 5,
        measurement: 500)
  ];

  List<HouseModel> get houses => _houses;

  HouseBloc() : super(HouseInitial()) {
    on<HouseEvent>((event, emit) {});
    on<GetHousesEvent>(_mapGetHousesEventToState);
  }

  FutureOr<void> _mapGetHousesEventToState(
      GetHousesEvent event, Emitter<HouseState> emit) async {
    emit(GetHouseLoadingState());

    // Mocking a network call
    await Future.delayed(const Duration(seconds: 1));

    emit(GetHouseSuccessState(houses));
  }
}
