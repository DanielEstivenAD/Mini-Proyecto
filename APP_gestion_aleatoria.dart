import 'dart:io';

void main(List<String> args) {
  List<String?> aprendices = [];
  List<String?> listaTemas = [];
  List<String?> listaPredefinidaAprendices = [
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
  int option1,
      cantidadTemas,
      cantidadAprendices,
      cantIntentos,
      contadorCantidadIntentos;
  String? tema, aprendiz;

  //MENÚ PRINCIPAL
  do {
    print("Bienvenido al menu de gestion aleatoria de exposiciones");
    print("*" * 50);
    print("");
    print("1. agregar temas");
    print("2. agregar aprendices");
    print("3. utilizar listas predefinidas");
    print("4. Asignar aprendices a los temas");
    print("0. salir");
    print("");
    print("*" * 50);
    print("");
    print("digite la opcion");
    option1 = int.parse(stdin.readLineSync()!);
    switch (option1) {
      case 1:
        print("cuantos temas agregará");
        cantidadTemas = int.parse(stdin.readLineSync()!);
        for (var i = 0; i < cantidadTemas; i++) {
          print("nombre del tema");
          tema = stdin.readLineSync();
          listaTemas.add(tema);
        }
        break;
      case 2:
        print("cuantos aprendices agregará");
        cantidadAprendices = int.parse(stdin.readLineSync()!);
        for (var i = 0; i < cantidadAprendices; i++) {
          print("nombre del tema");
          aprendiz = stdin.readLineSync();
          aprendices.add(aprendiz);
        }
        break;
      case 3:
        print("Las listas predefinidas son las siguientes:");
        print("La lista de temas es:");
        print(listaTemasPredefinida);
        print("La Lista de aprendices es:");
        print(listaPredefinidaAprendices);
        print("*" * 20);
        for (var i = 0; i < listaTemasPredefinida.length; i++) {
          print("Indique la complejidad del tema ${listaTemasPredefinida[i]}");
        }
        break;
      case 4:
        if (aprendices.length <= 0 || listaTemas.length <= 0) {
          print(
              "las listas no están asignadas manualmente, intentelo de nuevo");
        } else {}
        break;
    }
  } while (option1 != 0);
}
