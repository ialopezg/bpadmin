import 'package:administrator/ui/components/cards/profile_card.dart';
import 'package:administrator/ui/components/search_field.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Text('Dashboard', style: Theme.of(context).textTheme.headline6),
          const Spacer(flex: 2),
          const Expanded(child: SearchField()),
          const ProfileCard(),
        ],
      );
}
