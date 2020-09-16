import 'package:flutter/material.dart';

import 'dashboard_screen.dart';
import 'home_screen.dart';
import 'settings_screen.dart';
import 'transactions_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  Widget currentScreen = HomeScreen();
  final PageStorageBucket bucket = PageStorageBucket();

  AnimationController animationController;
  Animation degOneTranslationAnimation;
  Animation rotationAnimation;
  Animation rotationAnimationFab;
  Animation<Color> fabColor;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
//    degOneTranslationAnimation =
//        Tween(begin: 0.0, end: 1.0).animate(animationController);

    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0)
    ]).animate(animationController);

    rotationAnimation = Tween(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    rotationAnimationFab = Tween(begin: 180.0, end: 135.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    fabColor = ColorTween(begin: Colors.blue, end: Colors.red)
        .animate(animationController);

    super.initState();

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  Color _bgColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: Container(
        width: size.width,
        height: size.height,
        color: _bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //SizedBox(height: 3 * size.height / 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 50),
                Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegrees(rotationAnimation.value))
                    ..scale(degOneTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: FAB(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onClick: () {
                      print('Hello');
                    },
                  ),
                ),
                Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegrees(rotationAnimation.value))
                    ..scale(degOneTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: FAB(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.attach_money,
                      color: Colors.white,
                    ),
                    onClick: () {
                      print('Hello');
                    },
                  ),
                ),
                Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegrees(rotationAnimation.value))
                    ..scale(degOneTranslationAnimation.value),
                  alignment: Alignment.center,
                  child: FAB(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                    icon: Icon(
                      Icons.pause,
                      color: Colors.white,
                    ),
                    onClick: () {
                      print('Hello');
                    },
                  ),
                ),
                SizedBox(width: 50),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Transform(
              transform: Matrix4.rotationZ(
                  getRadiansFromDegrees(rotationAnimationFab.value)),
              alignment: Alignment.center,
              child: FAB(
                color: fabColor.value,
                width: 60,
                height: 60,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onClick: () {
                  if (animationController.isCompleted)
                    animationController.reverse();
                  else {
                    animationController.forward();
                  }
                  setState(() {
                    if (_bgColor == null) {
                      _bgColor = Color(0x90000000);
                    } else {
                      _bgColor = null;
                    }
                  });
                },
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
//        color: Colors.black,
        elevation: 0,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  appBarButton(HomeScreen(), 0, 'Home', Icons.home),
                  appBarButton(
                      DashboardScreen(), 1, 'Dashboard', Icons.dashboard),
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  appBarButton(TransactionsScreen(), 2, 'Transactions',
                      Icons.attach_money),
                  appBarButton(SettingsScreen(), 3, 'Settings', Icons.settings),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton appBarButton(
      Widget screen, int index, String str, IconData icon) {
    return MaterialButton(
      //color: Colors.black,
      minWidth: 40,
      onPressed: () {
        setState(() {
          currentScreen = screen;
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: currentIndex == index ? Colors.blue : Colors.grey,
          ),
          Text(
            str,
            style: TextStyle(
              color: currentIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  double getRadiansFromDegrees(double deg) {
    return deg / 57.295779513;
  }
}

class FAB extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;
  FAB({this.width, this.height, this.color, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(
        icon: icon,
        enableFeedback: true,
        onPressed: onClick,
      ),
    );
  }
}
