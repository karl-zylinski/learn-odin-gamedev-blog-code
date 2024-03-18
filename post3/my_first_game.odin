package game

import rl "vendor:raylib"

step :: 6

when step == 0 {
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
} else when step == 1 {
main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")
    player_pos := rl.Vector2 { 640, 320 }
    player_vel: rl.Vector2
    player_grounded: bool
    //
    player_run_texture := rl.LoadTexture("cat_run.png")
    
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        //
        rl.ClearBackground({110, 184, 168, 255})

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
        //
        rl.DrawTextureV(player_run_texture, player_pos, rl.WHITE)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}
} else when step == 2 {
main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")
    player_pos := rl.Vector2 { 640, 320 }
    player_vel: rl.Vector2
    player_grounded: bool
    player_run_texture := rl.LoadTexture("cat_run.png")
    
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground({110, 184, 168, 255})

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
        //
        rl.DrawTextureEx(player_run_texture, player_pos, 0, 4, rl.WHITE)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}
} else when step == 3 {
main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")
    player_pos := rl.Vector2 { 640, 320 }
    player_vel: rl.Vector2
    player_grounded: bool
    player_run_texture := rl.LoadTexture("cat_run.png")
    //
    player_run_num_frames := 4
    
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground({110, 184, 168, 255})

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

        player_run_width := f32(player_run_texture.width)
        player_run_height := f32(player_run_texture.height)

        // >
        draw_player_source := rl.Rectangle {
            x = 0,
            y = 0,
            width = player_run_width / f32(player_run_num_frames),
            height = player_run_height,
        }

        rl.DrawTextureRec(player_run_texture, draw_player_source, player_pos, rl.WHITE)
        // <
        rl.EndDrawing()
    }

    rl.CloseWindow()
}
} else when step == 4 {
main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")
    player_pos := rl.Vector2 { 640, 320 }
    player_vel: rl.Vector2
    player_grounded: bool
    player_run_texture := rl.LoadTexture("cat_run.png")
    player_run_num_frames := 4
    
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground({110, 184, 168, 255})

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

        player_run_width := f32(player_run_texture.width)
        player_run_height := f32(player_run_texture.height)

        draw_player_source := rl.Rectangle {
            x = 0,
            y = 0,
            width = player_run_width / f32(player_run_num_frames),
            height = player_run_height,
        }

        // >
        draw_player_dest := rl.Rectangle {
            x = player_pos.x,
            y = player_pos.y,
            width = player_run_width * 4 / f32(player_run_num_frames),
            height = player_run_height * 4
        }

        rl.DrawTexturePro(player_run_texture, draw_player_source, draw_player_dest, 0, 0, rl.WHITE)
        // <
        rl.EndDrawing()
    }

    rl.CloseWindow()
}
} else when step == 5 {
main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")
    player_pos := rl.Vector2 { 640, 320 }
    player_vel: rl.Vector2
    player_grounded: bool
    player_run_texture := rl.LoadTexture("cat_run.png")
    player_run_num_frames := 4
    //
    player_run_frame_timer: f32
    //
    player_run_current_frame: int
    //
    player_run_frame_length := f32(0.1)
    
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground({110, 184, 168, 255})

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

        player_run_width := f32(player_run_texture.width)
        player_run_height := f32(player_run_texture.height)

        // >>
        player_run_frame_timer += rl.GetFrameTime()

        if player_run_frame_timer > player_run_frame_length {
            player_run_current_frame += 1
            player_run_frame_timer = 0

            if player_run_current_frame == player_run_num_frames {
                player_run_current_frame = 0
            }
        }
        // <<

        draw_player_source := rl.Rectangle {
            //
            x = f32(player_run_current_frame) * player_run_width / f32(player_run_num_frames),
            y = 0,
            width = player_run_width / f32(player_run_num_frames),
            height = player_run_height,
        }

        draw_player_dest := rl.Rectangle {
            x = player_pos.x,
            y = player_pos.y,
            width = player_run_width * 4 / f32(player_run_num_frames),
            height = player_run_height * 4
        }

        rl.DrawTexturePro(player_run_texture, draw_player_source, draw_player_dest, 0, 0, rl.WHITE)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}
} else when step == 6 {
main :: proc() {
    rl.InitWindow(1280, 720, "My First Game")
    player_pos := rl.Vector2 { 640, 320 }
    player_vel: rl.Vector2
    player_grounded: bool
    //
    player_flip: bool
    player_run_texture := rl.LoadTexture("cat_run.png")
    player_run_num_frames := 4
    player_run_frame_timer: f32
    player_run_current_frame: int
    player_run_frame_length := f32(0.1)

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground({110, 184, 168, 255})

        if rl.IsKeyDown(.LEFT) {
            player_vel.x = -400
            //
            player_flip = true
        } else if rl.IsKeyDown(.RIGHT) {
            player_vel.x = 400
            //
            player_flip = false
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

        player_run_width := f32(player_run_texture.width)
        player_run_height := f32(player_run_texture.height)

        player_run_frame_timer += rl.GetFrameTime()

        if player_run_frame_timer > player_run_frame_length {
            player_run_current_frame += 1
            player_run_frame_timer = 0

            if player_run_current_frame == player_run_num_frames {
                player_run_current_frame = 0
            }
        }

        draw_player_source := rl.Rectangle {
            x = f32(player_run_current_frame) * player_run_width / f32(player_run_num_frames),
            y = 0,
            width = player_run_width / f32(player_run_num_frames),
            height = player_run_height,
        }

        // >
        if player_flip {
            draw_player_source.width = -draw_player_source.width
        }
        // <

        draw_player_dest := rl.Rectangle {
            x = player_pos.x,
            y = player_pos.y,
            width = player_run_width * 4 / f32(player_run_num_frames),
            height = player_run_height * 4
        }

        rl.DrawTexturePro(player_run_texture, draw_player_source, draw_player_dest, 0, 0, rl.WHITE)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}
}