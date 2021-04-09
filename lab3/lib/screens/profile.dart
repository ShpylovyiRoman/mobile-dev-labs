import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:hello_flutter/model.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'RobotoMono'),
      home: ChangeNotifierProvider(
        create: (_) => TasksProvider(),
        child: TickerSetter(),
      ),
    );
  }
}

class TickerSetter extends StatefulWidget {
  @override
  _TickerSetterState createState() => _TickerSetterState();
}

class _TickerSetterState extends State<TickerSetter> {
  List<Task> tasks = [
    Task("Homework", false),
    Task("Play football", false),
    Task("Clean window", false),
    Task("Go to the shop", false),
    Task("Drope table", false),
    Task("Call my mum", false)
  ];

  @override
  Widget build(BuildContext context) {
    var selectedTasks = tasks.where((element) => element.selected);

    return Scaffold(
      appBar: AppBar(
        title: Text("To do list"),
        backgroundColor: Colors.redAccent[400],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Provider.of<TasksProvider>(context, listen: false).len();},
        child: Icon(Icons.cached ),
        backgroundColor: Colors.redAccent[400]),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        
      body: Container(
        decoration: const BoxDecoration( image: DecorationImage(
          image: NetworkImage('https://www.planetware.com/wpimages/2020/01/india-in-pictures-beautiful-places-to-photograph-taj-mahal.jpg'),
          fit: BoxFit.cover,
          ),
),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: const BoxDecoration(color: Color(0xDDFFFFFF),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<TasksProvider>(builder: (context, data, child) {
                    return IconButton(icon: Icon(Icons.adb_sharp), onPressed: () { 
                      print(tasks.length);
                      // Provider.of<TasksProvider>(context, listen: false).len();
                     });             
                  },),
                  Text("Need to do today", style: Theme.of(context).textTheme.headline4, ),
                  ...tasks
                      .map(
                        (task) => TasksWidget(
                          task: task,
                          onChanged: (value) {
                            setState(() {
                              task.selected = value;
                            });
                          },
                        ),
                      )
                      .toList(),
                  Text(
                    "Tasks that is done: ",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          selectedTasks.toList()[index].name,
                        ),
                      ),
                      itemCount: selectedTasks.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TasksWidget extends StatelessWidget {
  final Task task;
  final Function onChanged;

  const TasksWidget({Key key, this.task, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: task.selected,
          onChanged: onChanged,
        ),
        Text(task.name)
      ],
    );
  }
}