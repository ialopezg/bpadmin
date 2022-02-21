import 'package:administrator/ui/components/sidebar/sidebar.dart';
import 'package:administrator/ui/views/dashboard_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Expanded(child: Sidebar()),
              Expanded(flex: 5, child: DashboardView()),
            ],
          ),
        ),
      );
}
