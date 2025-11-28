# Gridbot - A Robot Movement Simulator (Ruby)

A command-line application that simulates a robot moving on a 6×6 grid.
The robot (gridbot) can be placed, moved, rotated, and can report its current position.

This project includes:

- `gridbot_sim.rb` — main application
- RSpec test suite under `spec/`

---

## 📥 Cloning the Repository

Clone the project using:

```bash
git clone git@github.com:neilmarion/gridbot.git
cd gridbot
```

---

## 🚀 Requirements

- Ruby **3.0 or later**
- (Optional) RSpec if you want to run the tests

Check your Ruby version:

```bash
ruby -v
```

## 🚀 Project Structure

```
.
├── gridbot.rb
├── command_processor.rb
├── README.md
└── spec
    ├── gridbot_spec.rb
    └── command_processor_spec.rb
```

## ▶️ Running the Application

This application reads commands from STDIN.

# Option 1 — Run interactively

```
ruby command_processor.rb
```

Then manually type commands, e.g.:

```
PLACE 0,0,N
MOVE
REPORT
```

End input with:

Ctrl+D (macOS/Linux)

Ctrl+Z, then Enter (Windows)

# Option 2 — Run using a file

Create a file:

```
echo -e "PLACE 0,0,E\nMOVE\nREPORT" > commands.txt
```

Run:
```
ruby gridbot.rb < commands.txt
```

# 🧠 Supported Commands
| Command          | Description                                        |
| ---------------- | -------------------------------------------------- |
| `PLACE X,Y,O`    | Places robot at X,Y with orientation O (`N,E,S,W`) |
| `MOVE`           | Moves robot 1 step forward                         |
| `LEFT` / `RIGHT` | Rotates robot 90°                                  |
| `REPORT`         | Prints `X,Y,O` to STDOUT                           |


# Notes

Commands are ignored until a valid PLACE command is received.

The robot cannot leave the 6×6 grid (0 to 5 in both axes).

Invalid moves are ignored safely.

# 📌 Example
Input:
```
PLACE 0,0,N
MOVE
MOVE
RIGHT
MOVE
REPORT
```

Output:
```
1,2,E
```

# 🧪 Running Tests
Install RSpec (if not installed):
```
gem install rspec
```

Run the test suite:
```
rspec
```

You should see passing tests for both the robot logic and command parsing.
