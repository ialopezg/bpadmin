import 'package:administrator/helpers/app_constants.dart';
import 'package:administrator/ui/components/files/my_files.dart';
import 'package:administrator/ui/components/files/recent_files.dart';
import 'package:administrator/ui/components/header.dart';
import 'package:administrator/ui/components/storage/content_sidebar.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: <Widget>[
              const Header(),
              const SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: const <Widget>[
                        MyFiles(),
                        SizedBox(height: defaultPadding),
                        RecentFiles(),
                      ],
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  const Expanded(flex: 2, child: ContentSidebar()),
                ],
              ),
            ],
          ),
        ),
      );
}
