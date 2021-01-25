import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/utils/clipboard.dart';
import 'package:prototype/utils/file.dart';
import 'package:prototype/utils/paste_dialog.dart';

class CameraRollPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CameraRollPageState();
  }
}

class CameraRollPageState extends State<CameraRollPage> {
  List<File> _cameraRoll = List.generate(100, (index) => File('Image ' + index.toString(), Icons.image));


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFF2F539A),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color(0xFF2F539A),
        automaticallyImplyLeading: true,
        automaticallyImplyMiddle: true,
        previousPageTitle: 'Local',
        middle: Text('Camera Roll', style: TextStyle(color: CupertinoColors.white),),
      ),
      child: GestureDetector(
        onLongPress: () {
          Clipboard.filled ? showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoActionSheet(
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      child: Text('Paste'),
                      onPressed: () async {
                        File item = Clipboard.paste();
                        bool copy = true;
                        copy = await showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return PasteAlert(item);
                            }
                        );

                        if(copy) {
                          setState(() {
                            _cameraRoll.add(item);
                          });
                        } else {
                          Clipboard.copy(item);
                        }

                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              }
          ) : {};
        },
        child: GridView.count(
          padding: EdgeInsets.all(12.0),
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          crossAxisCount: 4,
          children: List.generate(_cameraRoll.length, (index) {
            return GestureDetector(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      Icon(_cameraRoll[index].icon, color: Colors.black, size: 72,),
                      Text(_cameraRoll[index].name, style: TextStyle(fontSize: 12),),
                    ],
                  )
              ),
              onTap: () {
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text(_cameraRoll[index].name + '\nSize: ' + _cameraRoll[index].size.toString()),
                        content: Icon(_cameraRoll[index].icon, size: 124, color: Colors.black,),
                        actions: <Widget>[
                          CupertinoDialogAction(child: Text('Close'), isDefaultAction: true, onPressed: () => Navigator.of(context).pop(),)
                        ],
                      );
                    }
                );
              },
              onLongPress: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        title: Text(_cameraRoll[index].name),
                        cancelButton: CupertinoActionSheetAction(child: Text('Cancel'), onPressed: () => Navigator.of(context).pop()),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: Text('View Attributes'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          CupertinoActionSheetAction(
                            child: Text('Copy'),
                            onPressed: () {
                              Clipboard.copy(_cameraRoll[index]);
                              Navigator.of(context).pop();
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text('Delete'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              showCupertinoDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: Text('Delete'),
                                      content: Text('Are you sure you wish to delete the file ' + _cameraRoll[index].name + '?'),
                                      actions: <Widget>[
                                        CupertinoDialogAction(child: Text('Cancel'), isDefaultAction: true, onPressed: () => Navigator.of(context).pop(),),
                                        CupertinoDialogAction(child: Text('Delete'), isDestructiveAction: true, onPressed: () {
                                          setState(() {
                                            _cameraRoll.removeAt(index);
                                            Navigator.of(context).pop();
                                          });
                                        },)
                                      ],
                                    );
                                  }
                              );
                            },
                            isDestructiveAction: true,
                          ),
                        ],
                      );
                    }
                );
              },
            );
          }),
        ),
      ),
    );
  }
}