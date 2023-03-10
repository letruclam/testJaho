import 'package:flutter/material.dart';
import 'package:testjaho/App/Base/BaseWidget/text_normal.dart';


class DialogMessage extends StatefulWidget {
  final String message;

  const DialogMessage({Key? key, required this.message}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateDialogMessage();
  }
}

class StateDialogMessage extends State<DialogMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            color: Color(0xFF5598a9),
          ),
          child: const Center(
            child: Text('Notify',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          ),
        ),
        const SizedBox(height: 10,),
        Center(
          child: TextNormal(
            widget.message,
            textColor: Colors.black, fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}