import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymoviebloc/feature/core/presentation/screens/on_dev_screen.dart';
import 'package:mymoviebloc/feature/movie/presentation/screens/movie_screen.dart';
import 'package:mymoviebloc/utils/images.dart';
import 'package:mymoviebloc/utils/styles.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  void _setIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const MovieScreen();
      case 1:
        return const OnDevScreen();
      case 2:
        return const OnDevScreen();
      default:
        return const OnDevScreen();
    }
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: whiteColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: greyColor,
      currentIndex: _currentIndex,
      onTap: _setIndex,
      items: _bottomNavigationBarItems(),
    );
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems() {
    return [
      const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage(Images.movieIcon),
          size: 30,
        ),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage(Images.ticketIcon),
        ),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage(Images.bookmarkIcon),
        ),
        label: '',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: buildBottomNavigationBar(),
      body: _buildBody(),
      appBar: AppBar(
        leading: IconButton(
          icon: ClipOval(
            child: Image.asset(
              Images.hamburgerIcon,
              fit: BoxFit.cover,
              height: 30.sp,
              width: 30.sp,
            ),
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          "FilmKu",
          style: blackTextStyle.merge(
            semiBoldStyle,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 14),
            child: IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: blackColor,
                size: 28,
              ),
              onPressed: () {
                // Add your onPressed code here!
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Center(
                child: Text(
                  'John Doe',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class OnDevScreen extends StatelessWidget {
//   const OnDevScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         "ON DEV",
//         style: blackTextStyle,
//       ),
//     );
//   }
// }
