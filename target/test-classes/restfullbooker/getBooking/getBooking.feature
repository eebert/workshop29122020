Feature: Get booking id
  Este servicio es utilizado para el listado de todos los codigos ID de las reservas de empresa RESTFull Booker

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: obtener un ID
    * def CreateBookingResponse = call read('classpath:common/createBooking.feature')
    * def bookingId = CreateBookingResponse.response.bookingid
    Given path '/booking/' + bookingId
    When method GET
    Then  status 200
    And  match response.firstname == 'Elena'
    And  match response.firstname == '#string'