import 'package:flutter/material.dart';

class BaseDialog extends StatefulWidget {
  final Widget bodyDialog;

  const BaseDialog(
      {Key? key, required this.bodyDialog})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => BaseDialogState();
}

class BaseDialogState extends State<BaseDialog>{
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.bodyDialog,
      ),
    );
  }
}
