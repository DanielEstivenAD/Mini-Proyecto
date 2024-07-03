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
  while (true) {
    print('Submenú para Generar los grupos');
    print('1. Si desea continuar y generarlos');
    print('2. Si desea salir');

    option2 = int.parse(stdin.readLineSync()!);

    switch (option2) {
      case 1:
        print(
            'Desea utilizar las listas predefinidas para generar los grupos?');
        respuesta = stdin.readLineSync();

        print("Confirme cuántos intentos desea realizar:");
        intentos = int.parse(stdin.readLineSync()!);
        contador = 0; // Reinicia el contador para cada nueva ejecución
        do {
          grupos1 = [];
          grupos2 = [];
          conteoAprendices1 = 0;
          conteoAprendices2 = 0;
          if (respuesta!.toUpperCase() == 'SI') {
            print('Utilizará las listas predefinidas');
            print('-' * 50);
            listaPredefinidaAprendices.shuffle();

            for (var i = 0; i < listaTemasPredefinida.length; i++) {
              limite = cantGruposPorExposicion[i];
              List<String?> grupo1 = [];

              for (var j = 0; j < limite; j++) {
                if (conteoAprendices1 < listaPredefinidaAprendices.length) {
                  grupo1.add(listaPredefinidaAprendices[conteoAprendices1]);
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
            print('Utilizará las listas creadas');
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
        return; // Termina el programa
      default:
        print('Opción incorrecta, intente de nuevo');
    }
  }
}
