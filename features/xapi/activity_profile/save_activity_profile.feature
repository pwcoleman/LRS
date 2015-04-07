# encoding: UTF-8
Feature: Save activity profile

  Scenario Outline: Good save activity profile: [<type>] request

    Given a [<type>] saveActivityProfile request
    When the request is made
    Then the LRS responds with HTTP 204

  Examples:
    | type      |
    | typical   |
    | JSON      |

  Scenario Outline: Good save activity profile: [<type>] request missing [<property>]

    Given a [<type>] saveActivityProfile request
    Given the [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP 204

  Examples:
    | type    | property            |
    | typical | Content-Type header |
    | typical | content             |
    | JSON    | content             |

  Scenario Outline: Good save activity profile: [<type>] request with [<property>] set to '[<value>]'

    Given a [<type>] saveActivityProfile request
    Given the [<property>] is set to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP 204

  Examples:
    | type    | property            | value             |
    | typical | Content-Type header | test content type |
    | typical | content             | test content      |
    | JSON    | method              | POST              |

  Scenario Outline: Bad save activity profile: typical request missing [<property>]

    Given a typical saveActivityProfile request
    Given the [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | property             |
    | 401  | authority header     |
    | 400  | activityId parameter |

# Pending because it will pass in 0.9 enabled LRSs, need to detect those and annotate accordingly
  @Pending
  Scenario: Bad save activity profile: typical request missing version header

    Given a typical saveActivityProfile request
    Given the version header is removed
    When the request is made
    Then the LRS responds with HTTP 400

  Scenario Outline: Bad save activity profile: typical request with bad [<property>] '[<value>]'

    Given a typical saveActivityProfile request
    Given the [<property>] is set to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | property             | value                                                       |
    | 400  | resource             | activity/state                                              |
    | 400  | resource             | activities/states                                           |
    | 405  | resource             | activities                                                  |
    | 400  | version header       | bad version                                                 |
    | 400  | version header       | 3.8.0                                                       |
    | 400  | authority header     | Basic badAuth                                               |
    | 401  | authority header     | Basic TnsHNWplME1YZnc0VzdLTHRIWTo0aDdBb253Ml85WU53vSZLNlVZ  |
    | 400  | method               | POST                                                        |
    | 400  | activityId parameter | bad URI                                                     |
