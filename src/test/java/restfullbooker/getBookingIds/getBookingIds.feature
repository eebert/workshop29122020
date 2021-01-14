Feature: Get booking ids
   Este servicio es utilizado para el listado de todos los codigos ID de las reservas de empresa RESTFull Booker

  Background:
    * url baseUrl

    Scenario: Verificar petición correcta al obtener todos los booking IDs
      Given path '/booking'
      When method GET
      Then  status 200