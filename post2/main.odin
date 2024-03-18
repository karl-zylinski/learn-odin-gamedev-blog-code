package game

import rl "vendor:raylib"

// STEP 1
main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)
        >> rl.DrawRectangleV({640,320}, {64, 64}, {255, 180, 0, 255})
        rl.EndDrawing()
    }

    rl.CloseWindow()
}

// STEP 2
main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")
    >> player_pos := rl.Vector2 { 640, 320 }

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)

        >>>
        if rl.IsKeyDown(.LEFT) {
            player_pos.x -= 400*rl.GetFrameTime()
        }

        if rl.IsKeyDown(.RIGHT) {
            player_pos.x += 400*rl.GetFrameTime()
        }

        rl.DrawRectangleV(player_pos, {64, 64}, rl.GREEN)
        <<<
        rl.EndDrawing()
    }

    rl.CloseWindow()
}

// STEP 2.5
main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")
    
    player_pos := rl.Vector2 { 640, 320 }
    player_vel: rl.Vector2

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)

        if rl.IsKeyDown(.LEFT) {
            player_vel.x = -400
        } else if rl.IsKeyDown(.RIGHT) {
            player_vel.x = 400
        } else {
            player_vel.x = 0
        }

        player_pos += player_vel * rl.GetFrameTime()

        rl.DrawRectangleV(player_pos, {64, 64}, rl.GREEN)

        rl.EndDrawing()
    }

    rl.CloseWindow()
}

// STEP 3
main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")
    
    player_pos := rl.Vector2 { 640, 320 }
    player_vel: rl.Vector2

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)

        if rl.IsKeyDown(.LEFT) {
            player_vel.x = -400
        } else if rl.IsKeyDown(.RIGHT) {
            player_vel.x = 400
        } else {
            player_vel.x = 0
        }

        player_vel.y += 2000 * rl.GetFrameTime()
        
        if rl.IsKeyPressed(.SPACE) {
            player_vel.y = -600
        }

        player_pos += player_vel * rl.GetFrameTime()

        if player_pos.y > f32(rl.GetScreenHeight()) - 64 {
            player_pos.y = f32(rl.GetScreenHeight()) - 64
        }

        rl.DrawRectangleV(player_pos, {64, 64}, rl.GREEN)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}

// STEP 4

main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")
    
    player_pos := rl.Vector2 { 640, 320 }
    player_vel: rl.Vector2
    player_grounded: bool

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLUE)

        if rl.IsKeyDown(.LEFT) {
            player_vel.x = -400
        } else if rl.IsKeyDown(.RIGHT) {
            player_vel.x = 400
        } else {
            player_vel.x = 0
        }

        player_vel.y += 2000 * rl.GetFrameTime()

        if player_grounded && rl.IsKeyPressed(.SPACE) {
            player_vel.y = -600
            player_grounded = false
        }

        player_pos += player_vel * rl.GetFrameTime()

        if player_pos.y > f32(rl.GetScreenHeight()) - 64 {
            player_pos.y = f32(rl.GetScreenHeight()) - 64
            player_grounded = true
        }

        rl.DrawRectangleV(player_pos, {64, 64}, rl.GREEN)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}

/*
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
}

PlayerSize :: rl.Vector2 {64, 64}

Player :: struct {
    pos: rl.Vector2,
}

update_player :: proc(p: ^Player) {
    if rl.IsKeyDown(.LEFT) {
        p.pos.x -= 400 * rl.GetFrameTime()
    } else if rl.IsKeyDown(.RIGHT) {
        p.pos.x += 400 * rl.GetFrameTime()
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
}

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

    p.vel.y += 2000 * rl.GetFrameTime()
    p.pos += p.vel * rl.GetFrameTime()

    if p.pos.y > f32(rl.GetScreenHeight()) - PlayerSize.y {
        p.pos.y = f32(rl.GetScreenHeight()) - PlayerSize.y

        if rl.IsKeyPressed(.SPACE) {
            p.vel.y = -600
        }
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
}*/