class Tugas {
  int? id;
  String? title;
  String? description;
  String? deadline;

  Tugas({this.id, this.title, this.description, this.deadline});

  factory Tugas.fromJson(Map<String, dynamic> obj) {
    return Tugas(
      id: obj['id'],
      title: obj['title'],
      description: obj['description'],
      deadline: obj['deadline'],
    );
  }
}
