*** Settings ***
Documentation  DIO Profile Tests

*** Test Cases ***
Verify Infinite Loading Bug
    Log    Validating that the direct URL access causes an infinite loading loop due to a 404 on relative assets.
