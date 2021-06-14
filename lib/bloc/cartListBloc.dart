import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fooddeliveryapp/bloc/provider.dart';
import 'package:fooddeliveryapp/model/foodItem.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

  CartProvider provider = CartProvider();

  var _listController = BehaviorSubject<List<FoodItem>>.seeded([]);
  Stream<List<FoodItem>> get listStream => _listController.stream;
  Sink<List<FoodItem>> get listSink => _listController.sink;

  addToList(FoodItem foodItem) {
    listSink.add(provider.addToList(foodItem));
  }

  removeFromList(FoodItem foodItem) {
    listSink.add(provider.removeFromList(foodItem));
  }

  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
