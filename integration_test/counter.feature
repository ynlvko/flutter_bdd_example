Feature: Counter

    Background:
        Given iprelude
        Given the app is running

    Scenario: HomePage has "Go to Account" button
        Then I see {'Go to Account'} text

    Scenario: AccountPage shows account information
        When I tap {'Go to Account'} text
        And I wait
        And I swipe from top to bottom
        Then I see {'Philip'} text
        And I see {'Fry'} text

    Scenario: InfoPage shows company name
        When I tap {'Go to Info'} text
        And I wait
        And I swipe from top to bottom
        Then I see {'SoftContruct'} text
