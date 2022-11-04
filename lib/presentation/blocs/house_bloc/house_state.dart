part of 'house_bloc.dart';

abstract class HouseState extends Equatable {
  const HouseState();
}

class HouseInitial extends HouseState {
  @override
  List<Object> get props => [];
}

class GetHouseLoadingState extends HouseState {
  @override
  List<Object> get props => [];
}

class GetHouseSuccessState extends HouseState {
  List<HouseModel> houses;
  GetHouseSuccessState(this.houses);

  @override
  List<Object> get props => [houses];
}
