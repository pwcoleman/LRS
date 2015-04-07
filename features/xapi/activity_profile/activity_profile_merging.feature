# encoding: UTF-8
Feature: Activity profile merging

  Scenario Outline: Good activity profile merging: [<type>] request cluster

    Given a [<type>] activityProfileMerging request cluster
    When the request is made on the primed LRS
    Then the activityProfileMerging response is verified

  Examples:
    | type      |
    | shallow   |
    | deep      |

  Scenario Outline: Bad activity profile merging: [<type>] request cluster

    Given a [<type>] activityProfileMerging request cluster
    When the request is made on the primed LRS
    Then the LRS responds with HTTP 400
    Then the activityProfileMerging response is verified

  Examples:
    | type                    |
    | mergeJSONWithNotJSON    |
    | mergeNotJSONWithJSON    |
