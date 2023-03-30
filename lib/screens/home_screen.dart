import 'package:flutter/material.dart';
import 'package:fstore/pages/acc_page.dart';
import 'package:fstore/pages/allUsersnFiles_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<Widget> pages = [const AllUsersPage(), AccountPage()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.image_outlined), label: "Все фото"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Аккаунт")
        ],
        currentIndex: currentIndex,
        onTap: ((value) {
          setState(() {
            currentIndex = value;
          });
        }),
      ),
      body: pages[currentIndex],
    );
  }
}
