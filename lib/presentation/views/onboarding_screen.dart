import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_task/presentation/blocs/animation_bloc/animation_cubit.dart';
import 'package:real_estate_task/presentation/blocs/animation_bloc/animation_cubit.dart';

import '../widgets/search_location_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController text1Controller;
  late AnimationController text2Controller;
  late AnimationController searchFieldController;
  late AnimationController searchFieldFadeController;
  AnimationCubit animationCubit = AnimationCubit();

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocListener<AnimationCubit, AnimationState>(
      bloc: animationCubit,
      listener: _listenToAnimationState,
      child: Scaffold(
        body: Container(
          height: screenSize.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/jpgs/house3.jpg'),
                  fit: BoxFit.cover)),
          child: Column(children: [
            SizedBox(
              height: screenSize.height * 0.4,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/pngs/flutter_logo.png',
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Skiplab Innovation',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.menu,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const Spacer(),
                  FadeTransition(
                    opacity: text1Controller,
                    child: const Text(
                      'Let\'s find your',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  FadeTransition(
                    opacity: text2Controller,
                    child: const Text(
                      'Dream Home',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.6,
              child: FadeTransition(
                opacity: searchFieldFadeController,
                child: SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(0.0, 0.7),
                            end: const Offset(0.0, 0.0))
                        .animate(CurvedAnimation(
                            parent: searchFieldController,
                            curve: Curves.decelerate)),
                    child: const SearchLocationWidget()),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void initAnimation() async {
    // Controls animation for first Text
    text1Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward()
      ..addListener(() {
        if (text1Controller.isCompleted) {
          animationCubit.triggerAnimation(2);
        }
      });

    // Controls animation for second Text
    text2Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        if (text2Controller.isCompleted) {
          animationCubit.triggerAnimation(3);
        }
      });

    // Controls searchfield fade in animation
    searchFieldFadeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..addListener(() {
        if (searchFieldFadeController.isCompleted) {
          animationCubit.triggerAnimation(4);
        }
      });

    // Controls searchfield slide in animation

    searchFieldController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
  }

  void _listenToAnimationState(context, state) {
    if (state is AnimationChangedState) {
      if (state.currentAnimation == 2) {
        text2Controller.forward();
      } else if (state.currentAnimation == 3) {
        searchFieldFadeController.forward();
      } else if (state.currentAnimation == 4) {
        searchFieldController.forward();
      }
    }
  }

  @override
  void dispose() {
    text1Controller.dispose();
    text2Controller.dispose();
    searchFieldController.dispose();
    searchFieldFadeController.dispose();
    super.dispose();
  }
}
