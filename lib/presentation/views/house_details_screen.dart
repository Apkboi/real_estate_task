import 'package:flutter/material.dart';
import 'package:real_estate_task/presentation/widgets/house_preview_widget.dart';
import 'package:real_estate_task/presentation/views/tour_screen.dart';

import '../../data/models/house_model.dart';

class HouseDetailsScreen extends StatefulWidget {
  const HouseDetailsScreen({Key? key, required this.houseModel}) : super(key: key);
  final HouseModel houseModel;

  @override
  State<HouseDetailsScreen> createState() => _HouseDetailsScreenState();
}

class _HouseDetailsScreenState extends State<HouseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Expanded(child: HousePreveiewWidget(houseModel: widget.houseModel,)),
            const SizedBox(
              height: 50,
            ),
             Text(
             widget.houseModel.houseName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
             Text(
             widget.houseModel.houseAddress,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'N150,000,000',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TourScreen(),
                      ));
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: const Text(
                          'Tour',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(5))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      child: const Text(
                        'Make an Offer',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
