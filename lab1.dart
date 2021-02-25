class Exercise{
  String name;
  num weight;
  num count;
  // private 
  String _trainer = 'Roman';

//перевизначення toString
  @override
  String toString() => 'Вправа $name виконується з вагою $weight кг, $count разів';
  String check() => 'Вправа $name виконується з вагою $weight кг, $count разів';

//Constructor 1
  //Exercise(this.name, this.weight, this.count);
//constructor 2
  Exercise({this.name, this.weight, this.count});

//getter
  String get trainer => _trainer;
//setter
  void set trainer (String newName) => _trainer = newName;
}

main() 
{
//var exercise = Exercise('тяга в наклоне', 80,8);
   var exercise = Exercise(name: 'тяга в наклоні', count: 5, weight: 15);
   print(exercise.check());
   print(exercise);

   
//демонстрація роботи гетеру
  print(exercise.trainer);

//setter
  exercise.trainer = 'Ramen';
//демонстрація роботи сетеру
  print(exercise.trainer);
}