import 'package:flutter/material.dart';
import 'package:flutterapp/src/configs/app_route.dart';
class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function(BuildContext context) onTap;


  const Menu({
    this.title,
    this.icon,
    this.iconColor = Colors.grey,
    this.onTap,
  });
}


class MenuViewModel {
  MenuViewModel();


  List<Menu> get items => <Menu>[
    Menu(
      title: 'Profile',
      icon: Icons.person,
      iconColor: Colors.red,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.infoRoute);
      },
    ),
    Menu(
      title: 'Login',
      icon: Icons.lock,
      iconColor: Colors.blueGrey,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.loginRoute);
      },
    ),
    Menu(
      title: 'Map',
      icon: Icons.map,
      iconColor: Colors.blue,
      onTap: (context) {
        //Navigator.pushNamed(context, Constant.mapRoute);
      },
    ),
    Menu(
      title: 'Dashboard',
      icon: Icons.dashboard,
      iconColor: Colors.green,
      onTap: (context) {
        //todo
      },
    ),
    Menu(
      title: 'Timeline',
      icon: Icons.timeline,
      iconColor: Colors.pinkAccent,
      onTap: (context) {
        //todo
      },
    ),
    Menu(
      title: 'Settings',
      icon: Icons.settings,
      iconColor: Colors.brown,
      onTap: (context) {
        //todo
      },
    ),
    Menu(
      title: 'Upcoming Movie',
      icon: Icons.movie_creation,
      iconColor: Colors.pink,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.UpcomingMovieRoute);
        //todo
      },
    ),
  ];
}