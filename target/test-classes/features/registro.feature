Feature: Registro de usuarios en Serverest

  @registro_usuario
  Scenario: Registro exitoso con email único
    * def usuario = dataHelper.generarUsuario()
    Given url 'https://serverest.dev'
    And path '/usuarios'
    And request usuario
    When method post
    Then status 201
    And match response == { "_id": "#string", "message": "#string" }
    And match response.message == 'Cadastro realizado com sucesso'
    And print 'Usuario creado:', usuario.email

  #Scenario: Registro exitoso con email único
  #  * def uniqueEmail = 'juan' + java.util.UUID.randomUUID().toString().replaceAll('-', '').substring(0,8) + '@test.com'
  #  Given url 'https://serverest.dev'
  #  And path '/usuarios'
  #  And request { "nome": "Juan QA", "email": "#(uniqueEmail)", "password": "1234", "administrador": "true" }
  #  When method post
  #  Then status 201

  @listar_usuarios
  Scenario: Listar todos los usuarios
    Given url 'https://serverest.dev'
    And path '/usuarios'
    When method get
    Then status 200
    And match response.quantidade == '#number'
    And match response.usuarios == '#array'
    And print 'Total de usuarios:', response.quantidade

  @lista_id
  Scenario: Listar usuario por ID específico
    Given url 'https://serverest.dev'
    And path '/usuarios/RHWbCJmZovXwKPjo'
    When method get
    Then status 200
    And match response._id == 'RHWbCJmZovXwKPjo'
    And match response.nome == '#string'
    And match response.email == '#string'
    And match response.administrador == '#string'
    And print 'Usuario encontrado:', response

  @actualizar_usuario
  Scenario: Actualizar usuario por ID específico
    Given url 'https://serverest.dev'
    And path '/usuarios/RHWbCJmZovXwKPjo'
    And request { "nome": "Juan Actualizado", "email": "juanactualizado@test.com", "password": "1234", "administrador": "true" }
    When method put
    Then status 200
    And match response.message == 'Registro alterado com sucesso'
    And print 'Respuesta:', response

  @eliminar_usuario
  Scenario: Eliminar usuario por ID específico
    Given url 'https://serverest.dev'
    And path '/usuarios/pb4FnAaserFXGn1W'
    When method delete
    Then status 200
    And match response.message == 'Nenhum registro excluído'
    And print 'Respuesta:', response

#------------------------------------------------------------------------------------
  @listar_id
  Scenario: Listar usuario por ID
    # Paso 1: obtener un ID válido de la lista
    Given url 'https://serverest.dev'
    And path '/usuarios'
    When method get
    Then status 200
    * def usuarioId = response.usuarios[0]._id


  @duplicado_usuario
  Scenario: Registro con email duplicado
    Given url 'https://serverest.dev'
    And path '/usuarios'
    And request { "nome": "Cristian QA", "email": "fulano@qa.com", "password": "1234", "administrador": "true" }
    When method post
    Then status 400
    And match response.message == "Este email já está sendo usado"


