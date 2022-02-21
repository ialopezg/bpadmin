import 'package:administrator/helpers/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StorageCard extends StatelessWidget {
  const StorageCard(
    this.title, {
    Key? key,
    required this.image,
    this.usedSpace = '0.0',
    this.fileCount = 0,
  }) : super(key: key);

  final String title;
  final String image;
  final String usedSpace;
  final int fileCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(height: 20.0, width: 20.0, child: SvgPicture.asset(image)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(
                    '$fileCount Files',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white70,
                        ),
                  )
                ],
              ),
            ),
          ),
          Text(usedSpace),
        ],
      ),
    );
  }
}
