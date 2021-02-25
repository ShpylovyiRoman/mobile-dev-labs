mixin Hi{
  String hi() => 'Hello world'; 
}
class SexyAdder with Hi {
  String person;
  static Map<String, SexyAdder> _cache;

  factory SexyAdder(String name) {
    if (_cache == null) {
      _cache = {};
    }
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      String newName = 'sexy' + name;
      var sexyAdder = new SexyAdder._construct(newName);
      _cache[name] = sexyAdder;
      return sexyAdder;
    }
  }
  SexyAdder._construct(this.person);
  @override
  String toString() => '$person';
}

main() 
{
// Оператори "синтаксичного цукру". Наприклад оператор "??="
  int age = 30;
  age >= 18 ? print('Повнолітній') : print('Неповнолітній');
  int experience;
  print(experience);
  experience ??= age - 18;
  print(experience);

  var salary = experience ??'no salary';
  print(salary);

// Використання лямбда-функцій, замикань
  var version = () => print('Version 1.1');
  version(); 

  Function kiloMaker (num base) {
    return (num i) => i * base * 1000;
  }

var kiloGram = kiloMaker(1);
var tonna = kiloMaker(1000);

print(kiloGram(5));
print(tonna(5));

// Використання параметрів за замовчуванням

double sale1 (price, bonus, [extraSale = 0]){
  //Ціна мінус знижка у відсотках мінус бонусний рахунок 
  return price - price*(extraSale/100)- bonus; 
}

double sale2 ({price, bonus, extraSale = 0}){
  //Ціна мінус знижка у відсотках мінус бонусний рахунок 
  return price - price*(extraSale/100)- bonus; 
}

var buy1 = sale1(100, 5);
print(buy1);
var buy2 = sale2(price: 200, bonus: 50, extraSale: 15);
print(buy2);

// Фабричний конструктор 

var newRoman1 = SexyAdder('Roman');
print(newRoman1);

var newRamen = SexyAdder('Ramen');
print(newRamen);

var newRoman2 = SexyAdder('Roman');
print(newRoman2);

//перевіряємо чи спрацював кеш
print(identical(newRoman1, newRoman2));

// Конструктор ініціалізації виконано у попередньому файлі
// Використання міксинів

print(newRoman1.hi());

// Використання ключового слова assert

  assert(age >= 21);
  print('Продали алкоголь в Америці');

// Робота з колекціями
  var list = [10, 20, 30, 40];
  print(list[1]);
  list.addAll([50, 60, 70, 80]);
  print(list.length);
  var list2 = [ 1, 2, 3, ...?list, 6];
  print(list2);


  var sett ={'1', '2', '17'};
  var emptySet = <String>{}; // пустий сет
  print(emptySet);
  sett.add('3');
  print(sett.length);

  var map = {1: 'wifi 802.08', 2: 'bluetooth 5.0'};
  map.forEach((key, value)=> print('$key:$value'));
}