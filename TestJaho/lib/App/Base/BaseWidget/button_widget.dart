import 'package:flutter/material.dart';



class ButtonWidget extends StatelessWidget {

  final VoidCallback? onPress;
  final String? text;
  final Color background;
  final double width;
  final double height;
  final Widget? icon;
  final bool disable;


   const ButtonWidget({Key? key,this.onPress, this.text, this.background = Colors.blue, this.width = double.maxFinite,
      this.height = 45, this.icon, this.disable = false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: disable ? Colors.black12 : background,
            borderRadius: const BorderRadius.all(
                Radius.circular(5))),
        child: icon ??  Text(text ?? "Đóng",style: const TextStyle(color:Colors.white, fontSize: 10 ),),
      ),
      onTap: () {
        if(!disable) {
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
          onPress?.call();
        }
      },
    );
  }
}