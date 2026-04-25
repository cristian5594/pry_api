{
  generarEmail: function(nombre) {
    var uuid = java.util.UUID.randomUUID().toString().replaceAll('-', '').substring(0, 8);
    return nombre + uuid + '@test.com';
  },

  generarUsuario: function() {
    var uuid = java.util.UUID.randomUUID().toString().replaceAll('-', '').substring(0, 8);
    return {
      nome:          'Usuario QA ' + uuid,
      email:         'user' + uuid + '@test.com',
      password:      'pass' + uuid,
      administrador: 'true'
    }
  },

  generarProducto: function() {
    var uuid = java.util.UUID.randomUUID().toString().substring(0, 4);
    return {
      nome:       'Producto QA ' + uuid,
      preco:      Math.floor(Math.random() * 5000) + 100,
      descricao:  'Descripcion QA ' + uuid,
      quantidade: Math.floor(Math.random() * 100) + 1
    }
  }
}