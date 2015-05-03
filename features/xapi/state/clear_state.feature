# encoding: UTF-8
Feature: Clear state


  Scenario Outline: Good clear state: [<type>] request cluster

    Given a [<type>] clearState request cluster
    When the request is made on the primed LRS
    Then the clearState response is verified

  Examples:
    | type              |
    | typical           |
    | withRegistration  |


  Scenario Outline: Good clear state: [<type>] request cluster with a [<modifier>] agent parameter

    Given a [<type>] clearState request cluster
    Given all requests' agent parameter is set to an [<modifier>] agent
    When the request is made on the primed LRS
    Then the clearState response is verified

  Examples:
    | type             | modifier           |
    | typical          | mboxAndType        |
    | typical          | mboxSha1AndType    |
    | typical          | openidAndType      |
    | typical          | accountAndType     |
    | typical          | mboxOnly           |
    | typical          | mboxSha1Only       |
    | typical          | openidOnly         |
    | typical          | accountOnly        |
    | withRegistration | mboxAndType        |
    | withRegistration | mboxSha1AndType    |
    | withRegistration | openidAndType      |
    | withRegistration | accountAndType     |
    | withRegistration | mboxOnly           |
    | withRegistration | mboxSha1Only       |
    | withRegistration | openidOnly         |
    | withRegistration | accountOnly        |


  Scenario Outline: Bad clear state: [<type>] request missing [<property>]

    Given a [<type>] clearState request
    Given the [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type             | property              |
    | 400  | typical          | version header        |
    | 401  | typical          | authority header      |
    | 400  | typical          | activityId parameter  |
    | 400  | typical          | agent parameter       |
    | 400  | withRegistration | version header        |
    | 401  | withRegistration | authority header      |
    | 400  | withRegistration | activityId parameter  |
    | 400  | withRegistration | agent parameter       |


  Scenario Outline: Bad clear state: [<type>] request with bad agent parameter an empty agent

    Given a [<type>] clearState request
    Given the agent parameter is set to an empty agent
    When the request is made
    Then the LRS responds with HTTP 400

  Examples:
    | type              |
    | typical           |
    | withRegistration  |

  @focus
  Scenario Outline: Bad clear state: [<type>] request with bad [<property>] '[<value>]'

    Given a [<type>] clearState request
    Given the [<property>] is set to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type             | property               | value                                                        |
    | 400  | typical          | resource               | activity/state                                               |
    | 400  | typical          | resource               | activities/states                                            |
    | 400  | typical          | version header         | bad version                                                  |
    | 400  | typical          | version header         | 3.8.0                                                        |
    | 400  | typical          | authority header       | Basic badAuth                                                |
    | 401  | typical          | authority header       | Basic TnsHNWplME1YZnc0VzdLTHRIWTo0aDdBb253Ml85WU53vSZLNlVZ   |
    | 400  | typical          | activityId parameter   | bad URI                                                      |
    | 400  | withRegistration | activityId parameter   | bad URI                                                      |
    | 400  | withRegistration | registration parameter | bad UUID                                                     |

  Scenario Outline: Bad clear state: typical request with [<modifier>] agent parameter with bad [<property>] '[<value>]'

    Given a typical clearState request
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

  Scenario Outline: Bad clear state: typical request with [<modifier>] agent parameter missing [<property>]

    Given a typical clearState request
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
