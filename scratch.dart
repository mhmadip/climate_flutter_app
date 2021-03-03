import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  // String task2Result = await task2();
  //task3(task2Result);
  print(task2());
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  String result;
  Duration duration = Duration(seconds: 3);
  //sleep(duration); Syncronus task
  //Async task
  await Future.delayed(duration, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('task 3 complete with $task2Data');
}
