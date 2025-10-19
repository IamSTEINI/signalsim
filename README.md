# Signalsim - SIGNAL SIMULATOR

A very cool browsergame I've built to play around with gates and other elements!

Built with 💖 by Stein for SIEGE / Hack Club.

## What is SIGNALSIM?

Signalsim (signal simulator) lets you experiment with fundamental digital logic. Drag nodes onto the canvas, connect them with wires, and build amazing stuff!

It’s great for learning and having fun!

## Features

- Real‑time signal and visual feedback
- Lightweight, runs locally in your browser (no install!!!)
- A library of logic and utility nodes to compose complex behavior (since you can't combine any circuits!)

## Node library

Each node has inputs/outputs you can wire together. Current built‑ins include:

- Input: A manual value source (often -n to n)
- Button: A button to emit a pulse
- Clock: Periodic source that emits ticks at a fixed interval (in ms)
- Inverter: Outputs the opposite of its input
- AND: Outputs 1 when all inputs are 1
- OR: Outputs 1 when any input is 1
- XOR: Outputs 1 when an odd number of inputs are 1
- Adder: Adds numeric inputs
- Subtractor: Subtracts one numeric input from another
- Binary Encoder: Converts int inputs into a binary code
- Binary Decoder: Converts a binary code into int outputs
- Display: Shows a numeric value for easy view
- Light: Visual indicator that turns on when signal is 1 or higher
- Node: Was just a testing node at first

## Controls

- Drag to move nodes, click ports to start a wire to a destination port to connect
