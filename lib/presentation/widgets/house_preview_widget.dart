import 'dart:ui';

import 'package:flutter/material.dart';

import '../../data/models/house_model.dart';

class HousePreveiewWidget extends StatefulWidget {
  const HousePreveiewWidget({Key? key, required this.houseModel})
      : super(key: key);
  final HouseModel houseModel;

  @override
  State<HousePreveiewWidget> createState() => _HousePreveiewWidgetState();
}

class _HousePreveiewWidgetState extends State<HousePreveiewWidget> {
  final _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // height: 400,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))),
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.houseModel.houseImages.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) => Container(
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                     widget.houseModel.houseImages[index]
                      ))),
            ),
          ),
        ),
        Positioned(
            bottom: -30,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaY: 18,
                          sigmaX: 15,
                        ),
                        child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  widget.houseModel.houseAgent.agentImage),
                            )),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.black26,
                              spreadRadius: 2)
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          switchImage();
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 15,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black.withOpacity(0.6)),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Text(
              '${currentIndex + 1} of ${widget.houseModel.houseImages.length} images',
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        )
      ],
    );
  }

  void switchImage() {

    if (currentIndex + 1 != widget.houseModel.houseImages.length) {
      setState(() {
        currentIndex += 1;
        _pageController.animateToPage(currentIndex,
            duration: const Duration(
              milliseconds: 1000,
            ),
            curve: Curves.ease);
      });
    } else {
      setState(() {
        setState(() {
          currentIndex = 0;
          _pageController.animateToPage(0,
              duration: const Duration(
                milliseconds: 1000,
              ),
              curve: Curves.ease);
        });
      });
    }
  }
}
