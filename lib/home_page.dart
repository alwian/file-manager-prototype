import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fragments/local_fragment.dart';
import 'fragments/cloud_fragment.dart';
import 'fragments/share_fragment.dart';
import 'fragments/more_fragment.dart';

class _TabOption {
  final String title;
  final IconData icon;
  final Widget target;

  _TabOption(this.title, this.icon, this.target);
}
class HomePage extends StatefulWidget {
  List<_TabOption> navItems = [
    _TabOption('Local', CupertinoIcons.folder_solid, LocalFragment()),
    _TabOption('Cloud', Icons.cloud, CloudFragment()),
    _TabOption('Share', Icons.share, ShareFragment()),
    _TabOption('More', CupertinoIcons.ellipsis, MoreFragment()),
  ];

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          backgroundColor: Color.fromRGBO(240, 240, 243, 1),
          items: List.generate(
            widget.navItems.length,
            (index) {
              return BottomNavigationBarItem(
                title: Text(widget.navItems[index].title),
                icon: Icon(widget.navItems[index].icon)
              );
            }
          )
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: Color(0xFF2F539A),
                middle: Text(widget.navItems[index].title),
              ),
              child: widget.navItems[index].target,
            );
          },
        );
      },
    );
  }
}