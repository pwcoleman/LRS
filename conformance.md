
###########################################################

1035 scenarios (5 failed, 259 pending, 771 passed)

4517 steps (5 failed, 774 skipped, 259 pending, 3479 passed)

0m25.180s


###########################################################
### FAILING CONFORMANCE
###########################################################

Feature: Retrieve state ids

Scenario Outline: Good retrieve state ids: [<type>] request cluster
  
1) Retrieve state id's Good retrieve state ids: typical request cluster (e45a7d21f59d415bbc75acfe302dd4fe) Then the retrieveStateIds response is verified:

++++++++++++++++
