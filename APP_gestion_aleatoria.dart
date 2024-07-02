import 'dart:io';

void main(List<String> args) {
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
    'ALEJANDRO VALLEJO ESCOBAR'
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
      contadorCantidadIntentos,
      complejidad;
  String? tema, aprendiz, cantidadInput;

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
          print("¿Cuántos temas agregarás?");
          cantidadInput = stdin
              .readLineSync(); //Esta función se utiliza para capturar la entrada del usuario, en este caso, para obtener la cantidad de temas que el usuario quiere ingresar.

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
            listaTemas.add(tema ??
                ""); // listaTemas.add(tema ?? "") agrega el valor de tema a listaTemas. Si tema es null, agrega una cadena vacía "".

            /* Después de que el usuario ingresa la cantidad de temas y sus nombres,
       este bucle for solicita cada nombre de tema y lo agrega a listaTemas.
       El ?? "" asegura que no se agreguen valores null a la lista, lo cual podría ocurrir si el usuario simplemente presiona Enter sin ingresar un nombre.*/
          }

          if (listaTemas.every((element) => element!.isEmpty)) {
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
          // MENU DE COMPLEJIDAD
          print("Indique la complejidad del tema ${listaTemasPredefinida[i]} ");
          print("facil: 1");
          print("medio: 2");
          print("dificil: 3");
          print("*" * 50);
          complejidad = int.parse(stdin.readLineSync()!);
          while (complejidad < 1 || complejidad > 3) {
            print("Opción incorrecta");
            print("*" * 50);
            print(
                "Indique la complejidad del tema ${listaTemasPredefinida[i]} ");
            print("facil: 1");
            print("medio: 2");
            print("dificil: 3");
            print("*" * 50);
            complejidad = int.parse(stdin.readLineSync()!);
          }
          print("*" * 50);
          print(
              "La complejidad del tema ${listaTemasPredefinida[i]} es $complejidad");
          print("*" * 50);
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
