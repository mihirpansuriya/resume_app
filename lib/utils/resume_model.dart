import 'package:hive/hive.dart';

// flutter packages pub run build_runner build - command
part 'resume_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String address;
  @HiveField(3)
  String phone;
  @HiveField(4)
  String course;
  @HiveField(5)
  String school;
  @HiveField(6)
  String grade;
  @HiveField(7)
  String year;
  @HiveField(8)
  String cmpname;
  @HiveField(9)
  String jobTitle;
  @HiveField(10)
  String startDate;
  @HiveField(11)
  String endDate;
  @HiveField(12)
  String eneterDetais;
  @HiveField(13)
  String skill;
  @HiveField(14)
  String projectTitle;
  @HiveField(15)
  String description;
  @HiveField(16)
  String photo;
  NoteModel(
      this.name,
      this.description,
      this.course,
      this.address,
      this.phone,
      this.email,
      this.endDate,
      this.startDate,
      this.jobTitle,
      this.cmpname,
      this.eneterDetais,
      this.grade,
      this.projectTitle,
      this.school,
      this.skill,
      this.photo,
      this.year, );

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'email': email,
      'phone': phone,
      'skill': skill,
      'photo':photo,
      'projectTitle': projectTitle,
      'enterDetails': eneterDetais,
      'course':course,
      'school':school,
      'yaer':year,
      'grade':grade,
      'address':address,
      'jobTitle':jobTitle,
      'cmpName':cmpname,
      'startDate':startDate,
      'endDate':endDate,
    };
  }

  // Create Todo object from JSON
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(json['name'],
        json['description'],
        json['email'],
        json['phone'],
        json['skill'],
        json['projectTitle'],
        json['course'],
        json['school'],
        json['yaer'],
        json['grade'],
        json['address'],
        json['jobTitle'],
        json['cmpName'],
        json['startDate'],
        json['enterDetails'],
        json['endDate'],
        json['photo']);
  }
}
