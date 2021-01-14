Feature: Create Token
  Este servicio es utilizado para poder
  crear o generar token para la modificacion
  o la eliminacion de la reservas

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'

    Scenario: Verificar que al enviar la peticion con username y password correctos reciba cod 200
      Given path '/auth'
      And request
      """
      {
        "username" : "admin",
        "password" : "password123"
      }
      """
      When method POST
      Then status 200

