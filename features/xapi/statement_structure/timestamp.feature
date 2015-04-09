# encoding: UTF-8
Feature: statement structure timestamp test

  Scenario Outline: Good timestamp: '[<value>]'

    Given a [<type>] saveStatement request
    Given the statement timestamp is changed to '[<value>]'
    When the request is made
    Then the request was successful

  Examples:
    | type    | value                             |
    | typical | 2014-07-23T12:34:02Z              |
    | typical | 2014-07-23T12:34:02+00            |
    | typical | 2014-07-23T12:34:02+05            |
    | typical | 2014-07-23T12:34:02-05            |
    | typical | 2014-07-23T12:34:02-05:00         |
    | typical | 2014-07-23T12:34:02.365-05:00     |
    | typical | 2014-07-23T12:34:02.36578-05:00   |

  Scenario Outline: Bad timestamp: '[<value>]'

    Given a [<type>] saveStatement request
    Given the statement timestamp is changed to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | value                            |
    | 400  | typical | bad timestamp                    |
    | 400  | typical | 2014-07-23T12:34:02-00           |
    | 400  | typical | 2014-07-23T12:34:02-5:00         |
    | 400  | typical | 2014-07-23T12:34:02.365-5:00     |
    | 400  | typical | 2014-07-23T12:34:02.36578-5:00   |

  Scenario: Good timestamp: no timestamp

    Given a typical saveStatement request
    Given the statement timestamp is removed
    When the request is made
    Then the request was successful
