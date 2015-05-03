# encoding: UTF-8
Feature: Retrieve agent profile ids


  Scenario: Good retrieve agent profile ids: typical request cluster

    Given a typical retrieveAgentProfileIds request cluster
    When the request is made on the primed LRS
    Then the retrieveAgentProfileIds response is verified


  Scenario Outline: Good retrieve agent profile ids: typical request cluster with a [<modifier>] agent parameter

    Given a typical retrieveAgentProfileIds request cluster
    Given all requests' agent parameter is set to an [<modifier>] agent
    When the request is made on the primed LRS
    Then the retrieveState response is verified

  Examples:
    | modifier        |
    | mboxAndType     |
    | mboxSha1AndType |
    | openidAndType   |
    | accountAndType  |
    | mboxOnly        |
    | mboxSha1Only    |
    | openidOnly      |
    | accountOnly     |


  Scenario Outline: Bad retrieve agent profile ids: typical request missing [<property>]

    Given a typical retrieveAgentProfileIds request
    Given the [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | property           |
    | 400  | version header     |
    | 401  | authority header   |
    | 400  | agent parameter    |

  @focus
  Scenario: Bad retrieve agent profile ids: typical request with bad agent parameter an empty agent

    Given a typical retrieveAgentProfileIds request
    Given the agent parameter is set to an empty agent
    When the request is made
    Then the LRS responds with HTTP 400

  Scenario Outline: Bad retrieve agent profile ids: typical request with bad [<property>] '[<value>]'

    Given a typical retrieveAgentProfileIds request
    Given the [<property>] is set to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | property         | value                                                       |
    | 400  | resource         | agent/state                                                 |
    | 400  | resource         | agents/states                                               |
    | 400  | version header   | bad version                                                 |
    | 400  | version header   | 3.8.0                                                       |
    | 400  | authority header | Basic badAuth                                               |
    | 401  | authority header | Basic TnsHNWplME1YZnc0VzdLTHRIWTo0aDdBb253Ml85WU53vSZLNlVZ  |

  Scenario Outline: Bad retrieve agent profile ids: typical request with [<modifier>] agent parameter with bad [<property>] '[<value>]'

    Given a typical retrieveAgentProfileIds request
    Given the agent parameter is set to a [<modifier>] agent
    Given the params agent [<property>] is set to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP 400

  Examples:
    | modifier       | property         | value                           |
    | mboxAndType    | mbox             | conformancetest@tincanapi.com   |
    | mboxAndType    | mbox             | bad mbox                        |
    | mboxAndType    | objectType       | notAgent                        |
    | mboxAndType    | objectType       | Activity                        |
    | mboxOnly       | mbox             | conformancetest@tincanapi.com   |
    | mboxOnly       | mbox             | bad mbox                        |
    | mboxAndType    | objectType       | agent                           |
    | openidAndType  | openid           | bad URI                         |
    | accountAndType | account homePage | bad URI                         |
    | openidOnly     | openid           | bad URI                         |
    | accountOnly    | account homePage | bad URI                         |

  Scenario Outline: Bad retrieve agent profile ids: typical request with [<modifier>] agent parameter missing [<property>]

    Given a typical retrieveAgentProfileIds request
    Given the agent parameter is set to a [<modifier>] agent
    Given the params agent [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP 400

  Examples:
    | modifier       | property           |
    | accountAndType | account homePage   |
    | accountAndType | account name       |
    | accountOnly    | account homePage   |
    | accountOnly    | account name       |
    | mboxAndType    | mbox               |
