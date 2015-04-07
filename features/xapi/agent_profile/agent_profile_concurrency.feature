# encoding: UTF-8
Feature: Agent profile concurrency

  Scenario: Good agent profile concurrency: noneMatch request cluster (no priming required)

    Given a noneMatch agentProfileConcurrency request cluster
    When the request is made
    Then the agentProfileConcurrency response is verified

  Scenario Outline: Good agent profile concurrency: [<type>] request cluster

    Given a [<type>] agentProfileConcurrency request cluster
    When the request is made on the primed LRS
    Then the agentProfileConcurrency response is verified

  Examples:
    | type                        |
    | correctMatch                |
    | correctMatchUpperCaseEtag   |

  Scenario Outline: Bad agent profile concurrency: [<type>] request cluster

    Given a [<type>] agentProfileConcurrency request cluster
    When the request is made on the primed LRS
    Then the LRS responds with HTTP 412
    Then the agentProfileConcurrency response is verified

  Examples:
    | type                    |
    | incorrectNoneMatch      |
    | incorrectMatch          |
    | ifMatchAndIfNoneMatch   |

  Scenario: Bad agent profile concurrency: no match headers cluster

    Given a noMatchHeaders agentProfileConcurrency request cluster
    When the request is made on the primed LRS
    Then the LRS responds with HTTP 409
    Then the typeof response body is not equal to 'undefined'
    Then the response body is not equal to ''
    Then the response body is not equal to 'null'
    Then the agentProfileConcurrency response is verified
