part of 'house_bloc.dart';

abstract class HouseEvent extends Equatable {
  const HouseEvent();
}

class GetHousesEvent extends HouseEvent {
  @override
  List<Object?> get props => [];
}
