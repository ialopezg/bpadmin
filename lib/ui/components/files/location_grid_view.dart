import 'package:administrator/helpers/app_constants.dart';
import 'package:administrator/models/storage_location.dart';
import 'package:administrator/ui/components/files/file_card.dart';
import 'package:flutter/material.dart';

class LocationGridView extends StatelessWidget {
  const LocationGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: locations.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileCard(info: locations[index]),
    );
  }
}
