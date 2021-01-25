import 'package:flutter/material.dart';
import 'dart:math';

class File {
  String name;
  IconData icon;
  int size;

  File(this.name, this.icon) {
    size = Random().nextInt(100);
  }
}