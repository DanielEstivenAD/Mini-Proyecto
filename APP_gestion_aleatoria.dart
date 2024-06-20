import 'dart:io';

void main(List<String> args) {
  List<String?> aprendices = [];
  List<String?> listaTemas = [];
  List<String?> listaPredefinida = [
    'juan',
    'daniel',
    'felipe',
    'alejandro',
    'camilo',
    'alexander',
    'jacobo',
    'mateo',
    'pablo',
    'andres',
    'estiven',
    'tomas',
    'pepe',
    'gabriel',
    'jeferson',
    'samuel',
    'manuel',
    'posada',
    'jilian',
    'yeison',
    'teo'
  ];
  List<String?> listaTemasPredefinida = [
    'vectores',
    'vectores condicionales',
    'matrices',
    'matrices con metodos',
    'arreglos 3D',
    'vector de objetos'
  ];
  int option1;
  do {
    print("Bienvenido al menu de gestion aleatoria de exposiciones");
    print("*" * 50);
    print("");
    print("1. agregar temas");
    print("2. agregar aprendices");
    print("3. utilizar listas predefinidas");
    print("4. salir");
    print("");
    print("*" * 50);
    print("");
    print("digite la opcion");
    option1 = int.parse(stdin.readLineSync()!);
    switch (option1) {
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      default:
        print("bye bye");
    }
  } while (option1 != 4);
  print("hey");

 //cambio
}
