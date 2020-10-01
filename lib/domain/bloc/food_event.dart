abstract class FoodEvent {
  const FoodEvent();
}

class FetchListFood extends FoodEvent {
  const FetchListFood();

  List<Object> get props => [];
}
