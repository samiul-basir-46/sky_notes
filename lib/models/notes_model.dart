class NotesModel {
  final String title;
  final String description;
  final DateTime createdDate;
  final DateTime? updatedTime;

  NotesModel({
    required this.title,
    required this.description,
    required this.createdDate,
    this.updatedTime
  });
}
