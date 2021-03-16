// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_app_mvvm/res/colors/colors.dart';
import 'package:vet_app_mvvm/views/appointments.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  late DateTime currentBackPressTime;

  List<String> _pageTitles = <String>["Dashboard", "Appointments", "Payments", "Reports"];

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();

    if (_selectedIndex != 0){
      setState(() {
        _selectedIndex = 0;
      });
      return Future.value(false);
    } else {
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 3)) {
        currentBackPressTime = now;
        print("Press again to leave app");

        // // Show toast
        // Fluttertoast.showToast(
        //     msg: "Press back again to exit",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: colorSecondary,
        //     textColor: Colors.white,
        //     fontSize: 16.0
        // );

        return Future.value(false);
      }
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [];

    Appointments _appointments = new Appointments();
    _appointments.build(context);

    // Add pages to widgets list
    _widgetOptions.add(_appointments);
    _widgetOptions.add(_appointments);
    _widgetOptions.add(_appointments);
    _widgetOptions.add(_appointments);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorSecondary,
          elevation: 0,
          title: Text(
            _pageTitles.elementAt(_selectedIndex),
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      backgroundColor: colorMutedBg,
      body: WillPopScope(
        child: Container(
          color: colorGrayLight,
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        onWillPop: onWillPop,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Dashboard",
              backgroundColor: Color(0xfff8a519)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.timelapse),
              label: 'Appointments',
              backgroundColor: Color(0xfff8a519)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: "Payments",
              backgroundColor: Color(0xfff8a519)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_copy),
              label: 'Reports',
              backgroundColor: Color(0xfff8a519)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: colorPrimary,
        unselectedItemColor: Colors.grey[300],
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),

        // bottomNavigationBar: BottomNavyBar(
        //   selectedIndex: _selectedIndex,
        //   showElevation: true, // use this to remove appBar's elevation
        //   onItemSelected: (index) => setState(() {
        //     _selectedIndex = index;
        //   }),
        //   items: [
        //     BottomNavyBarItem(
        //       icon: Icon(Icons.apps),
        //       title: Text(_pageTitles[_selectedIndex]),
        //       activeColor: colorSecondary,
        //       inactiveColor: colorPrimary
        //     ),
        //     BottomNavyBarItem(
        //       icon: Icon(Icons.timelapse),
        //       title: Text(_pageTitles[_selectedIndex]),
        //       activeColor: colorSecondary,
        //       inactiveColor: colorPrimary
        //     ),
        //     BottomNavyBarItem(
        //       icon: Icon(Icons.money),
        //       title: Text(_pageTitles[_selectedIndex]),
        //       activeColor: colorSecondary,
        //       inactiveColor: colorPrimary
        //     ),
        //     BottomNavyBarItem(
        //       icon: Icon(Icons.file_copy),
        //       title: Text(_pageTitles[_selectedIndex]),
        //       activeColor: colorSecondary,
        //       inactiveColor: colorPrimary
        //     ),
        //   ],
        // )

      // bottomNavigationBar: FancyBottomNavigation(
      //   circleColor: colorSecondary,
      //   textColor: colorSecondary,
      //   initialSelection: _selectedIndex,
      //   tabs: [
      //     TabData(
      //       iconData: Icons.home,
      //       title: _pageTitles[_selectedIndex]
      //     ),
      //     TabData(
      //         iconData: Icons.search,
      //         title: _pageTitles[_selectedIndex]
      //     ),
      //     TabData(
      //         iconData: Icons.payments,
      //         title: _pageTitles[_selectedIndex]
      //     ),
      //     TabData(
      //         iconData: Icons.shopping_cart,
      //         title: _pageTitles[_selectedIndex]
      //     )
      //   ],
      //   onTabChangedListener: (position) {
      //     setState(() {
      //       _selectedIndex = position;
      //     });
      //   },
      // )
    );
  }
}
