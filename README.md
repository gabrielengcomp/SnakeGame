
# Snake Game in 16-bit Assembly

This project is an implementation of the classic **Snake Game** written in 16-bit assembly language. The processor was developed for the Instituto Superior Técnico (IST) in Portugal.

## Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Setup and Execution](#setup-and-execution)
- [How to Play](#how-to-play)

## Features

- Classic Snake gameplay with directional movement.
- Randomized fruit placement for scoring.
- Simple and efficient code structure tailored for educational purposes.

## Project Structure

- **`ProjSnakeGame.as`**: Main assembly source file containing the game logic.
- **`assembler.zip`**: Contains the assembler tools required to compile the assembly code.
- **`p3sim.jar`**: Java-based simulator for running the assembled code.
- **`manual.pdf`**: Documentation for the assembler and simulator.
- **`tutorial-p3.pdf`**: Tutorial for setting up and using the simulator.

## Requirements

To run this project, you will need:

- Java Runtime Environment (JRE) to execute the `p3sim.jar` simulator.
- A Windows, macOS, or Linux operating system.

## Setup and Execution

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/gabrielengcomp/SnakeGame.git
   ```

2. **Extract Assembler Tools**:
   Unzip the `assembler.zip` file to a directory of your choice.

3. **Assemble the Code**:
   - Navigate to the directory containing the assembler tools.
   - Use the assembler to compile `ProjSnakeGame.as` into machine code.
   - Refer to `manual.pdf` for detailed instructions on using the assembler.

4. **Run the Simulator**:
   - Ensure you have Java installed on your system.
   - Open a terminal or command prompt.
   - Navigate to the directory containing `p3sim.jar`.
   - Execute the simulator with the assembled machine code:
     ```bash
     java -jar p3sim.jar [assembled_code_file]
     ```
   - For detailed usage of the simulator, refer to `tutorial-p3.pdf`.

## How to Play

- Use the arrow keys to control the direction of the snake:
  - Up: ↑
  - Down: ↓
  - Left: ←
  - Right: →
- The objective is to eat the fruit (`#`) that appears randomly on the screen.
- Each fruit consumed increases your score and the length of the snake.
- Avoid colliding with the walls or the snake's own body, as this will end the game.

---
