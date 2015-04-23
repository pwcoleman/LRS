# encoding: UTF-8
Feature: statement structure statementRef test


  Scenario Outline: Good object statementRef: [<object>]

    Given a [<type>] saveStatement request
    Given the statement object is changed to a [<object>]
    When the request is made
    Then the request was successful

  Examples:
    | type    | object                      |
    | typical | allProperties statementRef  |


  Scenario Outline: Bad object statementRef: [<object>] with bad [<property>] '[<value>]'

    Given a [<type>] saveStatement request
    Given the statement object is changed to a [<object>]
    Given the statement object [<property>] is changed to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | object                                | property            | value            |
    | 400  | typical | allProperties statementRef            | objectType          | notStatementRef  |
    | 400  | typical | allProperties statementRef            | id                  | bad id           |
    | 400  | typical | allProperties statementRef            | objectType          | statementRef     |

  Scenario Outline: Bad object statementRef: [<object>] missing [<property>]

    Given a [<type>] saveStatement request
    Given the statement object is changed to a [<object>]
    Given the statement object [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | object                             | property      |
    | 400  | typical | allProperties statementRef         | id            |
    | 400  | typical | allProperties statementRef         | objectType    |
