
import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const SimpleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.cyan,
              Colors.amber,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.mirror,
          ),
        ),
      ),
      backgroundColor: Colors.blue,
      title: const Text(
        'iFood',
        style: TextStyle(
          fontSize: 60,
          color: Colors.white,
          fontFamily: 'Lobster',
        ),
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
 Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
