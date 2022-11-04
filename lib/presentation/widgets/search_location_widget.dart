import 'package:flutter/material.dart';
import 'package:real_estate_task/presentation/views/home_screen.dart';

class SearchLocationWidget extends StatefulWidget {
  const SearchLocationWidget({Key? key}) : super(key: key);

  @override
  State<SearchLocationWidget> createState() => _SearchLocationWidgetState();
}

class _SearchLocationWidgetState extends State<SearchLocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Row(
              children: const [
                Icon(Icons.home_rounded),
                SizedBox(
                  width: 16,
                ),
                Text('Search Location...'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: const BoxDecoration(
                  color: Colors.orange,

                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: const Center(
                  child: Text(
                    'Find now',
                    style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
