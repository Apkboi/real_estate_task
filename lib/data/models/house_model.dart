import 'package:real_estate_task/data/models/agent_model.dart';

class HouseModel {
  String houseName;
  HouseAgent houseAgent;
  String houseAddress;
  List houseImages;
  int rooms;
  int measurement;

  HouseModel(
      {required this.houseName,
      required this.houseAgent,
      required this.houseAddress,
      required this.houseImages,
      required this.rooms,
      required this.measurement});
}
