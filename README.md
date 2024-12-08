# rpg_character_sheet

This was the first course project for course CS-E4270 - Device-Agnostic Design from Aalto University

The application is running here: https://rpg-character-sheet-app.web.app

## Idea of the application

The application is a character sheet storage for role-playing games. The character data that is asked is simplified from the game Dungeons and Dragons (D&D) 5th edition. In order to use the application 'correctly' the user should know some D&D rules in order to get the ability scores 'right', since the application does not help or check if the rules are followed. However, the application calculates proficiency bonus based on the level of the character, and skill bonuses from ability scores. The proficiency bonus is also added to the bonus if the user indicated that the character has a proficiency in that skill.

Currently it is not possible to level up the charater or do other modifications, but it is possible to add items to the charater's inventory.

## How to use

The front page of the application shows the list of the characters and either a floating action button or a regular button (depends on the width of the screen) for creating a new character. Pressing that button will navigate to a form where the basic information of the character is given. There are some validators on some the fields.

When the character is saved, it will appear to the front page as a button. By clicking that button the character sheet will be visible with the provided and calculated information. There is a functionality to increase or decrease the hit points of the character, but the changed value is not saved between reloads. On the bottom-left side of the screen there is a button for navigating to home screen.

The character sheet also have a button to access the character's inventory. The button also shows the number of items there are in the inventory. By pressing that button a table with items (or text 'No items in inventory') is visible. The screen contains the total weight of the items in inventory and a button to add items. Adding item is a simple form with fields for name, weight and quantity. Item appears to the table after save. On the bottom-left side of the screen there is a button for navigating back to character sheet.