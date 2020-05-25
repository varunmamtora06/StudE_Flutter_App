

class Todo{
  String title;
  String noteText;
  bool completed;

  Todo({
    this.title,
    this.noteText,
    this.completed = false,
  });

  Todo.fromMap(Map<String, dynamic> map) :

        this.title = map['title'],
        this.noteText=map['noteText'],
        this.completed = map['completed'];

  updateTitle(title){
    this.title = title;
    this.noteText=noteText;
  }

  Map toMap(){
    return {
      'title': this.title,
      'noteText':this.noteText,
      'completed': this.completed,
    };
  }
}