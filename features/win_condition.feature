Feature: Win condition
  In order to win the game
  As a player 
  I want to land on space 100 and win the game

  Background:
    Given a board with:
      | type   | from | to |
      | snake  | 3    | 2  |
      | ladder | 5    | 10 |
    And I start a game with 2 players

  Scenario: Win the game
    Given player 1 is on position 97
    And player 1 rolls 3
    Then player 1 has won the game

  Scenario: Bounce back
    Given player 1 is on position 98
    And player 1 rolls 3
    Then player 1 is now on position 99

