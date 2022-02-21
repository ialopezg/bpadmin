import 'package:administrator/ui/components/sidebar/sidebar_item.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DrawerHeader(child: Image.asset('assets/images/logo-white.png')),
              DrawerListTile(
                'Dashboard',
                image: 'assets/icons/menu_dashboard.svg',
                onPressed: () {},
              ),
              DrawerListTile(
                'Transaction',
                image: 'assets/icons/menu_transaction.svg',
                onPressed: () {},
              ),
              DrawerListTile(
                'Tasks',
                image: 'assets/icons/menu_task.svg',
                onPressed: () {},
              ),
              DrawerListTile(
                'Documents',
                image: 'assets/icons/menu_doc.svg',
                onPressed: () {},
              ),
              DrawerListTile(
                'Store',
                image: 'assets/icons/menu_store.svg',
                onPressed: () {},
              ),
              const Divider(thickness: 1.0),
              DrawerListTile(
                'Notifications',
                image: 'assets/icons/menu_notification.svg',
                onPressed: () {},
              ),
              DrawerListTile(
                'Settings',
                image: 'assets/icons/menu_settings.svg',
                onPressed: () {},
              ),
              const Divider(thickness: 1.0),
              DrawerListTile(
                'Profile',
                image: 'assets/icons/menu_profile.svg',
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
}
