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
      numero,
      cantidadTemas,
      cantidadAprendices,
      cantIntentos,
      contadorCantidadIntentos,
      conteoAprendices = 0,
      complejidad,
      limite;
  String? tema, aprendiz, cantidadInput, opcionCase1, opcionCase2, numeroInput;

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
        while (listaTemas.isEmpty) {
          //if: si la lista "x" esta vacia
          print("¿Cuántos temas agregarás?");
          cantidadInput = stdin.readLineSync();

          if (cantidadInput == null || cantidadInput.isEmpty) {
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
            listaTemas.add(tema ?? ""); // listaTemas.add(tema ?? "") agrega el valor de tema a listaTemas. Si tema es null, agrega una cadena vacía "".

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

        print("*" * 50);
        print("La lista de temas es la siguiente:");
        print(listaTemas);
        print("*" * 50);

        //CRUD
        do {
          print("*" * 50);
          print("1. Crear tema");
          print("2. Leer temas");
          print("3. Actualizar tema");
          print("4. Eliminar tema");
          print("5. Salir");
          print("*" * 50);
          print("Seleccione una opción:");
          opcionCase1 = stdin.readLineSync();

          switch (opcionCase1) {
            case '1':
              // Crear tema
              print("Nombre del nuevo tema:");
              try {
                tema = stdin.readLineSync()!.trim(); // Se utiliza trim() para eliminar espacios en blanco al inicio y al final.
                if (tema.isEmpty) {
                  // si la variable "tema" esta vacia.
                  throw Exception("No ingresaste un nombre válido."); //throw exception, una excepcion. Lanzar una excepción detiene la ejecución normal del programa y pasa el control al bloque catch más cercano que pueda manejar esta excepción.
                }
                listaTemas.add(tema);
                print("*" * 50);
                print("Tema agregado.");
                print("*" * 50);
              } catch (e) {
                //captura cualquier excepcion
                print( "Error: ${e.toString()}. Intenta nuevamente."); //indica la excepcion y se agrega al throw
              }
              break;

            case '2':
              // Leer temas
              print("*" * 50);
              print("La lista de temas es la siguiente:");
              print(listaTemas);
              print("*" * 50);
              break;

            case '3':
              // Actualizar tema
              print("¿Qué número de tema deseas actualizar?");
              numeroInput = stdin.readLineSync();
              try {
                numero = int.parse(numeroInput!);
              } catch (e) {
                print("Ingrese un número válido.");
                print("*" * 50);
                continue;
              }

              if (numero < 1 || numero > listaTemas.length) {
                print("Índice fuera de rango.");
                print("*" * 50);
                continue;
              }

              print("Ingrese el nuevo nombre del tema ${numero}:");
              tema = stdin.readLineSync();
              listaTemas[numero - 1] = tema;
              print("Tema actualizado.");
              print("*" * 50);
              break;

            case '4':
              // Eliminar tema
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

              listaTemas.removeAt(numero - 1); //como las listas inician en 0, se necesita restar 1 para que tome el dato correcto en la posicion.
              print("Tema eliminado.");
              /*Cuando llamas a removeAt(index), el método elimina el elemento en la posición index y 
              ajusta el tamaño de la lista en consecuencia. Todos los elementos después de index se desplazan una posición hacia la izquierda.*/
              break;

            case '5':
              // Salir
              print("Saliendo...");
              break;

            default:
              print("Opción no válida. Intenta nuevamente.");
          }
        } while (opcionCase1 != '5');

        break;

      case 2:
        while (aprendices.isEmpty) {
          print("¿Cuántos aprendices agregarás?");
          cantidadInput = stdin.readLineSync();

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
          }

          if (aprendices.every((elemento) => elemento!.isEmpty)) {
            print("La lista no tiene contenidos válidos. Intenta nuevamente.");
            aprendices.clear();
          }
        }

        print("*" * 50);
        print("La lista de aprendices es la siguiente:");
        print(aprendices);
        print("*" * 50);

        do {
          print("1. Crear aprendiz");
          print("2. Leer aprendices");
          print("3. Actualizar aprendiz");
          print("4. Eliminar aprendiz");
          print("5. Salir");
          print("*" * 50);
          print("Seleccione una opción:");
          opcionCase2 = stdin.readLineSync();

          switch (opcionCase2) {
            case '1':
              // Crear aprendiz
              print("Nombre del nuevo aprendiz:");
              try {
                aprendiz = stdin.readLineSync()!.trim();
                if (aprendiz.isEmpty) {
                  throw Exception("No ingresaste un nombre válido.");
                }
                aprendices.add(tema);
                print("*" * 50);
                print("aprendiz agregado.");
                print("*" * 50);
              } catch (e) {
                print( "Error: ${e.toString()}. Intenta nuevamente."); 
              }
              
              break;

            case '2':
              // Leer aprendices
              print("La lista de aprendices es la siguiente:");
              print(aprendices);
              print("*" * 50);
              break;

            case '3':
              // Actualizar aprendiz
              print("¿Qué número de aprendiz deseas actualizar?");
              numeroInput = stdin.readLineSync();
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
              aprendices[numero - 1] = aprendiz;
              print("Aprendiz actualizado.");
              print("*" * 50);
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

              aprendices.removeAt(numero - 1);
              print("Aprendiz eliminado.");
              break;

            case '5':
              // Salir
              print("Saliendo...");
              print("*" * 50);
              break;

            default:
              print("*" * 50);
              print("Opción no válida. Intenta nuevamente.");
              print("*" * 50);
          }
        } while (opcionCase2 != '5');
        break;

      case 3:
        print("Las listas predefinidas son las siguientes:");
        print("La lista de temas:");
        print(listaTemasPredefinida);
        print("La Lista de aprendices:");
        print(listaPredefinidaAprendices);
        print("*" * 20);
        // MENU DE ASIGNACIÓN DE GRUPOS
        print("Los grupos serán formados de 3 o 4 personas maximo");
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
