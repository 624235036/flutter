import 'package:flutter/material.dart';
import 'package:flutterapp/src/pages/pages.dart';
import 'package:flutterapp/src/pages/scan/qp_scan_page.dart';
import 'package:flutterapp/src/pages/scan/qr_create_page.dart';

class AppRoute{
  static const homeRoute = "home";
  static const infoRoute = "info";
  static const loginRoute = "login";
  static const UpcomingMovieRoute = "upcoming";
  static const movieDetailRoute = "movie";
  static const videoRoute = "video";
  static const qrScanRoute = "qrscan";
  static const qrCreateRoute = "qrcreate";

  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => Homepage(),
    infoRoute: (context) => InfoPage(),
    loginRoute: (context) => LoginPage(),
    UpcomingMovieRoute: (context) => UpcomingMoviePage(),
    movieDetailRoute: (context) => MovieDetailPage(),
    videoRoute: (context) => VideoPage(),
    qrScanRoute: (context) => QRCodeScanPage(),
    qrCreateRoute: (context) => QRCreatePage(),
  };

  get getAll => _route;
}//end class