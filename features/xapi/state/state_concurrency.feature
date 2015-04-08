# encoding: UTF-8
Feature: State concurrency

  Scenario: Good state concurrency: noneMatch request cluster (no priming required)

    Given a noneMatch stateConcurrency request cluster
    When the request is made
    Then the stateConcurrency response is verified

  Scenario Outline: Good state concurrency: [<type>] request cluster

    Given a [<type>] stateConcurrency request cluster
    When the request is made on the primed LRS
    Then the stateConcurrency response is verified

  Examples:
    | type                          |
    | correctMatch                  |
    | correctMatchUpperCaseEtag     |
    | correctMatchWithRegistration  |

  Scenario Outline: Bad state concurrency: [<type>] request cluster

    Given a [<type>] stateConcurrency request cluster
    When the request is made on the primed LRS
    Then the LRS responds with HTTP 412
    Then the stateConcurrency response is verified

  Examples:
    | type                      |
    | incorrectNoneMatch        |
    | incorrectMatch            |
    | ifMatchAndIfNoneMatch     |
