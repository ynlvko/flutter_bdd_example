import 'package:iat_example/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

@testMethodName: testGoldens
Feature: HomePage
    Scenario: HomePage leads to AccountPage
        Given The app is rendered
        When I tap {'Go to Account'} text
        Then I see exactly {1} {AccountPage} widgets

    Scenario Outline: Golden example
        Given The app is rendered
        And Default language is <lang>
        When I tap {'change language'} button
        Then <screenshot> screenshot verified
        Examples:
            | lang |  screenshot  |
            | 'en' | 'counter_en' |
            | 'uk' | 'counter_uk' |
