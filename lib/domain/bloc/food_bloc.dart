import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rshb/domain/bloc/food_event.dart';
import 'package:rshb/domain/bloc/food_state.dart';
import 'package:rshb/domain/food_repository.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc({this.repository}) : super(null);

  final FoodRepository repository;

  FoodState get initialState => FoodEmpty();

  @override
  Stream<FoodState> mapEventToState(FoodEvent event) async* {
    if (event is FetchListFood) {
      yield FoodLoading();
      try {
        final food = await FoodRepository().listFoodApi();
        yield FoodLoaded(food);
      } on Exception catch (_) {
        yield FoodError();
      }
    }
  }
}
