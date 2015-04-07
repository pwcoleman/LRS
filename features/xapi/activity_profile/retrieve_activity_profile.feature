# encoding: UTF-8
Feature: Retrieve activity profile

  Scenario: Good retrieve activityProfile: typical request cluster

    Given a typical retrieveActivityProfile request cluster
    When the request is made on the primed LRS
    Then the retrieveActivityProfile response is verified

  Scenario Outline: Bad retrieve activityProfile: [<type>] request missing [<property>]

    Given a typical retrieveActivityProfile request
    Given the [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | property             |
    | 401  | authority header     |
    | 400  | activityId parameter |

# Pending because it will pass in 0.9 enabled LRSs, need to detect those and annotate accordingly
  @Pending
  Scenario: Bad retrieve activityProfile: typical request missing version header

    Given a typical retrieveActivityProfile request
    Given the version header is removed
    When the request is made
    Then the LRS responds with HTTP 400

  Scenario Outline: Bad retrieve state: typical request with bad [<property>] '[<value>]'

    Given a typical retrieveActivityProfile request
    Given the [<property>] is set to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | property             | value                                                       |
    | 400  | resource             | activity/state                                              |
    | 400  | resource             | activities/states                                           |
    | 400  | version header       | bad version                                                 |
    | 400  | version header       | 3.8.0                                                       |
    | 400  | authority header     | Basic badAuth                                               |
    | 401  | authority header     | Basic TnsHNWplME1YZnc0VzdLTHRIWTo0aDdBb253Ml85WU53vSZLNlVZ  |
    | 400  | activityId parameter | bad URI                                                     |
