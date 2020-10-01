import 'package:rshb/model/list_food.dart';

abstract class FoodState {
  const FoodState();

  List<Object> get props => [];
}

class FoodEmpty extends FoodState {}

class FoodLoading extends FoodState {}

class FoodLoaded extends FoodState {
  // ignore: prefer_asserts_with_message
  FoodLoaded(this._food);
  ListFood get getFoodList => _food;
  final ListFood _food;

  @override
  List<Object> get props => [_food];
}

class FoodError extends FoodState {}
