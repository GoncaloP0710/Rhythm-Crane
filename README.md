## Game Title: Rhythm Crane Game

### Overview
Rhythm Crane Game is an exciting and unique blend of rhythm and crane games. Players must hit notes in time with the music and the correct camera angle to control a crane machine and capture the character "Tux". The game features three different camera angles to enhance the gameplay experience.

### Tests Preview

<div align="center">
  <img src="/README_Files/Game.png" alt="plot" width="500"/>
  <p><em>Image: Game in action!</em></p>
</div>

<div align="center">
  <img src="/README_Files/Menu.png" alt="plot" width="500"/>
  <p><em>Image: Main menu.</em></p>
</div>

### Features
- **Rhythm Gameplay**: Hit notes in time with the music to control the crane.
- **Crane Machine**: Use the crane to capture Tux and earn points.
- **Multiple Camera Angles**: Switch between three different camera angles for a dynamic view of the game.
- **Score System**: Keep track of your score as you capture Tux and hit notes.

### Controls
- **Arrow Keys**: Use the "a", "w", "s" and "d" keys to hit notes in the rhythm game.
- **Space Bar**: Press the space bar to interact with the crane machine.
- **Camera Switch**: Press keys 1, 2, or 3 to switch between different camera angles. Each camera has diferent mechanics. Certain notes can only be pressed in a specific camera.

### Installation
1. Download and install [Godot Engine](https://godotengine.org/).
2. Clone or download the game repository.
3. Open the project in Godot Engine.

### How to Play
1. Start the game from the main menu.
2. Use the keys to hit notes as they reach the line.
3. Press the space bar to interact with the crane machine.
4. Switch between camera angles using keys 1, 2, or 3.
5. Capture Tux with the crane to earn points.
6. Keep track of your score on the screen.

### Game Files
- **score.gd**: Manages the score and updates the [`RichTextLabel`](command:_github.copilot.openSymbolFromReferences?%5B%22%22%2C%5B%7B%22uri%22%3A%7B%22scheme%22%3A%22file%22%2C%22authority%22%3A%22%22%2C%22path%22%3A%22%2Fhome%2Fgoncalop0710%2Fddj-individual-game%2Fscripts%2Fscore.gd%22%2C%22query%22%3A%22%22%2C%22fragment%22%3A%22%22%7D%2C%22pos%22%3A%7B%22line%22%3A2%2C%22character%22%3A19%7D%7D%5D%2C%220d175081-13d9-407b-8d0b-fcae3402e85c%22%5D "Go to definition") with the current score.
- **claw.gd**: Controls the movement of the crane and handles input for moving the crane.
- **crane_machine.gd**: Manages the crane machine, including generating target positions and handling camera changes.
- **note_spawner.gd**: Spawns notes based on a timer and handles note creation.
- **note.gd**: Controls the behavior of individual notes, including movement and collision detection.

### Signals
- **position_changed**: Emitted when the crane's position changes.
- **camera_position_changed**: Emitted when the camera position changes.
- **tux_captured**: Emitted when Tux is captured by the crane.
- **move_claw**: Emitted by notes to move the crane in a specific direction.

### Credits
- **Game Development**: Goncalo Pinto
- **Art**: Goncalo Pinto

### Contact
For any questions or feedback, please contact my email.

Enjoy playing Rhythm Crane Game!
