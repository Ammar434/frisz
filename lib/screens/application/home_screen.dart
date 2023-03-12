import 'package:flutter/material.dart';
import 'package:frisz/models/custom_user.dart';
import 'package:frisz/provider/user_provider.dart';
import 'package:frisz/services/authentication_method.dart';
import 'package:frisz/widgets/loading_widget.dart';
import 'package:frisz/widgets/rounded_button.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Home',
      style: optionStyle,
    ),
    const Text(
      'Likes',
      style: optionStyle,
    ),
    const Text(
      'Search',
      style: optionStyle,
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Profile',
          style: optionStyle,
        ),
        RoundedButton(
            onTap: () {
              AuthenticationMethod().signOut();
            },
            text: "Log out")
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    CustomUser? customUser = Provider.of<UserProvider>(context).getUser;
    return customUser == null
        ? const LoadingWidget()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.grey[100]!,
                    color: Colors.black,
                    tabs: [
                      const GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        iconActiveColor: Colors.teal,
                        iconColor: Colors.black,
                        textColor: Colors.teal,
                        iconSize: 24,
                        icon: Icons.person,
                        leading: const CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(
                            'https://sooxt98.space/content/images/size/w100/2019/01/profile.png',
                          ),
                        ),
                        text: customUser.pseudo,
                      ),
                      const GButton(
                        icon: Icons.search,
                        text: 'Recherche',
                      ),
                      const GButton(
                        icon: Icons.menu,
                        text: 'Menu',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          );
  }
}
