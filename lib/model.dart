class ToDo {
  final String? id;
  final String title;
  bool done;

  ToDo(this.id, this.title, this.done);

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(json['id'], json['title'], json['done']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'done': done};
  }
}
