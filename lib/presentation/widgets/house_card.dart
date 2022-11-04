import 'package:flutter/material.dart';
import 'package:real_estate_task/data/models/house_model.dart';
import 'package:real_estate_task/presentation/views/house_details_screen.dart';
import 'package:real_estate_task/presentation/widgets/primary_button.dart';
import 'package:real_estate_task/core/extensions/house_model_extension.dart';

class HouseCard extends StatefulWidget {
  const HouseCard({Key? key, required this.house}) : super(key: key);
  final HouseModel house;


  @override
  State<HouseCard> createState() => _HouseCardState();
}

class _HouseCardState extends State<HouseCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>  HouseDetailsScreen(houseModel: widget.house),));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image:  DecorationImage(
                          image: AssetImage(widget.house.houseImages.first),
                          fit: BoxFit.cover)),
                  width: 200,
                  height: 150,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration:
                      BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black.withOpacity(0.6)),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(7),
                      child: const Text(
                        '5 months ago',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(onPressed: () {}, child: const Text('FOR SALE')),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'N150,000,000',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text('${widget.house.houseName} - '),
                  Text('${widget.house.formattedRooms} - '),
                  Text(widget.house.formattedMeasurement)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
