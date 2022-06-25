import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tokopedia_clone/components/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:tokopedia_clone/screen/cart.dart';
import 'package:tokopedia_clone/screen/feed.dart';
import 'package:tokopedia_clone/screen/akun.dart';

class MainPage extends StatefulWidget {
  @override 
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int bottomNavbarIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavbarIndex = 0;
    pageController = PageController(initialPage: bottomNavbarIndex);
  }

  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              color: mainColor,
              axisDirection: AxisDirection.right,
              child: PageView(
                controller: pageController,
                onPageChanged: (index){
                  setState((){
                    bottomNavbarIndex = index;
                  });
                },
                children: [
                  //HomePage(),
                  //FeedPage(),
                  //OfficialStorePage(),
                  CartPage(),
                  AkunPage(),
                ],
              ),
            ),
          ),
          customBottomBar()
        ],
      ),
    );
  }

  Widget customBottomBar() => Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: (bottomNavbarIndex == 3)
            ? Colors.transparent
            : Colors.black.withOpacity(0.05),
          spreadRadius: 5,
          blurRadius: 20,
          offset: Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: mainColor,
        unselectedItemColor: accentColor3,
        showUnselectedLabels: true,
        currentIndex: bottomNavbarIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            bottomNavbarIndex = index;
            pageController.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Container(
              height: 24,
              margin: EdgeInsets.only(bottom: 2),
              child: SvgPicture.asset((bottomNavbarIndex == 0)
                  ? "assets/icons/home_selected.svg"
                  : "assets/icons/home.svg"),
              ),
            ),
            BottomNavigationBarItem(
              label: "Feed",
              icon: Container(
                height: 24,
                margin: EdgeInsets.only(bottom: 2),
                child: SvgPicture.asset((bottomNavbarIndex == 1)
                  ? "assets/icons/feed_selected.svg"
                  : "assets/icons/feed.svg"),
                ),
              ),
              BottomNavigationBarItem(
                label : "official store",
                icon: Container(
                  height: 24,
                  margin: EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset((bottomNavbarIndex == 2)
                    ? "assets/icons/official_selected.svg"
                    : "assets/icons/official.svg"), 
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Keranjang",
                  icon: Container(
                    height: 24,
                    margin: EdgeInsets.only(bottom: 2),
                    child: SvgPicture.asset(
                      (bottomNavbarIndex == 3)
                      ? "assets/icons/keranjang_selected.svg"
                      : "assets/icons/keranjang.svg",
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Akun",
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 2),
                    height: 24,
                    child: SvgPicture.asset(
                      (bottomNavbarIndex == 4)
                        ? "assets/icons/akun_selected.svg"
                        : "assets/icons/akun.svg",
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
      
  
  
