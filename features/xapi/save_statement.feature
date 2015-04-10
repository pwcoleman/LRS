# encoding: UTF-8
Feature: Save statement

  Scenario Outline: Good save statement: [<type>] request

    Given a [<type>] saveStatement request
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type       |
    | 200  | minimal    |
    | 204  | typical    |
# TODO: PWC INCLUDE THIS    | 204  | attachment |

  @focus
  Scenario Outline: Bad save statement: [<type>] request with [<property>] set to '[<value>]'

    Given a [<type>] saveStatement request
    Given the [<property>] is set to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type       | property            | value             |
    | 400  | typical    | method              | POST              |
    | 400  | typical    | resource            | statement         |
    | 400  | minimal    | method              | PUT               |
    | 400  | minimal    | resource            | statement         |
    | 400  | minimal    | content             | null              |
# TODO: PWC INCLUDE THIS    | 400  | attachment | Content-Type header | application/json  |

  Scenario Outline: Bad save statement: [<type>] request missing [<property>]

    Given a [<type>] saveStatement request
    Given the [<property>] is deleted
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | property               |
    | 400  | typical | version header         |
    | 401  | typical | authority header       |
    | 400  | typical | Content-Type header    |
    | 400  | typical | statementId parameter  |
    | 400  | minimal | version header         |
    | 401  | minimal | authority header       |
    | 400  | minimal | Content-Type header    |

  Scenario Outline: Bad save statement: [<type>] request with bad [<property>] '[<value>]'

    Given a [<type>] saveStatement request
    Given the [<property>] is set to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | property              | value                                |
    | 401  | typical | authority header      | bad auth                             |
    | 400  | typical | version header        | 0.8.0                                |
    | 400  | typical | version header        | bad version                          |
    | 400  | typical | Content-Type header   | bad content type                     |
    | 400  | typical | statementId parameter | bad statementId                      |
    | 401  | minimal | authority header      | bad auth                             |
    | 400  | minimal | version header        | 0.8.0                                |
    | 400  | minimal | version header        | bad version                          |
    | 400  | minimal | Content-Type header   | bad content type                     |
    | 400  | minimal | statementId parameter | cebba04a-158a-4e2e-8b6d-82bav2b9c07e |
    | 400  | minimal | statementId parameter | bad statementId                      |
