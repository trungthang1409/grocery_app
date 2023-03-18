import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addresstextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  text: 'Hi, ',
                  style: const TextStyle(color: Colors.cyan, fontSize: 27, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Trung Thang',
                      style: TextStyle(color: color, fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              TextWidget(
                color: color,
                text: 'trungthang@gmail.com',
                textSize: 18,
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              _listTitle(
                title: 'Address',
                subtitle: 'My Address',
                icon: IconlyLight.profile,
                onPressed: () async {
                  await showAddressDialog();
                },
                color: color,
              ),
              _listTitle(
                title: 'Orders',
                icon: IconlyLight.bag2,
                onPressed: () {},
                color: color,
              ),
              _listTitle(
                title: 'Wishlist',
                icon: IconlyLight.heart,
                onPressed: () {},
                color: color,
              ),
              _listTitle(
                title: 'Viewed',
                icon: IconlyLight.show,
                onPressed: () {},
                color: color,
              ),
              _listTitle(
                title: 'Foget Password',
                icon: IconlyLight.unlock,
                onPressed: () {},
                color: color,
              ),
              SwitchListTile(
                title: TextWidget(
                  color: color,
                  text: themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
                  textSize: 22,
                ),
                secondary: themeState.getDarkTheme ? Icon(Icons.dark_mode_outlined) : Icon(Icons.light_mode_outlined),
                onChanged: (value) {
                  setState(() {
                    themeState.setDarkTheme = value;
                  });
                },
                value: themeState.getDarkTheme,
              ),
              _listTitle(
                title: 'Logout',
                icon: IconlyLight.logout,
                onPressed: () async {
                  await showLogOutDialog();
                },
                color: color,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _listTitle({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        color: color,
        text: title,
        textSize: 22,
      ),
      subtitle: TextWidget(
        color: color,
        text: subtitle == null ? '' : subtitle,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }

  Future<void> showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              controller: _addresstextcontroller,
              onChanged: (value) {
                // _addresstextcontroller.text;
              },
              // maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Your address',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Update'),
              )
            ],
          );
        });
  }

  Future<void> showLogOutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'images/warning_sign.jpg',
                  width: 20,
                  height: 20,
                  fit: BoxFit.fill,
                ),
                const Text('Sign Out')
              ],
            ),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    child: TextWidget(
                      color: Colors.cyan,
                      text: 'Cancel',
                      textSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: TextWidget(
                      color: Colors.red,
                      text: 'OK',
                      textSize: 18,
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }
}
