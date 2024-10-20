# Fortran Game V2

This repository contains a simple two-player Connect Tokens game implemented in Fortran. Players take turns placing tokens on a game board, aiming to connect a specified number of tokens in a row horizontally, vertically, or diagonally. The game includes an undo feature and allows customization of the game board dimensions and difficulty level.

## Features

1. **Customizable Difficulty and Board Size**:
   - Set the number of tokens required to win (difficulty) between 3 and 6.
   - Customize the board dimensions or use the default size (7x6).

2. **Undo Feature**:
   - Players can undo their last move.

3. **Game Display**:
   - The game board is displayed after each move.

4. **Winning and Draw Conditions**:
   - The game checks for winning conditions (vertical, horizontal, diagonal) and handles draws.

## Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/your-username/connect-tokens-game.git
    cd connect-tokens-game
    ```

2. Compile the Fortran code using your preferred Fortran compiler. For example, with `gfortran`:

    ```sh
    gfortran -o connect_tokens connect_tokens.f90
    ```

## Usage

1. Run the compiled program:

    ```sh
    ./connect_tokens
    ```

2. Follow the on-screen instructions to set up the game:
    - Enter the number of tokens required to win (difficulty).
    - Choose the board dimensions or use the default size.

3. Players take turns entering their moves:
    - Enter a column number to place a token.
    - Enter `-1` to undo the last move.
    - Enter `0` to exit the game.

4. The game continues until a player wins, the board is filled (draw), or a player decides to exit.

## Code Explanation

### Module: `datahandling`

This module contains all subroutines and functions necessary for the Connect Tokens game.

- **Variables**:
  - `board`: A character array representing the game board.
  - `undoMove`: An array storing the coordinates of moves for undo functionality.
  - `undoindex`: An integer tracking the index of the last move for undo functionality.
  - `columns`, `rows`: Integers representing the dimensions of the game board.
  - `curcol`, `currow`: Integers representing the current position of the token.
  - `temp_column`, `temp_row`: Temporary integers used for iterating through the board.
  - `difficulty`: An integer specifying the number of tokens needed to win.
  - `user_command`: An integer storing user input for moves and settings.
  - `tokken`: A character representing the current player's token.
  - `is_on`: A logical variable indicating if the game is ongoing.
  - `firstPlayer`: A logical variable indicating the current player.

- **Subroutines**:
  1. `settings`: Sets up the initial game settings such as difficulty and board dimensions.
  2. `initiate`: Initializes the game board.
  3. `display`: Displays the current state of the game board.
  4. `insertinto`: Inserts a token into the specified column.
  5. `userInput`: Handles user input for moves and undo functionality.

### Main Program: `show`

- **Execution**:
  - Calls the `settings` subroutine to set up the game.
  - Calls the `initiate` subroutine to initialize the game board.
  - Executes a loop to allow players to take turns until the game ends.
  - Calls the `userInput` subroutine to handle player input.
  - Calls the `func` function to check for winning conditions after each move.

- **Function**:
  - `func`: Checks for winning conditions (vertical, horizontal, diagonal) and draws.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## Contact

For any questions or issues, please open an issue on the GitHub repository.


