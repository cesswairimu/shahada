Feature: Student signup

    Scenario: It renders a signup form
        Given I am on home page
        When I click on "Sign up as student" button
        Then I should see "student Sign Up Form"

    Scenario: It signs up a student
        Given I am on users_new page
        And I fill in the form with
        When I click the "Sign Up" button
        Then I should see "Check mail to activate account"
