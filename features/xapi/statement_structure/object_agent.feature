# encoding: UTF-8
Feature: statement structure object agent test


  Scenario Outline: Good object agent: [<object>]

    Given a [<type>] saveStatement request
    Given the statement object is changed to a [<object>]
    When the request is made
    Then the request was successful

  Examples:
    | type    | object                    |
    | typical | mboxAndType agent         |
    | typical | mboxSha1AndType agent     |
    | typical | openidAndType agent       |
    | typical | accountAndType agent      |



  Scenario Outline: Bad object agent: [<object>] with bad [<property>] '[<value>]'

    Given a [<type>] saveStatement request
    Given the statement object is changed to a [<object>]
    Given the statement object [<property>] is changed to '[<value>]'
    When the request is made
    Then the LRS responds with HTTP [<HTTP>]

  Examples:
    | HTTP | type    | object                                | property                  | value                          |
    | 400  | typical | mboxAndType agent                     | mbox                      | conformancetest@tincanapi.com  |
    | 400  | typical | mboxAndType agent                     | mbox                      | bad mbox                       |
    | 400  | typical | mboxAndType agent                     | objectType                | notAgent                       |
    | 400  | typical | openidAndType agent                   | openid                    | bad openid                     |
    | 400  | typical | mboxAndType agent                     | objectType                | agent                          |
    | 400  | typical | accountAndType agent                  | account homePage          | bad homePage                   |


  Scenario Outline: Bad object agent: [<object>] missing [<property>]

    Given a [<type>] saveStatement request
    Given the statement object is changed to a [<object>]
    Given the statement object [<property>] is removed
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
