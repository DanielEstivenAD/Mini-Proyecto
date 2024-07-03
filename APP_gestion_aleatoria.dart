import 'dart:io';

void main(List<String> args) {
  List<List<String?>> grupos1 = [];
  List<List<String?>> grupos2 = [];
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
  List<int> cantGruposPorExposicion = [3, 3, 3, 3, 3, 4, 4, 4];
  List<int> cantGruposPorExposicion2 = []; // Lista de límites por exposición
  int option1,
      option2,
      option3,
      numero,
      cantidadTemas,
      cantidadAprendices,
      conteoAprendices1 = 0,
      conteoAprendices2 = 0,
      contador = 0,
      intentos,
      cantidad,
      limite,
      participantes;
  String? tema,
      aprendiz,
      cantidadInput,
      opcionCase1,
      opcionCase2,
      numeroInput,
      respuesta;
  //MENÚ PRINCIPAL
  do {
    print("*" * 50);
    print("Bienvenido al menu de gestion aleatoria de exposiciones");
    print("-" * 50);
    print("1. Agregar temas");
    print("2. Agregar aprendices");
    print("3. Utilizar listas predefinidas");
    print("4. Asignar aprendices a los temas");
    print("5. Salir");
    print("-" * 50);
    print("Digite la opcion");
    option1 = int.parse(stdin.readLineSync()!);
    print("*" * 50);
    print('');
    switch (option1) {
      case 1:
        while (listaTemas.isEmpty) {
          print("*" * 50);
          print("Menú para ingresar los Temas");
          print('-' * 50);
          print("¿Cuántos temas agregarás?");
          cantidadInput = stdin.readLineSync();
          print('-' * 50);
          if (cantidadInput == null || cantidadInput.isEmpty) {
            //if: si la lista "x" esta vacia
            //Esta parte del código verifica si cantidadInput es null o está vacío (isEmpty).
            print("No ingresaste ningún valor. Intenta nuevamente.");
            continue;
            /*Si el usuario no ingresa ningún valor (por ejemplo, solo presiona Enter sin escribir nada),
       se muestra un mensaje de error y *continue* hace que se vuelva a pedir la entrada de cantidad de temas.
        Esto evita errores si el usuario no ingresa nada.*/
          }
          try {
            // try y catch se utilizan para manejar errores que puedan ocurrir al intentar convertir cantidadInput de String a int utilizando int.parse().
            cantidadTemas = int.parse(cantidadInput);
          } catch (e) {
            print("Ingrese un número válido. Intenta nuevamente.");
            continue;
            /*Si int.parse() falla (por ejemplo, si el usuario ingresa algo que no es un número),
       el código dentro de catch se ejecuta. En este caso, muestra un mensaje de error y continue hace que se vuelva a solicitar la cantidad de temas.*/
          }
          for (var i = 0; i < cantidadTemas; i++) {
            print("Nombre del tema ${i + 1}:");
            tema = stdin.readLineSync();
            print('-' * 50);
            listaTemas.add(tema ??
                ""); // listaTemas.add(tema ?? "") agrega el valor de tema a listaTemas. Si tema es null, agrega una cadena vacía "".
            /* Después de que el usuario ingresa la cantidad de temas y sus nombres,
       este bucle for solicita cada nombre de tema y lo agrega a listaTemas.
       El ?? "" asegura que no se agreguen valores null a la lista, lo cual podría ocurrir si el usuario simplemente presiona Enter sin ingresar un nombre.*/
          }
          if (listaTemas.every((elemento) => elemento!.isEmpty)) {
            // every() es un método de la clase List que verifica si todos los elementos de la lista cumplen con cierta condición especificada por una función (element.isEmpty en este caso).
            print("La lista no tiene contenidos válidos. Intenta nuevamente.");
            listaTemas.clear();
            /*Después de que el usuario ingresa los nombres de los temas,
       este if verifica si todos los elementos de listaTemas son cadenas vacías (element.isEmpty).
       Si es así, muestra un mensaje de error y limpia la lista (listaTemas.clear()), lo que permite que el bucle while vuelva a solicitar los temas.*/
          }
        }

        print("La lista de temas es la siguiente:");
        print(listaTemas);
        print("");
        //CRUD
        do {
          print("*" * 50);
          print('Sub menú para modificar los temas ingresados');
          print('-' * 50);
          print("1. Crear tema");
          print("2. Leer temas");
          print("3. Actualizar tema");
          print("4. Eliminar tema");
          print("5. Salir");
          print("-" * 50);
          print("Seleccione una opción:");
          opcionCase1 = stdin.readLineSync();
          print('*' * 50);
          switch (opcionCase1) {
            case '1':
              // Crear tema
              print("Nombre del nuevo tema:");
              try {
                tema = stdin
                    .readLineSync()!
                    .trim(); // Se utiliza trim() para eliminar espacios en blanco al inicio y al final.
                if (tema.isEmpty) {
                  // si la variable "tema" esta vacia.
                  throw Exception(
                      "No ingresaste un nombre válido."); //throw exception, una excepcion. Lanzar una excepción detiene la ejecución normal del programa y pasa el control al bloque catch más cercano que pueda manejar esta excepción.
                }
                listaTemas.add(tema);
                print("-" * 50);
                print("Tema agregado.");
                print('');
              } catch (e) {
                //captura cualquier excepcion
                print(
                    "Error: ${e.toString()}. Intenta nuevamente."); //indica la excepcion y se agrega al throw
              }
              break;
            case '2':
              // Leer temas
              print("");
              print("La lista de temas es la siguiente:");
              print(listaTemas);
              print("");
              break;
            case '3':
              // Actualizar tema
              print('');
              print("¿Qué número de tema deseas actualizar?");
              numeroInput = stdin.readLineSync();
              try {
                numero = int.parse(numeroInput!);
              } catch (e) {
                print("Ingrese un número válido.");
                continue;
              }

              if (numero < 1 || numero > listaTemas.length) {
                print("Índice fuera de rango.");
                continue;
              }
              print('-' * 50);
              print("Ingrese el nuevo nombre del tema ${numero}:");
              tema = stdin.readLineSync();
              print('-' * 50);
              listaTemas[numero - 1] = tema;
              print("Tema actualizado.");
              print('');
              break;
            case '4':
              // Eliminar tema
              print('');
              print("¿Qué número de tema deseas eliminar?");
              numeroInput = stdin.readLineSync();
              try {
                numero = int.parse(numeroInput!);
              } catch (e) {
                print("Ingrese un número válido.");
                continue;
              }

              if (numero < 1 || numero > listaTemas.length) {
                print("Índice fuera de rango.");
                continue;
              }
              print('-' * 50);

              listaTemas.removeAt(numero -
                  1); //como las listas inician en 0, se necesita restar 1 para que tome el dato correcto en la posicion.
              print("Tema eliminado.");
              print('');
              /*Cuando llamas a removeAt(index), el método elimina el elemento en la posición index y 
              ajusta el tamaño de la lista en consecuencia. Todos los elementos después de index se desplazan una posición hacia la izquierda.*/
              break;
            case '5':
              // Salir
              print('');
              print("Saliendo...");
              print('');
              break;
            default:
              print('');
              print("Opción no válida. Intenta nuevamente.");
              print('');
          }
        } while (opcionCase1 != '5');
        break;
      case 2:
        while (aprendices.isEmpty) {
          print("*" * 50);
          print("Menú para ingresar aprendices");
          print('-' * 50);
          print("¿Cuántos aprendices agregarás?");
          cantidadInput = stdin.readLineSync();
          print('-' * 50);
          if (cantidadInput == null || cantidadInput.isEmpty) {
            print("No ingresaste ningún valor. Intenta nuevamente.");
            continue;
          }

          try {
            cantidadAprendices = int.parse(cantidadInput);
          } catch (e) {
            print("Ingrese un número válido. Intenta nuevamente.");
            continue;
          }

          for (var i = 0; i < cantidadAprendices; i++) {
            print("Nombre del aprendiz ${i + 1}:");
            aprendiz = stdin.readLineSync();
            aprendices.add(aprendiz ?? "");
            print('-' * 50);
          }

          if (aprendices.every((elemento) => elemento!.isEmpty)) {
            print("La lista no tiene contenidos válidos. Intenta nuevamente.");
            aprendices.clear();
          }
        }

        print("La lista de aprendices es la siguiente:");
        print(aprendices);
        print('');
        do {
          print('*' * 50);
          print('Sub menu para modificar la lista de aprendices');
          print('-' * 50);
          print("1. Crear aprendiz");
          print("2. Leer aprendices");
          print("3. Actualizar aprendiz");
          print("4. Eliminar aprendiz");
          print("5. Salir");
          print("-" * 50);
          print("Seleccione una opción:");
          opcionCase2 = stdin.readLineSync();
          print('*' * 50);
          switch (opcionCase2) {
            case '1':
              // Crear aprendiz
              print('');
              print("Nombre del nuevo aprendiz:");
              print("-" * 50);
              try {
                aprendiz = stdin.readLineSync()!.trim();
                if (aprendiz.isEmpty) {
                  throw Exception("No ingresaste un nombre válido.");
                }
                aprendices.add(tema);
                print("-" * 50);
                print("aprendiz agregado.");
              } catch (e) {
                print("Error: ${e.toString()}. Intenta nuevamente.");
              }
              print('');
              break;

            case '2':
              // Leer aprendices
              print('');
              print("La lista de aprendices es la siguiente:");
              print(aprendices);
              print('');
              break;

            case '3':
              // Actualizar aprendiz
              print("¿Qué número de aprendiz deseas actualizar?");
              numeroInput = stdin.readLineSync();
              print('-' * 50);
              try {
                numero = int.parse(numeroInput!);
              } catch (e) {
                print("Ingrese un número válido.");
                continue;
              }

              if (numero < 1 || numero > aprendices.length) {
                print("Índice fuera de rango.");
                print("*" * 50);
                continue;
              }

              print("Ingrese el nuevo nombre del aprendiz ${numero}:");
              aprendiz = stdin.readLineSync();
              print("-" * 50);
              aprendices[numero - 1] = aprendiz;
              print("Aprendiz actualizado.");
              print('');
              break;

            case '4':
              // Eliminar aprendiz
              print("¿Qué número de aprendiz deseas eliminar?");
              numeroInput = stdin.readLineSync();
              try {
                numero = int.parse(numeroInput!);
              } catch (e) {
                print("Ingrese un número válido.");
                continue;
              }

              if (numero < 1 || numero > aprendices.length) {
                print("Índice fuera de rango.");
                continue;
              }
              print('-' * 50);
              aprendices.removeAt(numero - 1);
              print("Aprendiz eliminado.");
              print('');
              break;

            case '5':
              // Salir
              print("");
              print("Saliendo...");
              print("");
              break;

            default:
              print("");
              print("Opción no válida. Intenta nuevamente.");
              print("");
          }
        } while (opcionCase2 != '5');
        break;
      case 3:
        print('-' * 50);
        print('');
        print("La lista de temas:");
        print(listaTemasPredefinida);
        print('');
        print('-' * 50);
        print('');
        print("La Lista de aprendices:");
        print(listaPredefinidaAprendices);
        print('');
        print("*" * 50);
        do {
          print('Sub menu para modificación de listas predefinidas');
          print('-' * 50);
          print('1. Para editar la lista de temas');
          print('2. Para editar la lista de aprendices');
          print('3. Para editar la cantidad de participantes por grupo');
          print('4. Salir');
          print('-' * 50);
          print("Digite la opción");
          option2 = int.parse(stdin.readLineSync()!);
          print("*" * 50);
          print('');
          switch (option2) {
            case 1:
              do {
                print('Lista de temas actual');
                print(listaTemasPredefinida);
                print('-' * 50);
                print('1. Para editar un tema');
                print('2. Para eliminar un tema');
                print('3. Para agregar un tema');
                print('4. Salir');
                print('-' * 50);
                print('Digite la opción');
                option3 = int.parse(stdin.readLineSync()!);
                print('*' * 50);
                switch (option3) {
                  case 1:
                    // Actualizar tema
                    print("");
                    print("¿Qué número de tema deseas actualizar?");
                    numeroInput = stdin.readLineSync();
                    try {
                      numero = int.parse(numeroInput!);
                    } catch (e) {
                      print("Ingrese un número válido.");
                      print("*" * 50);
                      continue;
                    }

                    if (numero < 1 || numero > listaTemasPredefinida.length) {
                      print("Índice fuera de rango.");
                      print("*" * 50);
                      continue;
                    }
                    print('-' * 50);
                    print("Ingrese el nuevo nombre del tema ${numero}:");
                    print('-' * 50);
                    tema = stdin.readLineSync();
                    listaTemasPredefinida[numero - 1] = tema;
                    print("Tema actualizado.");
                    print("");
                    break;
                  case 2:
                    // Eliminar un tema
                    print('');
                    print("¿Qué número de tema deseas eliminar?");
                    numeroInput = stdin.readLineSync();
                    try {
                      numero = int.parse(numeroInput!);
                    } catch (e) {
                      print("Ingrese un número válido.");
                      continue;
                    }

                    if (numero < 1 || numero > listaTemasPredefinida.length) {
                      print("Índice fuera de rango.");
                      continue;
                    }

                    listaTemasPredefinida.removeAt(numero - 1);
                    print("Tema eliminado.");
                    print('-' * 50);
                    break;
                  case 3:
                    // Agregar tema
                    print("Nombre del nuevo tema:");
                    try {
                      tema = stdin.readLineSync()!.trim();
                      if (tema.isEmpty) {
                        // si la variable "tema" esta vacia.
                        throw Exception("No ingresaste un nombre válido.");
                      }
                      listaTemasPredefinida.add(tema);
                      print("-" * 50);
                      print("Tema agregado.");
                      print('');
                    } catch (e) {
                      //captura cualquier excepcion
                      print(
                          "Error: ${e.toString()}. Intenta nuevamente."); //indica la excepcion y se agrega al throw
                    }
                    break;
                  case 4:
                    print('');
                    print("Volviendo al menu anterior");
                    print('');
                    break;
                  default:
                    print('');
                    print('Opción incorrecta, intentelo de nuevo');
                    print('');
                }
              } while (option3 != 4);
              break;
            case 2:
              do {
                print('Lista de aprendices actual');
                print(listaPredefinidaAprendices);
                print('-' * 50);
                print('1. Para editar un aprendiz');
                print('2. Para eliminar un aprendiz');
                print('3. Para agregar un aprendiz');
                print('4. Salir');
                print('-' * 50);
                print('Digite la opción');
                option3 = int.parse(stdin.readLineSync()!);
                print('-' * 50);
                switch (option3) {
                  case 1:
                    print("¿Qué número de aprendiz deseas cambiar?");
                    numeroInput = stdin.readLineSync();
                    try {
                      numero = int.parse(numeroInput!);
                    } catch (e) {
                      print("Ingrese un número válido.");
                      continue;
                    }

                    if (numero < 1 ||
                        numero > listaPredefinidaAprendices.length) {
                      print("Índice fuera de rango.");
                      print("*" * 50);
                      continue;
                    }

                    print("Ingrese el nuevo nombre del aprendiz ${numero}:");
                    aprendiz = stdin.readLineSync();
                    listaPredefinidaAprendices[numero - 1] = aprendiz;
                    print("Aprendiz actualizado.");
                    print("*" * 50);
                    break;
                  case 2:
                    print("¿Qué número de aprendiz deseas eliminar?");
                    numeroInput = stdin.readLineSync();
                    try {
                      numero = int.parse(numeroInput!);
                    } catch (e) {
                      print("Ingrese un número válido.");
                      continue;
                    }

                    if (numero < 1 ||
                        numero > listaPredefinidaAprendices.length) {
                      print("Índice fuera de rango.");
                      continue;
                    }

                    listaPredefinidaAprendices.removeAt(numero - 1);
                    print("Aprendiz eliminado.");
                    break;
                  case 3:
                    print("Nombre del nuevo aprendiz:");
                    try {
                      aprendiz = stdin.readLineSync()!.trim();
                      if (aprendiz.isEmpty) {
                        throw Exception("No ingresaste un nombre válido.");
                      }
                      listaPredefinidaAprendices.add(aprendiz);
                      print("*" * 50);
                      print("aprendiz agregado.");
                      print("*" * 50);
                    } catch (e) {
                      print("Error: ${e.toString()}. Intenta nuevamente.");
                    }
                    break;
                  default:
                    print("Opción incorrecta, intentelo de nuevo");
                }
              } while (option3 != 4);
              break;
            case 3:
              do {
                print('Lista de cantidad de participantes por grupo, actual');
                print(cantGruposPorExposicion);
                print('-' * 50);
                print('1. Para editar un grupo');
                print('2. Para eliminar un grupo');
                print('3. Para agregar un nuevo grupo');
                print('4. Salir');
                print('-' * 50);
                print('Digite la opción');
                print('-' * 50);
                option3 = int.parse(stdin.readLineSync()!);
                switch (option3) {
                  case 1:
                    print('Que número de grupo desea cambiar');
                    numeroInput = stdin.readLineSync();
                    try {
                      numero = int.parse(numeroInput!);
                    } catch (e) {
                      print("Ingrese un número válido.");
                      continue;
                    }

                    if (numero < 1 || numero > cantGruposPorExposicion.length) {
                      print("Índice fuera de rango.");
                      print("*" * 50);
                      continue;
                    }

                    print("Ingrese el nuevo nombre del aprendiz ${numero}:");
                    participantes = int.parse(stdin.readLineSync()!);
                    cantGruposPorExposicion[numero - 1] = participantes;
                    print("Aprendiz actualizado.");
                    print("*" * 50);
                    break;
                  case 2:
                    print("¿Qué número de grupo deseas eliminar?");
                    numeroInput = stdin.readLineSync();
                    try {
                      numero = int.parse(numeroInput!);
                    } catch (e) {
                      print("Ingrese un número válido.");
                      continue;
                    }

                    if (numero < 1 || numero > cantGruposPorExposicion.length) {
                      print("Índice fuera de rango.");
                      continue;
                    }

                    cantGruposPorExposicion.removeAt(numero - 1);
                    print("Grupo eliminado.");
                    break;
                  case 3:
                    print("numero para el nuevo grupo:");
                    try {
                      participantes = int.parse(stdin.readLineSync()!.trim());
                      if (participantes == 0) {
                        // si la variable "tema" esta vacia.
                        throw Exception("No ingresaste un nombre válido.");
                      }
                      cantGruposPorExposicion.add(participantes);
                      print("*" * 50);
                      print("Tema agregado.");
                      print("*" * 50);
                    } catch (e) {
                      //captura cualquier excepcion
                      print(
                          "Error: ${e.toString()}. Intenta nuevamente."); //indica la excepcion y se agrega al throw
                    }
                    break;
                  case 4:
                    print('');
                    print("Volviendo al menu anterior");
                    print('');
                    break;
                  default:
                    print('');
                    print('Opción incorrecta, intentelo de nuevo');
                    print('');
                }
              } while (option3 != 5);
              break;
            case 4:
              print('');
              print('volviendo al menú anterior');
              print('');
              break;
            default:
              print('');
              print('Opción incorrecta, intentelo de nuevo');
              print('');
          }
        } while (option2 != 5);
        break;
      case 4:
        do {
          print('Submenú para Generar los grupos');
          print('1. Si desea continuar y generarlos');
          print('2. Si desea salir');

          option2 = int.parse(stdin.readLineSync()!);

          switch (option2) {
            case 1:
              print(
                  'Desea utilizar las listas predefinidas para generar los grupos?');
              respuesta = stdin.readLineSync();
              if (respuesta!.toUpperCase() == 'SI') {
                print('Utilizará las listas predefinidas');
                print('-' * 50);
              } else if (respuesta == 'NO') {
                print('Utilizará las listas creadas');
              } else {
                print('Opcion incorrecta intentelo de nuevo');
                continue;
              }

              print("Confirme cuántos intentos desea realizar:");
              intentos = int.parse(stdin.readLineSync()!);
              do {
                grupos1 = [];
                grupos2 = [];
                conteoAprendices1 = 0;
                conteoAprendices2 = 0;
                if (respuesta.toUpperCase() == 'SI') {
                  listaPredefinidaAprendices.shuffle();

                  for (var i = 0; i < listaTemasPredefinida.length; i++) {
                    limite = cantGruposPorExposicion[i];
                    List<String?> grupo1 = [];

                    for (var j = 0; j < limite; j++) {
                      if (conteoAprendices1 <
                          listaPredefinidaAprendices.length) {
                        grupo1
                            .add(listaPredefinidaAprendices[conteoAprendices1]);
                        conteoAprendices1++;
                      }
                    }

                    grupos1.add(grupo1);
                  }

                  for (var i = 0; i < grupos1.length; i++) {
                    print('-' * 50);
                    print('Grupo para ${listaTemasPredefinida[i]}:');
                    print(grupos1[i]);
                  }
                  print('*' * 50);
                } else if (respuesta.toUpperCase() == 'NO') {
                  if (aprendices.length <= 0 || listaTemas.length <= 0) {
                    print(
                        "Las listas no están asignadas manualmente, inténtelo de nuevo");
                    continue;
                  }
                  for (var i = 0; i < listaTemas.length; i++) {
                    print(
                        'Indique cuántos integrantes tendrá el tema ${listaTemas[i]}');
                    cantidad = int.parse(stdin.readLineSync()!);
                    cantGruposPorExposicion2.add(cantidad);
                  }

                  print(listaTemas);
                  print(cantGruposPorExposicion2);
                  aprendices.shuffle();

                  for (var i = 0; i < listaTemas.length; i++) {
                    limite = cantGruposPorExposicion2[i];
                    List<String?> grupo2 = [];

                    for (var j = 0; j < limite; j++) {
                      if (conteoAprendices2 < aprendices.length) {
                        grupo2.add(aprendices[conteoAprendices2]);
                        conteoAprendices2++;
                      }
                    }

                    grupos2.add(grupo2);
                  }

                  for (var i = 0; i < grupos2.length; i++) {
                    print('Grupo para ${listaTemas[i]}:');
                    print(grupos2[i]);
                    print('*' * 20);
                  }
                }
                contador++;
              } while (contador < intentos);
              break;
            case 2:
              print('Volviendo al menú principal');
              break;
            default:
              print('Obción incorrecta intente de nuevo');
          }
        } while (option2 != 2);
        break;
      case 5:
        print('');
        print('Volviendo al menú princial');
        print('');
        break;
      default:
        print('');
        print('Opción incorrecta, intentelo de nuevo');
        print('');
    }
  } while (option1 != 5);
}
