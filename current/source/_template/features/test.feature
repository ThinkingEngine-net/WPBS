Feature: Drupal.org search
	In order to find modules on Drupal.org
	As a Drupal user
	I need to be able to use Drupal.org search

#@javascript
Scenario: Saerching for "behat"
	Given I go to "https://www.drupal.org/"
	And I press "edit-submit"
	When I fill in "edit-search-block-form--2" with "behat"
	And I press "edit-submit"
	Then I should see "Behat Drupal Extension"
