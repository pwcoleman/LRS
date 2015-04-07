# encoding: UTF-8
Feature: Activity profile concurrency

  Scenario: Good activity profile concurrency: noneMatch request cluster (no priming required)

    Given a noneMatch activityProfileConcurrency request cluster
    When the request is made
    Then the activityProfileConcurrency response is verified

  Scenario Outline: Good activity profile concurrency: [<type>] request cluster

    Given a [<type>] activityProfileConcurrency request cluster
    When the request is made on the primed LRS
    Then the activityProfileConcurrency response is verified

  Examples:
    | type                        |
    | correctMatch                |
    | correctMatchUpperCaseEtag   |

  Scenario Outline: Bad activity profile concurrency: [<type>] request cluster

    Given a [<type>] activityProfileConcurrency request cluster
    When the request is made on the primed LRS
    Then the LRS responds with HTTP [<HTTP>]
    Then the activityProfileConcurrency response is verified

  Examples:
    | type                  | HTTP  |
    | incorrectNoneMatch    | 412   |
    | incorrectMatch        | 412   |
    | ifMatchAndIfNoneMatch | 412   |
    | noMatchHeaders        | 409   |

  Scenario: Bad activity profile concurrency: no match headers cluster

    Given a noMatchHeaders activityProfileConcurrency request cluster
    When the request is made on the primed LRS
    Then the LRS responds with HTTP 409
    Then the typeof response body is not equal to 'undefined'
    Then the response body is not equal to ''
    Then the response body is not equal to 'null'
    Then the activityProfileConcurrency response is verified
