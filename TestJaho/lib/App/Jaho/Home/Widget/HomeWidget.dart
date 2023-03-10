import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testjaho/App/Jaho/Home/Event/HomeEvent.dart';
import 'package:testjaho/App/Jaho/Home/Function/HomeBloc.dart';
import 'package:testjaho/App/Jaho/Home/State/HomeState.dart';

import '../../../Base/BaseWidget/base_state.dart';
import '../../../Base/BaseWidget/base_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return StateHomeWidget();
  }
}

class StateHomeWidget extends MBNState<HomeBloc, HomeWidget> {
  int pageList = 1;
  bool gridView = false;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeBloc, UIState>(
      callBloc: (callBloc) {
        callBloc.listenerEvent(context);
        callBloc.eventController.sink.add(HomeEvent());
      },
      builder: (context, value, onBloc) {
        return Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: gridView == false
                    ? ListView.builder(
                        itemCount:
                            value is HomeState ? value.listData!.length : 0,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 100,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: FadeInImage.assetNetwork(
                                      placeholder: 'images/user.png',
                                      image: value is HomeState
                                          ? value.listData![index].image ?? ""
                                          : ""),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(value is HomeState
                                          ? value.listData![index].firstName! +
                                              value.listData![index].lastName!
                                          : ""),
                                      Text(value is HomeState
                                          ? value.listData![index].email ?? ""
                                          : "")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        })
                    : GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                        ), itemBuilder: (context,index) {
                          return SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: FadeInImage.assetNetwork(
                                      placeholder: 'images/user.png',
                                      image: value is HomeState
                                          ? value.listData![index].image ?? ""
                                          : ""),
                                ),
                             Text(value is HomeState
                                      ? value.listData![index].firstName! +
                                      value.listData![index].lastName!
                                      : ""),

                           Text(value is HomeState
                                      ? value.listData![index].email ?? ""
                                      : "") ,


                              ],
                            ),
                          );
                },itemCount:  value is HomeState ? value.listData!.length : 0,),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    gridView = !gridView;
                  });
                },
                child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Image.asset('images/layout.png')),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  onBloc.eventController.sink.add(HomeEvent(page: pageList++));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(pageList.toString()),
                  ));
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      'Tải thêm',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      stateController: getLocator().stateController,
      showLoading: getLocator().loading,
    );
  }
}
