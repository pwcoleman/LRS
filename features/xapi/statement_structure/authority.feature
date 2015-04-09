# encoding: UTF-8
# TODO: need to make sure this is a permissed account being tested
#       otherwise no way to distinguish valid 403s vs. across the board 403s
#       other than that the first two tests fail for non-permissed
@Pending
Feature: statement structure authority test

  Scenario Outline: Good authority: [<object>]

    Given a [<type>] saveStatement request
    Given the statement authority is changed to a [<object>]
    When the request is made
    Then the request was successful

  Examples:
    | type    | object                      |
    | typical | consumerOnly authority      |
    | typical | consumerAndUser authority   |

  Scenario Outline: Bad authority: [<object>]

    Given a [<type>] saveStatement request
    Given the statement authority is changed to a [<object>]
    When the request is made
    Then the LRS responds with HTTP 403

  Examples:
    | type    | object                    |
    | typical | mboxAndType agent         |
    | typical | mboxSha1AndType agent     |
    | typical | openidAndType agent       |
    | typical | accountAndType agent      |
    | typical | mboxOnly agent            |
    | typical | mboxSha1Only agent        |
    | typical | openidOnly agent          |
    | typical | accountOnly agent         |
    | typical | mboxAndType agent         |
    | typical | mboxSha1AndType agent     |
    | typical | openidAndType agent       |
    | typical | accountAndType agent      |

  Scenario Outline: Bad authority: [<object>] with bad [<property>] '[<value>]'

    Given a [<type>] saveStatement request
    Given the statement authority is changed to a [<object>]
    Given the statement authority [<property>] is changed to '[<value>]'
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
    | 400  | typical | accountAndType group                  | account homePage          | bad homePage                     |
    | 400  | typical | mboxAndType agent                     | objectType                | agent                            |
    | 400  | typical | mboxAndType group                     | objectType                | group                            |
    | 400  | typical | openidAndType group                   | openid                    | bad openid                       |
    | 400  | typical | accountAndType agent                  | account homePage          | bad homePage                     |
    | 400  | typical | allPropertiesOpenidAgentMember group  | member 0 openid           | bad openid                       |
    | 400  | typical | allPropertiesAccountAgentMember group | member 0 account homePage | bad homePage                     |

  Scenario Outline: Bad authority: [<object>] missing [<property>]

    Given a [<type>] saveStatement request
    Given the statement authority is changed to a [<object>]
    Given the statement authority [<property>] is removed
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | object                             | property          |
    | 400  | typical | accountAndType agent               | account name      |
    | 400  | typical | accountAndType agent               | account homePage  |
    | 403  | typical | mboxAndType group                  | objectType        |
    | 400  | typical | accountAndType group               | account name      |
    | 400  | typical | accountAndType group               | account homePage  |
    | 400  | typical | allPropertiesMboxAgentMember group | objectType        |
    | 400  | typical | mboxAndType agent                  | mbox              |
    | 400  | typical | mboxSha1AndType agent              | mbox_sha1sum      |
    | 400  | typical | openidAndType agent                | openid            |
    | 400  | typical | accountAndType agent               | account           |
    | 400  | typical | mboxAndType group                  | mbox              |
    | 400  | typical | mboxSha1AndType group              | mbox_sha1sum      |
    | 400  | typical | openidAndType group                | openid            |
    | 400  | typical | accountAndType group               | account           |
    | 400  | typical | mboxOnly agent                     | mbox              |
    | 400  | typical | mboxSha1Only agent                 | mbox_sha1sum      |
    | 400  | typical | openidOnly agent                   | openid            |
    | 400  | typical | accountOnly agent                  | account           |
