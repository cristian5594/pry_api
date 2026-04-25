Feature: Gestion de productos en Serverest

  Background:
    Given url 'https://serverest.dev'
    And path '/login'
    And request { "email": "fulano@qa.com", "password": "teste" }
    When method post
    Then status 200
    * def token = response.authorization

  @producto1
  Scenario: Crear producto
    Given url 'https://serverest.dev'
    And path '/produtos'
    And header Authorization = token
    * def nombreProducto = 'lavadora QA ' + java.util.UUID.randomUUID()
    And request { "nome": "#(nombreProducto)", "preco": 2500, "descricao": "lavadora de pruebas", "quantidade": 10 }
    When method post
    Then status 201
 # Limpieza: eliminar el producto recién creado
   # * def productoId = response._id
   # Given url 'https://serverest.dev'
   # And path '/produtos/' + productoId
   # And header Authorization = token
   # When method delete
   # Then status 200

  @producto2
  Scenario: Crear producto duplicado
    Given url 'https://serverest.dev'
    And path '/produtos'
    And header Authorization = token
    And request { "nome": "Laptop QA", "preco": 2500, "descricao": "Laptop de pruebas", "quantidade": 10 }
    When method post
    Then status 400
    And match response.message == "Já existe produto com esse nome"

