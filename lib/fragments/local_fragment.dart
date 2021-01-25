import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/pages/camera_roll_page.dart';
import 'package:prototype/pages/downloads_page.dart';

class PageOption {
  String title;
  IconData icon;
  Widget target;

  PageOption(this.title, this.icon, this.target);
}

class LocalFragment extends StatelessWidget {
  final List<PageOption> items = [
    PageOption('Folder', Icons.folder, null),
    PageOption('Secret', Icons.lock, null),
    PageOption('Camera Roll', Icons.camera_roll, CameraRollPage()),
    PageOption('Downloads', Icons.file_download, DownloadsPage()),
    PageOption('Quick Action', Icons.folder_special, null),
    PageOption('Favourites', Icons.favorite, null),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(16.0),
      crossAxisCount: 2,
      children: List.generate(items.length, (index) {
        return GestureDetector(
          onTap: () {
            if (items[index].target != null)
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => items[index].target,));
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: CupertinoColors.lightBackgroundGray, width: 3.0),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    items[index].icon,
                    size: 46,
                    color: CupertinoColors.black,
                  ),
                  Text(
                    items[index].title,
                    style: TextStyle(
                        fontSize: 18,
                        color: CupertinoColors.black
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      ),
    );
  }
}