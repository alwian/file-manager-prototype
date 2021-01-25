import 'package:flutter/cupertino.dart';

class Setting extends StatefulWidget {
  String title;
  bool setting;
  bool bottom;
  bool active = false;

  Setting(this.title, this.setting, this.bottom);

  @override
  State<StatefulWidget> createState() {
    return SettingState();
  }

}

class SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    if (widget.setting) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border(bottom: BorderSide(color: CupertinoColors.inactiveGray, width: !widget.bottom ? 1 : 0)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.title, style: TextStyle(fontSize: 14),),
              CupertinoSwitch(value: widget.active, activeColor: Color(0xFF3b9afc), onChanged: (bool) {
                setState(() {
                  widget.active = !widget.active;
                });
              },)
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(
          top: 60,
          bottom: 5,
          left: 16
        ),
        child: Text(
            widget.title.toUpperCase(),
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            fontSize: 14
          ),
        ),
      );
    }
  }

}
class SettingsPage extends StatelessWidget {
  List<Setting> settings = [
    Setting('Security', false, false),
    Setting('App Passcode Lock', true, false),
    Setting('Secret Passcode', true, false),
    Setting('Use Touch ID Default', true, true),
    Setting('Swipe Down', false, false),
    Setting('Use Swipe Down to Close', true, false),
    Setting('Use Swipe Down on Full Screen', true, false),
    Setting('Use Swipe Down on Camera', true, true),
    Setting('3D Touch', false, false),
    Setting('Use Peek and Pop', true, true),
    Setting('File Transfer', false, false),
    Setting('Use WiFi Only', true, true),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Color(0xFF2F539A),
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Color(0xFF2F539A),
          automaticallyImplyLeading: true,
          automaticallyImplyMiddle: true,
          previousPageTitle: 'More',
          middle: Text('Settings', style: TextStyle(color: CupertinoColors.white),),
          trailing: GestureDetector(onTap: () => Navigator.of(context).pop(), child: Text('Done', style: TextStyle(color: CupertinoColors.white),),),
        ),
        child: ListView.builder(itemCount: settings.length ,itemBuilder: (context, index) {
              return settings[index];
        })
     );
  }
}
