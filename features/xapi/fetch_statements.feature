# encoding: UTF-8
###
# These are either bad request tests or good requests but without statement
# data verification, for that look into the stream queries handling which
# deals with the eventual consistency aspect of the statement stream.
###
Feature: Fetch statements

  Scenario Outline: Bad fetch statements: [<id>] and [<parameter>] not allowed together

    Given a query fetchStatements request
    Given the [<id>] parameter is set to good UUID
    Given the [<parameter>] parameter is set to [<value>]
    When the request is made
    Then the LRS responds with HTTP 400

  Examples:
    | id                | parameter          | value                                                        |
    | statementId       | voidedStatementId  | a good UUID                                                  |
    | statementId       | agent              | a forQueryMbox agent                                         |
    | statementId       | verb               | a forQuery verb                                              |
    | statementId       | activity           | 'http://tincanapi.com/conformancetest/activityid/forQuery'   |
    | statementId       | registration       | a good UUID                                                  |
    | statementId       | related_activities | 'true'                                                       |
    | statementId       | related_agents     | 'true'                                                       |
    | statementId       | since              | '2014-07-23T12:34:02Z'                                       |
    | statementId       | until              | '2014-07-23T12:34:02Z'                                       |
    | statementId       | limit              | '50'                                                         |
    | statementId       | ascending          | 'true'                                                       |
    | voidedStatementId | agent              | a forQueryMbox agent                                         |
    | voidedStatementId | verb               | a forQuery verb                                              |
    | voidedStatementId | activity           | 'http://tincanapi.com/conformancetest/activityid/forQuery'   |
    | voidedStatementId | registration       | a good UUID                                                  |
    | voidedStatementId | related_activities | 'true'                                                       |
    | voidedStatementId | related_agents     | 'true'                                                       |
    | voidedStatementId | since              | '2014-07-23T12:34:02Z'                                       |
    | voidedStatementId | until              | '2014-07-23T12:34:02Z'                                       |
    | voidedStatementId | limit              | '50'                                                         |
    | voidedStatementId | ascending          | 'true'                                                       |


  Scenario Outline: Bad fetch statements: request with bad [<property>] '[<value>]'

    Given a query fetchStatements request
    Given the [<property>] is set to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | property                     | value               |
    | 401  | authority header             | bad auth            |
    | 400  | version header               | 0.8.0               |
    | 400  | version header               | bad version         |
    | 400  | agent parameter              | test agent          |
    | 400  | verb parameter               | test verb id        |
    | 400  | activity parameter           | test activity id    |
    | 400  | registration parameter       | test registration   |
    | 400  | related_activities parameter | not a bool          |
    | 400  | related_activities parameter | 1                   |
    | 400  | related_activities parameter | 0                   |
    | 400  | related_activities parameter | "\"true\""          |
    | 400  | related_activities parameter | "\"false\""         |
    | 400  | related_agents parameter     | not a bool          |
    | 400  | related_agents parameter     | 1                   |
    | 400  | related_agents parameter     | 0                   |
    | 400  | related_agents parameter     | "\"true\""          |
    | 400  | related_agents parameter     | "\"false\""         |
    | 400  | since parameter              | bad timestamp       |
    | 400  | until parameter              | bad timestamp       |
    | 400  | limit parameter              | not an integer      |
    | 400  | limit parameter              | -1                  |
    | 400  | format parameter             | unrecognized        |
    | 400  | attachments parameter        | not a bool          |
    | 400  | attachments parameter        | 1                   |
    | 400  | attachments parameter        | 0                   |
    | 400  | attachments parameter        | "\"true\""          |
    | 400  | attachments parameter        | "\"false\""         |
    | 400  | ascending parameter          | not a bool          |
    | 400  | ascending parameter          | 1                   |
    | 400  | ascending parameter          | 0                   |
    | 400  | ascending parameter          | "\"true\""          |
    | 400  | ascending parameter          | "\"false\""         |

  Scenario Outline: Bad fetch statements: request with [<modifier>] agent with bad [<property>] '[<value>]'

    Given a query fetchStatements request
    Given the agent parameter is set to a [<modifier>] agent
    Given the params agent [<property>] is set to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP 400

  Examples:
    | modifier        | property         | value                            |
    | mboxAndType     | mbox             | conformancetest@tincanapi.com    |
    | mboxAndType     | mbox             | bad mbox                         |
    | mboxAndType     | objectType       | notAgent                         |
    | mboxAndType     | objectType       | Activity                         |
    | mboxOnly        | mbox             | conformancetest@tincanapi.com    |
    | mboxOnly        | mbox             | bad mbox                         |
    | mboxAndType     | objectType       | agent                            |
    | openidAndType   | openid           | bad URI                          |
    | openidOnly      | openid           | bad URI                          |
    | accountAndType  | account homePage | bad URI                          |
    | accountOnly     | account homePage | bad URI                          |

  Scenario Outline: Bad fetch statements: request missing [<property>]

    Given a query fetchStatements request
    Given the [<property>] is deleted
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | property             |
#    | 400  | version header       |
    | 401  | authority header     |

