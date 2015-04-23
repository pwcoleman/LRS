# encoding: UTF-8
Feature: statement structure object activity test

@focus
  Scenario Outline: Good object activity: [<modifier>] activity

    Given a [<type>] saveStatement request
    Given the statement object is changed to a [<modifier>] activity
    When the request is made
    Then the request was successful

  Examples:
    | type    | modifier          |
    | typical | idOnly            |
    | typical | idAndObjectType   |
    | typical | idAndDefinition   |
    | typical | allProperties     |


  Scenario Outline: Bad object activity: [<modifier>] activity with bad [<property>] '[<value>]'

    Given a [typical] saveStatement request
    Given the statement object is changed to a [<modifier>] activity
    Given the statement object [<property>] is changed to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP 400

  Examples:
    | modifier      | property                   | value              |
    | allProperties | id                         | bad id             |
    | allProperties | objectType                 | notActivity        |
    | allProperties | objectType                 | activity           |
    | allProperties | definition type            | bad IRI            |
    | allProperties | definition interactionType | bad interaction    |
    | allProperties | definition moreInfo        | bad IRL            |


  Scenario Outline: Bad object activity: [<modifier>] activity missing [<property>]

    Given a [<type>] saveStatement request
    Given the statement object is changed to a [<modifier>] activity
    Given the statement object [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | modifier      | property   |
    | 400  | typical | allProperties | id         |


  Scenario Outline: Good activity definition permutation: [<modifier>] definition

    Given an activity saveStatement request
    Given the statement object definition is set to a [<modifier>] activityDefinition
    When the request is made
    Then the request was successful

  Examples:
    | modifier                          |
    | nameOnly                          |
    | descriptionOnly                   |
    | typeOnly                          |
    | moreInfoOnly                      |
    | extensionsOnly                    |
    | emptyExtensionsOnly               |
    | allProperties                     |
    | trueFalse                         |
    | fillIn                            |
    | numeric                           |
    | other                             |
    | otherWithCorrectResponsesPattern  |
    | choice                            |
    | sequencing                        |
    | likert                            |
    | matching                          |
    | performance                       |
