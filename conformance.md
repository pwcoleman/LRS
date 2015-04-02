grunt --feature=features/about.feature

    53 passing


grunt --feature=features/saveStatement.feature

    91 passing (2s)
    14 failing

  1) saveStatement Good save statement: attachment request Then the LRS responds with HTTP 204:
     AssertionError: Response status: 500, expected: [204]

  2) saveStatement Bad save statement: typical request with method set to 'POST' Then the LRS responds with HTTP 400:
     Uncaught AssertionError: Response status: 200, expected: [400]

  3) saveStatement Bad save statement: typical request with resource set to 'statement' Then the LRS responds with HTTP 400:
     AssertionError: Response status: 404, expected: [400]

  4) saveStatement Bad save statement: minimal request with method set to 'PUT' Then the LRS responds with HTTP 400:
     Uncaught AssertionError: Response status: 204, expected: [400]

  5) saveStatement Bad save statement: minimal request with resource set to 'statement' Then the LRS responds with HTTP 400:
     AssertionError: Response status: 404, expected: [400]

  6) saveStatement Bad save statement: minimal request with content set to 'null' When the request is made:
     Uncaught TypeError: Cannot read property 'id' of undefined

  7) saveStatement Bad save statement: typical request missing Content-Type header Then the LRS responds with HTTP 400:
     Uncaught AssertionError: Response status: 204, expected: [400]

  8) saveStatement Bad save statement: typical request missing statementId parameter Then the LRS responds with HTTP 400:
     Uncaught AssertionError: Response status: 204, expected: [400]

  9) saveStatement Bad save statement: minimal request missing Content-Type header Then the LRS responds with HTTP 400:
     Uncaught AssertionError: Response status: 200, expected: [400]

  10) saveStatement Bad save statement: typical request with bad Content-Type header 'bad content type' Then the LRS responds with HTTP 400:
     Uncaught AssertionError: Response status: 204, expected: [400]

  11) saveStatement Bad save statement: typical request with bad statementId parameter 'bad statementId' Then the LRS responds with HTTP 400:
     Uncaught AssertionError: Response status: 204, expected: [400]

  12) saveStatement Bad save statement: minimal request with bad Content-Type header 'bad content type' Then the LRS responds with HTTP 400:
     Uncaught AssertionError: Response status: 200, expected: [400]

  13) saveStatement Bad save statement: minimal request with bad statementId parameter 'cebba04a-158a-4e2e-8b6d-82bav2b9c07e' Then the LRS responds with HTTP 400:
     Uncaught AssertionError: Response status: 200, expected: [400]

  14) saveStatement Bad save statement: minimal request with bad statementId parameter 'bad statementId' Then the LRS responds with HTTP 400:
     Uncaught AssertionError: Response status: 200, expected: [400]
