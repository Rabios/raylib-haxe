/*******************************************************************************************
*
*   raylib [core] example - Windows drop files
*
*   This example only works on platforms that support drag & drop (Windows, Linux, OSX, Html5?)
*
*   This example has been created using raylib 1.3 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2015 Ramon Santamaria (@raysan5)
*
********************************************************************************************/

package examples.core;

import raylib.Raylib;
import raylib.Raylib.*;

class CoreDropFiles
{
	static function main()
	{
		// Initialization
		//--------------------------------------------------------------------------------------
		var screenWidth = 800;
		var screenHeight = 450;

		InitWindow(screenWidth, screenHeight, "raylib [core] example - drop files");

		var droppedFiles = [];

		SetTargetFPS(60);
		//--------------------------------------------------------------------------------------

		// Main game loop
		while (!WindowShouldClose())    // Detect window close button or ESC key
		{
			// Update
			//----------------------------------------------------------------------------------
			if (IsFileDropped())
			{
				droppedFiles = GetDroppedFiles();
			}
			//----------------------------------------------------------------------------------

			// Draw
			//----------------------------------------------------------------------------------
			BeginDrawing();

				ClearBackground(RAYWHITE);

				if (droppedFiles.length == 0) DrawText("Drop your files to this window!", 100, 40, 20, DARKGRAY);
				else
				{
					DrawText("Dropped files:", 100, 40, 20, DARKGRAY);

					for (i in 0...droppedFiles.length)
					{
						if (i%2 == 0) DrawRectangle(0, 85 + 40*i, screenWidth, 40, Fade(LIGHTGRAY, 0.5));
						else DrawRectangle(0, 85 + 40*i, screenWidth, 40, Fade(LIGHTGRAY, 0.3));

						DrawText(droppedFiles[i], 120, 100 + 40*i, 10, GRAY);
					}

					DrawText("Drop new files...", 100, 110 + 40*droppedFiles.length, 20, DARKGRAY);
				}

			EndDrawing();
			//----------------------------------------------------------------------------------
		}

		// De-Initialization
		//--------------------------------------------------------------------------------------
		ClearDroppedFiles();    // Clear internal buffers

		CloseWindow();          // Close window and OpenGL context
		//--------------------------------------------------------------------------------------
	}
}
