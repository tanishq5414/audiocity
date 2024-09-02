class IRoute{
  final String name;
  final String route;

  const IRoute(this.name, this.route);
}

class AppRoutes {
  static const IRoute recordAudio = IRoute('Audiocity', '/');
  static const IRoute listRecordings = IRoute('List Recordings', '/list-recordings');
  static const IRoute settings = IRoute('Settings', '/settings');
}