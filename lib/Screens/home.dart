import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'home_screen.dart';
import 'settings_screen.dart';
import 'transactions_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
//  final List<Widget> screens = [
//    HomeScreen(),
//    DashboardScreen(),
//    TransactionsScreen(),
//    SettingsScreen(),
//  ];

  Widget currentScreen = HomeScreen();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
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
      color: Colors.black,
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
