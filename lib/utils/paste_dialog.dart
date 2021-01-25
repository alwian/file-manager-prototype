import 'dart:math';
import 'file.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class PasteAlert extends StatefulWidget {
  final File file;

  PasteAlert(this.file);

  @override
  State<StatefulWidget> createState() {
    return PasteAlertState();
  }
}

class PasteAlertState extends State<PasteAlert> {
  int pasteProgress = 0;
  Timer timer;

  void timerFunction() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (pasteProgress >= widget.file.size) {
        timer.cancel();
        Navigator.of(context).pop(true);
      } else {
        setState(() {
          pasteProgress += min(5, widget.file.size - pasteProgress);
        });
      }
    });
  }

  @override
  void initState() {
    timerFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('File Copy'),
      actions: <Widget>[
        CupertinoDialogAction(child: Text('Cancel'), onPressed:  () {
          timer.cancel();
          Navigator.of(context).pop(false);
        },)
      ],
      content: Column(
        children: <Widget>[
          Text(widget.file.name),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CupertinoActivityIndicator(animating: true, radius: 18,),
          ),
          Text(pasteProgress.toString() + '/' + widget.file.size.toString() + 'kb')
        ],
      ),
    );
  }
}