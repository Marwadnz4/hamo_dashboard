bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String uid = 'userToken';
}

class DashboardTablesHeaderRow {
  static const List<String> bookedServicesHeaderRow = [
    'Services Name',
    'Service Presenter',
    'Price',
    'Cover',
    'Category',
    'Status',
    'Bookers',
  ];

  static const List<String> servicesHeaderRow = [
    'Services Name',
    'Service Presenter',
    'Price',
    'Cover',
    'Images',
    'Category',
    'Reviews',
    'Location',
    'Actions',
  ];

  static const List<String> categoriesHeaderRow = [
    'Category Name',
    'Cover',
    'Actions',
  ];

  static const List<String> bannersHeaderRow = ['Cover', 'Actions'];
}
