import 'package:get/get.dart';
import 'package:notepad/routes/route_names.dart';
import 'package:notepad/views/homeScreen/home_screen.dart';
import 'package:notepad/views/noteScreen/note.dart';

class RoutePages {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: RouteNames.home, page: () => HomeScreen()),
    GetPage(name: RouteNames.noteScreen, page: () => NoteScreen()),
  ];
}
