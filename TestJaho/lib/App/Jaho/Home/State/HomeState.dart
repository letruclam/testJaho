
import 'package:testjaho/App/Jaho/Home/Model/ModelList.dart';

abstract class UIState {}

class HomeState extends UIState {
  List<ListDataHome>? listData;

  HomeState({ this.listData});
}


