Feature: Create booking
  Este servicio es utilizado para crear una reserva nueva

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario Outline: Verificar petición de creación
    Given path '/booking'
    And request
    """
    {
    "firstname" : "<firstname>",
    "lastname" : "<lastname>",
    "totalprice" : <totalprice>,
    "depositpaid" : <depositpaid>,
    "bookingdates" : {
      "checkin" : "<checkin>",
      "checkout" : "<checkout>"
    },
    "additionalneeds" : "<additionalneeds>"
    }

    """
    When method POST
    Then  status 200
    And  match response.booking.firstname == '<firstname>'
    And  match response.booking.lastname == '<lastname>'
    And  match response.booking.totalprice == <totalprice>
    And  match response.booking.depositpaid == <depositpaid>
    And  match response.booking.bookingdates.checkin == "<checkin>"
    And  match response.booking.bookingdates.checkout == "<checkout>"
    And  match response.booking.additionalneeds == "<additionalneeds>"


    And  match response.bookingid == "#number"
    And  match response.booking.firstname == "#string"
    And  match response.booking.totalprice == '#number'
    And  match response.booking.depositpaid == '#boolean'
    And  match response.booking.firstname == "#string"

    Examples:
      |firstname|lastname|totalprice|depositpaid|checkin    |checkout   |additionalneeds|
      |Elena    |Eb      |100       |true       |2019-01-01 |2020-01-01 |Breakfast      |
      |Elena1   |Eb2     |100       |true       |2019-01-01 |2020-01-01 |Breakfast      |
      |Elena2   |Eb3     |100       |true       |2019-01-01 |2020-01-01 |Breakfast      |