void main(List<String> args) {
  /*double suma = 0;
  List<String?> listaTemasPredefinida = [
    'vectores',
    'vectores condicionales',
    'matrices',
    'matrices con metodos',
    'arreglos 3D',
    'vector de objetos'
  ];
  List<List<String?>> grupos = [
    ['juan', 'daniel'],
    ['julian', 'Andres'],
    ['Diego', 'ana', 'pedro', 'jeni'],
    ['paula', 'isabela', 'tadeo']
  ];
  print(grupos);*/
  List<String> temas = [
    'Matemáticas',
    'Ciencias',
    'Historia',
    'Literatura',
    'Arte',
  ];

  List<String> estudiantes = [
    'Juan',
    'María',
    'Carlos',
    'Ana',
    'Pedro',
  ];

  // Asumimos que la cantidad de estudiantes por tema está determinada por su índice + 1
  // Por ejemplo, Matemáticas (índice 0) tendría 1 estudiante, Ciencias (índice 1) tendría 2 estudiantes, y así sucesivamente.

  // Verificamos que la cantidad de temas sea menor o igual a la cantidad de estudiantes disponibles
  if (temas.length <= estudiantes.length) {
    for (int i = 0; i < temas.length; i++) {
      int cantidadEstudiantes =
          i + 1; // La cantidad de estudiantes es el índice + 1
      String tema = temas[i];

      // Mostramos la asignación de estudiantes para cada tema
      print('$tema -> ${estudiantes.sublist(0, cantidadEstudiantes)}');

      // Actualizamos la lista de estudiantes disponibles
      estudiantes = estudiantes.sublist(cantidadEstudiantes);
    }
  } else {
    print('No hay suficientes estudiantes para asignar a todos los temas.');
  }
}
