package game

import rl "vendor:raylib"

main :: proc() {
    rl.InitWindow(WindowWidth, WindowHeight, "My First Game")

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}