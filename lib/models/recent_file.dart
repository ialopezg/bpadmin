class RecentFile {
  RecentFile(
    this.title, {
    required this.icon,
    this.date = '',
    this.size = '0.0 KB',
  });

  final String title;
  final String icon;
  final String date;
  final String size;
}

List recentFiles = [
  RecentFile(
    'XD File',
    icon: 'assets/icons/xd_file.svg',
    date: '01-03-2021',
    size: '3.5 MB',
  ),
  RecentFile(
    'Figma File',
    icon: 'assets/icons/figma_file.svg',
    date: '27-02-2021',
    size: '19.0 MB',
  ),
  RecentFile(
    'Document File',
    icon: 'assets/icons/doc_file.svg',
    date: '23-02-2021',
    size: '32.5 MB',
  ),
  RecentFile(
    'Sound File',
    icon: 'assets/icons/sound_file.svg',
    date: '21-02-2021',
    size: '3.5 MB',
  ),
  RecentFile(
    'Media File',
    icon: 'assets/icons/media_file.svg',
    date: '23-02-2021',
    size: '2.5 GB',
  ),
  RecentFile(
    "PDF File",
    icon: 'assets/icons/pdf_file.svg',
    date: '25-02-2021',
    size: '3.5 MB',
  ),
  RecentFile(
    'Excel File',
    icon: 'assets/icons/excel_file.svg',
    date: '25-02-2021',
    size: '34.5 MB',
  ),
];
