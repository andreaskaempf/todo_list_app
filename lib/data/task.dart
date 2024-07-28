class Task {
  final String name;
  final String description;
  /*final DateTime created;
    final DateTime due;
    final bool done;
     DateTime completed;*/

  const Task(this.name, this.description);
}

class FakeTaskList {
  // Initial dummy list of tasks
  final List<Task> _tasks = [
    const Task("Install pumps", "Install bilge pumps in windows"),
    const Task("Plug leaks", "Fill leaks in basement"),
    const Task("Cut wood", "Cut up wood in garden"),
    const Task("Fix picture", "Fix picture frame in living room"),
  ];

  // Add a task
  void addTask(Task task) {
    _tasks.add(task);
  }

  // Update a task in the list
  void updateTask(Task task) {
    final i = _tasks.indexWhere((e) => e.name == task.name);
    if (i != -1) {
      _tasks[i] = task;
    }
  }

  // Return a list of all tasks, sorted by name
  List<Task> getAllTasks() {
    _sortTasksByName();
    return _tasks;
  }

  // Sort tasks by name
  void _sortTasksByName() {
    _tasks.sort((a, b) => a.name.compareTo(b.name));
  }
}