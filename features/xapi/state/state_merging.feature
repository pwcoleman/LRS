# encoding: UTF-8
Feature: State merging

  Scenario Outline: Good state merging: [<type>] request cluster

    Given a [<type>] stateMerging request cluster
    When the request is made on the primed LRS
    Then the stateMerging response is verified

  Examples:
    | type                    |
    | shallow                 |
    | deep                    |
    | mergeWithRegistration   |

  Scenario Outline: Bad state merging: [<type>] request cluster

    Given a [<type>] stateMerging request cluster
    When the request is made on the primed LRS
    Then the LRS responds with HTTP 400
    Then the stateMerging response is verified

  Examples:
    | type                    |
    | mergeJSONWithNotJSON    |
    | mergeNotJSONWithJSON    |
