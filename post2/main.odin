package game

import rl "vendor:raylib"

/*
main1 :: proc() {
    rl.InitWindow(1280, 720, "My First Game")

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)

        rl.DrawRectangleV({640,320}, {64, 64}, rl.GREEN)

        rl.EndDrawing()
    }

    rl.CloseWindow()
}

---

main2 :: proc() {
    rl.InitWindow(1280, 720, "My First Game")
    pos_x: f32 = 640

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)

        if rl.IsKeyDown(.LEFT) {
            pos_x -= 400*rl.GetFrameTime()
        } else if rl.IsKeyDown(.RIGHT) {
            pos_x += 400*rl.GetFrameTime()
        }

        rl.DrawRectangleV({pos_x,320}, {64, 64}, rl.GREEN)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}

----

main3 :: proc() {
    rl.InitWindow(1280, 720, "My First Game")

    player := Player {
        pos = {640, 320},
    }

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)

        if rl.IsKeyDown(.LEFT) {
            player.pos.x -= 400*rl.GetFrameTime()
        } else if rl.IsKeyDown(.RIGHT) {
            player.pos.x += 400*rl.GetFrameTime()
        }

        rl.DrawRectangleV(player.pos, {64, 64}, rl.GREEN)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}

---

Player :: struct {
    pos: rl.Vector2,
}

update_player :: proc(p: ^Player) {
    if rl.IsKeyDown(.LEFT) {
        p.pos.x -= 400*rl.GetFrameTime()
    } else if rl.IsKeyDown(.RIGHT) {
        p.pos.x += 400*rl.GetFrameTime()
    }
}

draw_player :: proc(p: Player) {
    rl.DrawRectangleV(p.pos, {64, 64}, rl.GREEN)
}

main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")

    player := Player {
        pos = {640, 320},
    }

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)
        update_player(&player)
        draw_player(player)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}*/

PlayerSize :: rl.Vector2 {64, 64}

Player :: struct {
    pos: rl.Vector2,
    vel: rl.Vector2,
}

update_player :: proc(p: ^Player) {
    if rl.IsKeyDown(.LEFT) {
        p.vel.x = -400
    } else if rl.IsKeyDown(.RIGHT) {
        p.vel.x = 400
    } else {
        p.vel.x = 0
    }

    if rl.IsKeyPressed(.SPACE) {
        p.vel.y = -600
    }

    p.vel.y += 2000 * rl.GetFrameTime()

    p.pos += p.vel * rl.GetFrameTime()

    if p.pos.y > f32(rl.GetScreenHeight()) - PlayerSize.y {
        p.pos.y = f32(rl.GetScreenHeight()) - PlayerSize.y
    }
}

draw_player :: proc(p: Player) {
    rl.DrawRectangleV(p.pos, PlayerSize, rl.GREEN)
}

main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")

    player := Player {
        pos = {640, 320},
    }

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)
        update_player(&player)
        draw_player(player)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}