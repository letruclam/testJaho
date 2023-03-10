import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final String? imageName;
  final double size;
  final Function()? onTap;
  final Color? color;
  final bool isHidden;

  const IconWidget(this.imageName, {Key? key,this.size = 24, this.onTap, this.color, this.isHidden = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isHidden == true ? false : true,
      child: InkWell(
          onTap: onTap == null ? null : () {
            if (FocusScope.of(context).hasFocus) {
              FocusScope.of(context).unfocus();
            }
            onTap?.call();
          },
          child: Image.asset(
            "images/$imageName",
            width: size,
            height: size,
            color: color,
          )),
    );
  }
}
