import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'animation_state.dart';

class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit() : super(AnimationInitial());

  void triggerAnimation(int currentAnimation) {
    emit(AnimationChangedState(currentAnimation));
  }
}
