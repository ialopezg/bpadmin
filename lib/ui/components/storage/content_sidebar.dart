import 'package:administrator/helpers/app_constants.dart';
import 'package:administrator/ui/components/storage/storage_card.dart';
import 'package:administrator/ui/components/storage/storage_chart.dart';
import 'package:flutter/material.dart';

class ContentSidebar extends StatelessWidget {
  const ContentSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Storage Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: defaultPadding),
            StorageChart(),
            StorageCard(
              'Document Files',
              image: 'assets/icons/documents.svg',
              fileCount: 1328,
              usedSpace: '1.3 GB',
            ),
            StorageCard(
              'Media Files',
              image: 'assets/icons/media.svg',
              fileCount: 1584,
              usedSpace: '15.3 GB',
            ),
            StorageCard(
              'Other Files',
              image: 'assets/icons/folder.svg',
              fileCount: 2002,
              usedSpace: '1.3 GB',
            ),
            StorageCard(
              'Unknown',
              image: 'assets/icons/unknown.svg',
              fileCount: 140,
              usedSpace: '1.3 GB',
            ),
          ],
        ),
      );
}
