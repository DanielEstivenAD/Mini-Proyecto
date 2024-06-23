import 'dart:io';

void main(List<String> args) {
  List<List<String?>> grupos = [];
  List<String?> aprendices = [];
  List<String?> listaTemas = [];
  List<String?> listaPredefinidaAprendices = [
    'ANDRES FELIPE SANCHEZ HURTADO',
    'ANGIE DAHIANA RIOS QUINTERO',
    'CRISTIAN ALVAREZ ARANZAZU',
    'DANIEL ESTIVEN ARBOLEDA DUQUE',
    'DAVID ANDRES MORALES GUAPACHA',
    'DAVID STIVEN OCAMPO LONDOÑO',
    'ESTEBAN REYES AGUDELO',
    'JACOBO GALVIS JIMENEZ',
    'JAIME ANDRES CALLE SALAZAR',
    'JEFERSON MAURICIO HERNANDEZ LADINO',
    'JHON ALEXANDER PINEDA OSORIO',
    'JOSE MIGUEL SIERRA ARISTIZABAL',
    'JOSÉ SEBASTIÁN OCAMPO LÓPEZ',
    'JUAN ANDRES OSORIO GOMEZ',
    'JUAN DIEGO CALVO OSORIO',
    'JUAN ESTEBAN LOPEZ CALLE',
    'JUAN PABLO RIOS ARISTIZABAL',
    'MARIA PAULA MELO SOLANO',
    'MIGUEL ANGEL PEÑA JIMENEZ',
    'SAMUEL CASTAÑO CARDONA',
    'JUAN JOSÉ POSADA PÉREZ',
    'ALEJANDRO SERNA LONDOÑO',
    'JUAN MANUEL ZULUAGA RINCON',
    'JUAN DANIEL GOMEZ LASERNA',
    'YERSON STIVEN HERRERA OBANDO',
    'MATEO HERRERA VARGAS',
    'ALEJANDRO VALLEJO ESCOBAR'
  ];
  List<String?> listaTemasPredefinida = [
    'exposicion 1',
    'exposicion 2',
    'exposicion 3',
    'exposicion 4',
    'exposicion 5',
    'exposicion 6',
    'exposicion 7',
    'exposicion 8'
  ];
  List<int> cantGruposPorExposicion = [
    3,
    3,
    3,
    3,
    3,
    4,
    4,
    4
  ]; // Lista de límites por exposición
  int option1,
      cantidadTemas,
      cantidadAprendices,
      cantIntentos,
      contadorCantidadIntentos,
      conteoAprendices = 0,
      limite;
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
        print("La lista de temas:");
        print(listaTemasPredefinida);
        print("La Lista de aprendices:");
        print(listaPredefinidaAprendices);
        print("*" * 20);
        // MENU DE ASIGNACIÓN DE GRUPOS
        print("Indique cuantos aprendices formarán grupo para el tema");
        print("Los grupos serán formados de 3 a 4 personas maximo");
        // Barajar la lista de aprendices de manera aleatoria
        listaPredefinidaAprendices.shuffle();
        // Crear los grupos con la lista aprendices ya rebuelta
        for (var i = 0; i < listaTemasPredefinida.length; i++) {
          limite = cantGruposPorExposicion[i];
               // Se utiliza para definir la posicion en la que se encuentra el vector cantGruposPorExposicion[i] y así poder saber cuantas personas se agregaran en el siguente grupo
          List<String?> grupo = []; //Vector para crear la matriz por fila
          for (var j = 0; j < limite; j++) {
            if (conteoAprendices < listaPredefinidaAprendices.length) {
              grupo.add(listaPredefinidaAprendices[conteoAprendices]);
              conteoAprendices++; // Conteo Aprendices, Vble tipo contador, para saber en que posición de listaPredefinidaAprendices va el proceso de asignaión
            }
          }
          grupos.add(grupo); //Se agrega la Fila (GRUPO CREADO) a la matriz
        }
        // Imprimir los grupos
        for (var i = 0; i < grupos.length; i++) {
          print('Grupo para ${listaTemasPredefinida[i]}:');
          print(grupos[i]);
          print('*' * 20);
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
