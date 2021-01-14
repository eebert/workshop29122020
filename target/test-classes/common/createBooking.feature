Feature: Create booking
  Este servicio es utilizado para crear una reserva nueva

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Verificar petición de creación
    Given path '/booking'
    And request
    """
    {
    "firstname" : "Elena",
    "lastname" : "Eb",
    "totalprice" : 100,
    "depositpaid" : true,
    "bookingdates" : {
      "checkin" : "2019-01-01",
      "checkout" : "2020-01-01"
    },
    "additionalneeds" : "Pretty Breakfast"
    }
    """
    When method POST
    Then  status 200
    And  match response.booking.firstname == 'Elena'
    And  match response.booking.lastname == 'Eb'
    And  match response.booking.totalprice == 100
    And  match response.booking.depositpaid == true
    And  match response.booking.bookingdates.checkin == "2019-01-01"
    And  match response.booking.bookingdates.checkout == "2020-01-01"
    And  match response.booking.additionalneeds == "Pretty Breakfast"


