import 'package:administrator/helpers/app_constants.dart';
import 'package:flutter/material.dart';

class StorageLocation {
  StorageLocation(
    this.name, {
    required this.image,
    this.capacity = '2.0 GB',
    this.files = 0,
    this.percentageUsed = 0.0,
    this.color = primaryColor,
  });

  final String name;
  final String image;
  final String capacity;
  final int files;
  final double percentageUsed;
  final Color color;
}

List locations = [
  StorageLocation(
    'Documents',
    image: 'assets/icons/documents.svg',
    capacity: '20.0 GB',
    files: 132803,
    percentageUsed: 35.0,
  ),
  StorageLocation(
    'Google Drive',
    image: 'assets/icons/google_drive.svg',
    capacity: '15.0 GB',
    files: 101201,
    percentageUsed: 85.0,
    color: const Color(0xFFFFA113),
  ),
  StorageLocation(
    'Onedrive',
    image: 'assets/icons/onedrive.svg',
    files: 1328,
    percentageUsed: 71.0,
    color: const Color(0xFFA4CDFF),
  ),
  StorageLocation(
    'Dropbox',
    image: 'assets/icons/dropbox.svg',
    files: 136384,
    percentageUsed: 81.0,
    color: const Color(0xFF007EE5),
  ),
];
