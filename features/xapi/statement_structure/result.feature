# encoding: UTF-8
Feature: statement structure result test

  Scenario Outline: Good result: [<modifier>] result

    Given a [<type>] saveStatement request
    Given the statement result is changed to a [<modifier>] result
    When the request is made
    Then the request was successful

  Examples:
    | type    | modifier                              |
    | typical | empty                                 |
    | typical | typical                               |
    | typical | scoreOnly                             |
    | typical | emptyScoreOnly                        |
    | typical | successOnly                           |
    | typical | completionOnly                        |
    | typical | responseOnly                          |
    | typical | durationOnly                          |
    | typical | extensionsOnly                        |
    | typical | emptyExtensionsOnly                   |
    | typical | scoreAndSuccess                       |
    | typical | scoreAndResponse                      |
    | typical | scoreAndDuration                      |
    | typical | successAndCompletion                  |
    | typical | successAndResponse                    |
    | typical | successAndDuration                    |
    | typical | completionAndResponse                 |
    | typical | completionAndDuration                 |
    | typical | responseAndDuration                   |
    | typical | scoreSuccessAndCompletion             |
    | typical | scoreSuccessAndResponse               |
    | typical | scoreSuccessAndDuration               |
    | typical | scoreCompletionAndResponse            |
    | typical | scoreResponseAndDuration              |
    | typical | successCompletionAndResponse          |
    | typical | successCompletionAndDuration          |
    | typical | successResponseAndDuration            |
    | typical | completionResponseAndDuration         |
    | typical | scoreSuccessCompletionAndDuration     |
    | typical | scoreSuccessCompletionAndResponse     |
    | typical | successCompletionResponseAndDuration  |
    | typical | allProperties                         |

  Scenario Outline: Good duration format test ([<explanation>]): [<value>]

    Given a typical saveStatement request
    Given the statement result is changed to a durationOnly result
    Given the statement result duration is changed to '[<value>]'
    When the request is made
    Then the request was successful

  Examples:
    | value        | explanation    |
    | PT0H0M0.000S | decimal        |

  Scenario Outline: Bad result: [<object>] with bad [<property>] '[<value>]'

    Given a [<type>] saveStatement request
    Given the statement result is changed to a [<object>] result
    Given the statement result [<property>] is changed to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | object         | property   | value                    |
    | 400  | typical | successOnly    | success    | not a boolean            |
    | 400  | typical | completionOnly | completion | not a boolean            |
    | 400  | typical | allProperties  | duration   | not ISO 8601 formatted   |
    | 400  | typical | scoreOnly      | score      | not a score object       |

  Scenario Outline: Good result: [<object>] missing [<property>]
    Given a [<type>] saveStatement request
    Given the statement result is changed to a [<object>] result
    Given the statement result [<property>] is removed
    When the request is made
    Then the request was successful

  Examples:
    | type    | object        | property    |
    | typical | allProperties | score       |
    | typical | allProperties | success     |
    | typical | allProperties | completion  |
    | typical | allProperties | response    |
    | typical | allProperties | duration    |
