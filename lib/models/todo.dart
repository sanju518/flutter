




class Todo{
  final String todo;
  final String DateTime;

  Todo({required this.DateTime, required this.todo});


  @override
  String toSting(){
    return 'Todo(DateTime: ${this.DateTime}, Todo: ${this.todo})';
  }
}