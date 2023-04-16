import 'package:flutter/material.dart';

class MyAppbar extends AppBar {
  MyAppbar({super.key, double elevation = 1})
      : super(
          elevation: elevation,
          title: Image.asset('assets/images/logo.png', width: 80),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.white12,
              height: 1,
            ),
          ),
        );
}
