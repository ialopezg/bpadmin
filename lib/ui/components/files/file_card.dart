import 'package:administrator/helpers/app_constants.dart';
import 'package:administrator/models/storage_location.dart';
import 'package:administrator/ui/components/progress_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FileCard extends StatelessWidget {
  const FileCard({Key? key, required this.info}) : super(key: key);

  final StorageLocation info;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(defaultPadding * 0.75),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: info.color.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SvgPicture.asset(
                    info.image,
                    color: info.color,
                  ),
                ),
                const Icon(Icons.more_vert, color: Colors.white54)
              ],
            ),
            Text(info.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            ProgressLine(color: info.color, percentage: info.percentageUsed),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${info.files} Files",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.white70),
                ),
                Text(
                  info.capacity,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      );
}
