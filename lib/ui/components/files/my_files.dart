import 'package:administrator/helpers/app_constants.dart';
import 'package:administrator/models/storage_location.dart';
import 'package:flutter/material.dart';

import 'file_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('My Files', style: Theme.of(context).textTheme.subtitle1),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical: defaultPadding,
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.add_circle),
                label: const Text('Add New'),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          GridView.builder(
            shrinkWrap: true,
            itemCount: locations.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: defaultPadding,
              childAspectRatio: 1.4,
            ),
            itemBuilder: (context, index) => FileCard(info: locations[index]),
          ),
        ],
      );
}
