# encoding: UTF-8
Feature: statement structure verb test

  Scenario Outline: Good verb: [<modifier>] verb

    Given a [<type>] saveStatement request
    Given the statement verb is changed to a [<modifier>] verb
    When the request is made
    Then the request was successful (204)

  Examples:
    | type    | modifier        |
    | typical | idOnly          |
    | typical | idAndDisplay    |

  Scenario Outline: Bad verb: [<object>] with bad [<property>] '[<value>]'

    Given a [<type>] saveStatement request
    Given the statement verb is changed to a [<object>]
    Given the statement verb [<property>] is changed to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | object            | property | value         |
    | 400  | typical | idOnly verb       | id       | bad id        |
    | 400  | typical | idAndDisplay verb | display  | bad display   |
    | 400  | typical | idAndDisplay verb | id       | bad id        |

  Scenario Outline: Bad verb: [<object>] missing [<property>]

    Given a [<type>] saveStatement request
    Given the statement verb is changed to a [<object>]
    Given the statement verb [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | object            | property   |
    | 400  | typical | idAndDisplay verb | id         |
    | 400  | typical | idOnly verb       | id         |

  Scenario Outline: Good verb: [<object>] missing [<property>]

    Given a [<type>] saveStatement request
    Given the statement verb is changed to a [<object>]
    Given the statement verb [<property>] is removed
    When the request is made
    Then the request was successful (204)

  Examples:
    | type    | object            | property  |
    | typical | idAndDisplay verb | display   |
