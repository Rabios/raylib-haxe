/*******************************************************************************************
*
*   raylib [core] example - Multitouch input
*
*   This example has been created using raylib 2.1 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2014 Ramon Santamaria (@raysan5)
*   Example by Berni
*
********************************************************************************************/

package examples.core;

import raylib.Raylib;
import raylib.Raylib.*;

class CoreMultiTouch
{
	static function main()
	{
		// Initialization
		//--------------------------------------------------------------------------------------
		var screenWidth = 800;
		var screenHeight = 450;

		InitWindow(screenWidth, screenHeight, "raylib [core] example - multitouch input");

		var ballPosition = new Vector2(-100.0, -100.0);
		var ballColor;
		var PressedCounter = 0;
		var TouchPos;

		SetTargetFPS(60);
		//---------------------------------------------------------------------------------------

		// Main game loop
		while (!WindowShouldClose())    // Detect window close button or ESC key
		{
			// Update
			//----------------------------------------------------------------------------------
			ballPosition = GetMousePosition();

			ballColor = BEIGE;

			if (IsMouseButtonDown(MOUSE_LEFT_BUTTON)) ballColor = MAROON;
			if (IsMouseButtonDown(MOUSE_MIDDLE_BUTTON)) ballColor = LIME;
			if (IsMouseButtonDown(MOUSE_RIGHT_BUTTON)) ballColor = DARKBLUE;

			if (IsMouseButtonPressed(MOUSE_LEFT_BUTTON)) PressedCounter = 10;
			if (IsMouseButtonPressed(MOUSE_MIDDLE_BUTTON)) PressedCounter = 10;
			if (IsMouseButtonPressed(MOUSE_RIGHT_BUTTON)) PressedCounter = 10;
			if(PressedCounter > 0)
				PressedCounter--;
			//----------------------------------------------------------------------------------

			// Draw
			//----------------------------------------------------------------------------------
			BeginDrawing();

				ClearBackground(RAYWHITE);

				// Multitouch
				for (i in 0...MAX_TOUCH_POINTS)
				{
					TouchPos = GetTouchPosition(i);                                     // Get the touch point

					if( (TouchPos.x >= 0) && (TouchPos.y >= 0)  )                       // Make sure point is not (-1,-1) as this means there is no touch for it
					{
						DrawCircleV(TouchPos, 34, ORANGE);                              // Draw a circle there

						DrawText('$i', Std.int(TouchPos.x - 10), Std.int(TouchPos.y - 70), 40, BLACK);     // Also show its index number
					}
				}

				// Draw the normal mouse location
				DrawCircleV(ballPosition, 30 + (PressedCounter * 3), ballColor);

				DrawText("move ball with mouse and click mouse button to change color", 10, 10, 20, DARKGRAY);
				DrawText("touch the screen at multiple locations to get multiple balls", 10, 30, 20, DARKGRAY);

			EndDrawing();
			//----------------------------------------------------------------------------------
		}

		// De-Initialization
		//--------------------------------------------------------------------------------------
		CloseWindow();        // Close window and OpenGL context
		//--------------------------------------------------------------------------------------
	}
}
