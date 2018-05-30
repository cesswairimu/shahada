Feature: Lecturer signup

    Scenario: It renders a signup form
        Given I am on home page
        When I click on "Sign up as Lecturer" button
        Then I should see "Lecturer Sign Up Form"

    Scenario: It signs up a lecturer
        Given I am on users_new page
        And I fill in the form with
        When I click the "Sign Up" button
        Then I should see "Check mail to activate account"
