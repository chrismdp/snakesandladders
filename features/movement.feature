Feature: Movement
  In order to move around the board
  As a player 
  I want to roll dice and move up and down the board

  Background:
    Given the board:
      |. . . . . . . . . .|
      |. . . . . . . . . .|
      |. . . . . . . . . .|
      |. . . . . . . . . .|
      |. . . . . . . . . .|
      |. . . . . . . . . .|
      |. . . . . . . . . .|
      |. . . . . . . . . .|
      |. . . . . . . . . .|
      |. . 02. 10. . . . .|
  
  Scenario: Starting a game
    When I start a game with 2 players
    And player 1 rolls 1
    Then player 1 is now on position 1
    
  Scenario: Basic movement
    Given player 1 is on position 50
    When player 1 rolls 3
    Then player 1 is now on position 53
    And it is now player 2's go

  Scenario: Roll a six, take another go
    Given player 1 is on position 50
    When player 1 rolls 6
    Then player 1 is now on position 56
    And it is now player 1's go

  Scenario: Going up ladders
    Given player 1 is on position 2
    When player 1 rolls 3
    Then player 1 is now on position 10

  Scenario: Going down snakes
    Given player 1 is on position 2
    When player 1 rolls 1
    Then player 1 is now on position 2
