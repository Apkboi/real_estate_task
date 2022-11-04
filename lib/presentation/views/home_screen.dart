import 'package:flutter/material.dart';
import 'package:real_estate_task/presentation/blocs/house_bloc/house_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_task/presentation/widgets/house_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final houseBloc = HouseBloc();

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    houseBloc.add(GetHousesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: BlocConsumer<HouseBloc, HouseState>(
          bloc: houseBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetHouseLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetHouseSuccessState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      'Home for sale',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      'We value over 35,000 homes every year',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.houses.length,
                      padding: const EdgeInsets.only(left: 25),
                      itemBuilder: (context, index) => HouseCard(
                        house: state.houses[index],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('assets/jpgs/map_image.jpg'),
                            fit: BoxFit.cover)),
                  ))
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
