import 'package:real_estate_task/data/models/house_model.dart';

extension HouseModelExtension on HouseModel{
  String get formattedMeasurement => '$measurement\m\u00B2';
  String get formattedRooms => '$rooms rooms';
}