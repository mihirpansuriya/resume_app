import 'package:hive/hive.dart';
import 'package:resume_app/utils/resume_model.dart';

class Boxes{
  static Box<NoteModel> getdata() => Hive.box<NoteModel>("notes");
}