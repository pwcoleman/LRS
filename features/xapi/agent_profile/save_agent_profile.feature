# encoding: UTF-8
Feature: Save agent profile


  Scenario Outline: Good save agent profile: [<type>] request

    Given a [<type>] saveAgentProfile request
    When the request is made
    Then the LRS responds with HTTP 204

  Examples:
    | type    |
    | typical |
    | JSON    |


  Scenario Outline: Good save agent profile: [<type>] request missing [<property>]

    Given a [<type>] saveAgentProfile request
    Given the [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP 204

  Examples:
    | type    | property            |
    | typical | Content-Type header |
    | typical | content             |
    | JSON    | content             |


  Scenario Outline: Good save agent profile: typical request with [<property>] set to [<value>]

    Given a typical saveAgentProfile request
    Given the [<property>] is set to [<value>]
    When the request is made
    Then the LRS responds with HTTP 204

  Examples:
    | property        | value                     |
    | agent parameter | an mboxAndType agent      |
    | agent parameter | an mboxSha1AndType agent  |
    | agent parameter | an openidAndType agent    |
    | agent parameter | an accountAndType agent   |
    | agent parameter | an mboxOnly agent         |
    | agent parameter | an mboxSha1Only agent     |
    | agent parameter | an openidOnly agent       |
    | agent parameter | an accountOnly agent      |
    | content         | a typical statement       |


  Scenario Outline: Good save agent profile: [<type>] request with [<property>] set to '[<value>]'

    Given a [<type>] saveAgentProfile request
    Given the [<property>] is set to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP 204

  Examples:
    | type    | property             | value              |
    | typical | Content-Type header  | test content type  |
    | typical | stateId parameter    | test state id      |
    | typical | content              | test content       |
    | JSON    | method               | POST               |


  Scenario Outline: Bad save agent profile: typical request missing [<property>]

    Given a typical saveAgentProfile request
    Given the [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | property             |
    | 400  | version header       |
    | 401  | authority header     |
    | 400  | profileId parameter  |
    | 400  | agent parameter      |


  Scenario: Bad save agent profile: typical request with bad agent parameter an empty agent

    Given a typical saveAgentProfile request
    Given the agent parameter is set to an empty agent
    When the request is made
    Then the LRS responds with HTTP 400


  Scenario Outline: Bad save agent profile: typical request with bad [<property>] '[<value>]'

    Given a typical saveAgentProfile request
    Given the [<property>] is set to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | property         | value                                                       |
    | 400  | resource         | agent/profile                                               |
    | 400  | resource         | agents/profiles                                             |
    | 405  | resource         | agents                                                      |
    | 400  | version header   | bad version                                                 |
    | 400  | version header   | 3.8.0                                                       |
    | 400  | authority header | Basic badAuth                                               |
    | 401  | authority header | Basic TnsHNWplME1YZnc0VzdLTHRIWTo0aDdBb253Ml85WU53vSZLNlVZ  |
    | 400  | method           | POST                                                        |


  Scenario Outline: Bad save agent profile: typical request with [<modifier>] agent parameter with bad [<property>] '[<value>]'

    Given a typical saveAgentProfile request
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
    | openidOnly     | openid           | bad URI                         |
    | accountAndType | account homePage | bad URI                         |
    | accountOnly    | account homePage | bad URI                         |


  Scenario Outline: Bad save agent profile: typical request [<modifier>] agent parameter missing [<property>]

    Given a typical saveAgentProfile request
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
