# encoding: UTF-8
Feature: statement structure actor test

  Scenario Outline: Good actor: [<object>]

    Given a [<type>] saveStatement request
    Given the statement actor is changed to a [<object>]
    When the request is made
    Then the request was successful

  Examples:
    | type    | object                  |
    | typical | mboxAndType agent       |
    | typical | mboxSha1AndType agent   |
    | typical | openidAndType agent     |
    | typical | accountAndType agent    |
    | typical | mboxOnly agent          |
    | typical | mboxSha1Only agent      |
    | typical | openidOnly agent        |
    | typical | accountOnly agent       |
    | typical | mboxAndType group       |
    | typical | mboxSha1AndType group   |
    | typical | openidAndType group     |
    | typical | accountAndType group    |

  Scenario Outline: Bad actor: [<object>] with bad [<property>] '[<value>]'

    Given a [<type>] saveStatement request
    Given the statement actor is changed to a [<object>]
    Given the statement actor [<property>] is changed to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | object                                | property                  | value                            |
    | 400  | typical | mboxAndType agent                     | mbox                      | conformancetest@tincanapi.com    |
    | 400  | typical | mboxAndType agent                     | mbox                      | bad mbox                         |
    | 400  | typical | mboxAndType agent                     | objectType                | notAgent                         |
    | 400  | typical | mboxAndType group                     | mbox                      | conformancetest@tincanapi.com    |
    | 400  | typical | mboxAndType group                     | mbox                      | bad mbox                         |
    | 400  | typical | mboxAndType group                     | objectType                | notGroup                         |
    | 400  | typical | allPropertiesMboxAgentMember group    | member 0 mbox             | conformancetest@tincanapi.com    |
    | 400  | typical | allPropertiesMboxAgentMember group    | member 0 mbox             | bad mbox                         |
    | 400  | typical | openidAndType agent                   | openid                    | bad openid                       |
    | 400  | typical | accountAndType agent                  | account homePage          | bad homePage                     |
    | 400  | typical | mboxAndType agent                     | objectType                | agent                            |
    | 400  | typical | openidAndType group                   | openid                    | bad openid                       |
    | 400  | typical | accountAndType group                  | account homePage          | bad homePage                     |
    | 400  | typical | mboxAndType group                     | objectType                | group                            |
    | 400  | typical | allPropertiesOpenidAgentMember group  | member 0 openid           | bad openid                       |
    | 400  | typical | allPropertiesAccountAgentMember group | member 0 account homePage | bad homePage                     |
    | 400  | typical | openidOnly agent                      | openid                    | bad URI                          |

  Scenario Outline: Bad actor: [<object>] missing [<property>]

    Given a [<type>] saveStatement request
    Given the statement actor is changed to a [<object>]
    Given the statement actor [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | object                             | property            |
    | 400  | typical | mboxAndType agent                  | mbox                |
    | 400  | typical | mboxSha1AndType agent              | mbox_sha1sum        |
    | 400  | typical | openidAndType agent                | openid              |
    | 400  | typical | accountAndType agent               | account             |
    | 400  | typical | accountAndType agent               | account name        |
    | 400  | typical | accountAndType agent               | account homePage    |
    | 400  | typical | mboxOnly agent                     | mbox                |
    | 400  | typical | mboxSha1Only agent                 | mbox_sha1sum        |
    | 400  | typical | openidOnly agent                   | openid              |
    | 400  | typical | accountOnly agent                  | account             |
    | 400  | typical | mboxAndType group                  | mbox                |
    | 400  | typical | mboxSha1AndType group              | mbox_sha1sum        |
    | 400  | typical | openidAndType group                | openid              |
    | 400  | typical | accountAndType group               | account             |
    | 400  | typical | accountAndType group               | account name        |
    | 400  | typical | accountAndType group               | account homePage    |
    | 400  | typical | allPropertiesMboxAgentMember group | objectType          |

  Scenario Outline: Good actor: [<object>] missing [<property>]

    Given a [<type>] saveStatement request
    Given the statement actor is changed to a [<object>]
    Given the statement actor [<property>] is removed
    When the request is made
    Then the request was successful

  Examples:
    | type    | object            | property    |
    | typical | mboxAndType group | objectType  |
