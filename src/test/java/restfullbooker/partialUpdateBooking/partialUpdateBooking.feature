Feature: Partial Update Booking
  Este servicio es utilizado para la
  actualizacion parcial de la reserva

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Verificar petición correcta de la actualizacion parcial reciba 200
    * def CreateTokenResponse = call read('classpath:common/createToken.feature')
    * def accessToken = CreateTokenResponse.response.token
    * def CreateBookingResponse = call read('classpath:common/createBooking.feature')
    * def bookingId = CreateBookingResponse.response.bookingid
    Given path '/booking/' + bookingId
    And cookie token = accessToken
    And request
      """
      {
        "firstname": "Maria",
        "lastname": "Martinez",
      }
     """
    When method PATCH
    Then status 200
    And match response.firstname == 'Maria'
    And match response.lastname == 'Martinez'
