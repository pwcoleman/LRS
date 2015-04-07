# encoding: UTF-8
Feature: Agent profile merging

  Scenario Outline: Good agent profile merging: [<type>] request cluster

    Given a [<type>] agentProfileMerging request cluster
    When the request is made on the primed LRS
    Then the agentProfileMerging response is verified

  Examples:
    | type    |
    | shallow |
    | deep    |

  Scenario Outline: Bad agent profile merging: [<type>] request cluster

    Given a [<type>] agentProfileMerging request cluster
    When the request is made on the primed LRS
    Then the LRS responds with HTTP 400
    Then the agentProfileMerging response is verified

  Examples:
    | type                  |
    | mergeJSONWithNotJSON  |
    | mergeNotJSONWithJSON  |
