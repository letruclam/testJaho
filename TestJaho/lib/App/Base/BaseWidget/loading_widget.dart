
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  final bool? backgroundTransparent;
  final String? message;
  final Stream<bool> status;
  final Widget child;

  const Loading({
    Key? key,
    required this.status,
    required this.child,
    this.message,
    this.backgroundTransparent
  }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: widget.status,
        initialData: false,
        builder: (context, snapshot) {
          return Scaffold(
            body: Stack(
              children: <Widget>[
                widget.child,
                _loading(snapshot.data??false)
              ],
            ),
          );
        }
    );
  }

  Widget _loading(bool loading) {
    return loading == true ?
    Container(
      alignment: Alignment.center,
      color: widget.backgroundTransparent == true ? Colors.transparent : Colors.black54,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin:const EdgeInsets.only(left: 40,right: 40),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:  BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                      strokeWidth: 5.0,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Đang tải...",style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    ) : Container();
  }
}
