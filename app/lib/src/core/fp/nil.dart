class Nil {
  @override
  String toString() {
    return 'Nil{}';
  }
}

//AUSÊNCIA DE VALOR. RETORNA NIL PARA NAO RETORNAR VOID
Nil get nil => Nil();
