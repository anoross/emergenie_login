// import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class Dashboard extends StatefulWidget {
  static const String id = 'dashboard_screen';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
//        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Home'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          children: [
            IconButton(
                icon: Icon(
                  Icons.mail_outline,
                  size: 70.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                }),
            IconButton(
                icon: Icon(
                  Icons.surround_sound_outlined,
                  size: 70.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                }),
//            myItems(Icons.local_hospital_rounded, "BMR Calculator", 0xff2196f3),
            myItems(Icons.medical_services, "Medical Help", 0xff2196f3),
            myItems(Icons.art_track, "News & Blogs", 0xff2196f3)
          ],
          staggeredTiles: [
//          StaggeredTile.extent(2, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
          ],
        ),
      ),
    );
  }

  Material myItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 20,
      shadowColor: Colors.black87,
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    heading,
                    style: TextStyle(
                      color: new Color(color),
                      fontSize: 20,
                    ),
                  ),
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
