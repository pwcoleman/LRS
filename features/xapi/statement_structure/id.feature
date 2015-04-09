# encoding: UTF-8
Feature: statement structure id test

  Scenario: Good id: unique

    Given a minimal saveStatement request
    Given the statement id is changed to a unique UUID
    When the request is made
    Then the request was successful

  Scenario Outline: Bad id: '[<value>]' ([<description>])

    Given a [<type>] saveStatement request
    Given the statement id is changed to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | value                                | description                                 |
    | 400  | minimal | bad id                               | incorrect format                            |
    | 400  | minimal | 7396683c-0759-e411-b974-a0d3c123d81f | "e" in 3rd segment not acceptable version   |
    | 400  | minimal | 7396683c-0759-1411-c974-a0d3c123d81f | "c" in 4th segment not acceptable variant   |

