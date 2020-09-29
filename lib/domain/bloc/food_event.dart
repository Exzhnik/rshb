import 'package:equatable/equatable.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();
}

class FetchListFood extends FoodEvent {
  const FetchListFood();

  @override
  List<Object> get props => [];
}
