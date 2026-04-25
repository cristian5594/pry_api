Feature: Login en Serverest

  @login1
  Scenario: Login exitoso
    Given url 'https://serverest.dev'
    And path '/login'
    And request { "email": "fulano@qa.com", "password": "teste" }
    When method post
    Then status 200

  @login2
  Scenario: Login fallido
    Given url 'https://serverest.dev'
    And path '/login'
    And request { "email": "invalido@qa.com", "password": "1234" }
    When method post
    Then status 401
