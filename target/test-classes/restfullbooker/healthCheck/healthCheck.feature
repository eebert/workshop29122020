Feature: Health booking

  Background:
    * url baseUrl

  Scenario: Verificar petición de creación
    Given path '/ping'
    When method GET
    Then  status 201
