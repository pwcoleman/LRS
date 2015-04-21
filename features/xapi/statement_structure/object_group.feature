# encoding: UTF-8
Feature: statement structure object group test


  Scenario Outline: Good object group: [<object>]

    Given a [<type>] saveStatement request
    Given the statement object is changed to a [<object>]
    When the request is made
    Then the request was successful (204)

  Examples:
    | type    | object                    |
    | typical | mboxAndType group         |
    | typical | mboxSha1AndType group     |
    | typical | openidAndType group       |
    | typical | accountAndType group      |


  Scenario Outline: Bad object group: [<object>] with bad [<property>] '[<value>]'

    Given a [<type>] saveStatement request
    Given the statement object is changed to a [<object>]
    Given the statement object [<property>] is changed to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | object                                | property                  | value                            |
    | 400  | typical | mboxAndType group                     | mbox                      | conformancetest@tincanapi.com    |
    | 400  | typical | mboxAndType group                     | mbox                      | bad mbox                         |
    | 400  | typical | mboxAndType group                     | objectType                | notGroup                         |
    | 400  | typical | allPropertiesMboxAgentMember group    | member 0 mbox             | conformancetest@tincanapi.com    |
    | 400  | typical | allPropertiesMboxAgentMember group    | member 0 mbox             | bad mbox                         |
    | 400  | typical | accountAndType group                  | account homePage          | bad homePage                     |
    | 400  | typical | mboxAndType group                     | objectType                | group                            |
    | 400  | typical | openidAndType group                   | openid                    | bad openid                       |
    | 400  | typical | allPropertiesOpenidAgentMember group  | member 0 openid           | bad openid                       |
    | 400  | typical | allPropertiesAccountAgentMember group | member 0 account homePage | bad homePage                     |


  Scenario Outline: Bad object group: [<object>] missing [<property>]

    Given a [<type>] saveStatement request
    Given the statement object is changed to a [<object>]
    Given the statement object [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | object                             | property            |
    | 400  | typical | mboxAndType group                  | objectType          |
    | 400  | typical | mboxAndType group                  | mbox                |
    | 400  | typical | mboxSha1AndType group              | mbox_sha1sum        |
    | 400  | typical | openidAndType group                | openid              |
    | 400  | typical | accountAndType group               | account             |
    | 400  | typical | accountAndType group               | account name        |
    | 400  | typical | accountAndType group               | account homePage    |
    | 400  | typical | allPropertiesMboxAgentMember group | objectType          |
