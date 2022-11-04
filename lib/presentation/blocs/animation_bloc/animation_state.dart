part of 'animation_cubit.dart';

abstract class AnimationState extends Equatable {
  const AnimationState();
}

class AnimationInitial extends AnimationState {
  @override
  List<Object> get props => [];
}

class AnimationChangedState extends AnimationState {
  int currentAnimation;

  AnimationChangedState(this.currentAnimation);

  @override
  List<Object?> get props => [currentAnimation];
}
