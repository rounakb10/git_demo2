import 'package:flutter/material.dart';
import 'package:git_demo2/Screens/add_expense_screen.dart';
import 'package:git_demo2/Widgets/FAB.dart';

import 'Screens/add_income_screen.dart';
import 'Screens/dashboard_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/settings_screen.dart';
import 'Screens/transactions_screen.dart';

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

  Animation<Color> _bgColor;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

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
    _bgColor = ColorTween(begin: null, end: Color(0x90000000))
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
        color: _bgColor.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 50),
                innerFab(
                  Icons.trending_up,
                  () {
                    print('Opening AddIncome');
                  },
                  AddIncomeScreen(),
                  'Add Income',
                ),
                innerFab(
                  Icons.trending_down,
                  () {
                    print('Opening AddExpense');
                  },
                  AddExpenseScreen(),
                  'Add Expense',
                ),
//                innerFab(
//                  Icons.pause,
//                  () {
//                    print('Pausing');
//                  },
//                  AddExpenseScreen(),
//                ),
                SizedBox(width: 50),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            mainFab(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
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

  Transform mainFab() {
    return Transform(
      transform:
          Matrix4.rotationZ(getRadiansFromDegrees(rotationAnimationFab.value)),
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
        },
      ),
    );
  }

  Transform innerFab(
      IconData icon, Function onClick, Widget page, String tooltipText) {
    return Transform(
      transform:
          Matrix4.rotationZ(getRadiansFromDegrees(rotationAnimation.value))
            ..scale(degOneTranslationAnimation.value),
      alignment: Alignment.center,
      child: FAB(
        color: Colors.blue,
        width: 50,
        height: 50,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onClick: onClick,
        page: AddExpenseScreen(),
        tooltipText: tooltipText,
      ),
    );
  }

  MaterialButton appBarButton(
      Widget screen, int index, String str, IconData icon) {
    return MaterialButton(
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
