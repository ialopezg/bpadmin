import 'package:administrator/controllers/menu_controller.dart';
import 'package:administrator/helpers/responsive.dart';
import 'package:administrator/ui/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile_card.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          if (!Responsive.isDesktop(context))
            IconButton(
              onPressed: () {
                Provider.of<MenuController>(context, listen: false).toggleMenu();
              },
              icon: const Icon(Icons.menu_rounded),
            ),
          if (!Responsive.isMobile(context))
            Text('Dashboard', style: Theme.of(context).textTheme.headline6),
          if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
          const Expanded(child: SearchField()),
          const ProfileCard(),
        ],
      );
}
