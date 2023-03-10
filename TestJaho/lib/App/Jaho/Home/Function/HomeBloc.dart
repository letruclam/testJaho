

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:testjaho/App/Base/BaseBloc/base_bloc.dart';
import 'package:testjaho/App/Jaho/Home/Function/HomeRepository.dart';
import 'package:testjaho/App/Jaho/Home/Model/ModelList.dart';
import 'package:testjaho/App/Jaho/Home/State/HomeState.dart';

import '../Event/HomeEvent.dart';

class HomeBloc extends BaseBloc {

  final repo = HomeRepository();

  final eventController = StreamController<UIEvent>.broadcast();

  final stateController = StreamController<UIState>.broadcast();

  var homeState = HomeState();

   List<ListDataHome> listData = [];

  listenerEvent( BuildContext context) {
    eventController.stream.listen((event) async {
      if(event is HomeEvent) {
        setLoading(true);
        var res = await repo.getDataList(event.page??0);
        if(res.status == 200) {
          listData.addAll(List<ListDataHome>.from(res.data["data"].map((item) => ListDataHome.fromJson(item))));
          homeState.listData = listData;
          stateController.sink.add(homeState);
          setLoading(false);
        }
      }
    });
  }

}