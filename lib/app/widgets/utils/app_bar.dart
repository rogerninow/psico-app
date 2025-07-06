import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  DefaultAppBar(this.name, this.icon, this.function);

  final String name;
  final IconData icon;
  final Function()? function;

  @override
  Widget build(context) {
    return
      AppBar(
        title: Center(child: Text(name)),
        actions: [
          IconButton(
            onPressed: function,
            icon: Icon(icon, color: Colors.white, size: 30)
          ),
        ],
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

