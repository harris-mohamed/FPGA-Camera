# README

As we faced immense difficulty interfacing the 1.3 MP camera with the Altera Cyclone IV E, we decided to include our files to use a reference for future groups. When correctly set up, this takes the video feed from the camera and outputs it via VGA. The color of the picture is also configurable. The exposure can be modified through the switches on the DE2-115 expansion board, and the gain settings (there are 4: Red gain, Blue gain, Green 1 gain, and Green 2 gain. We don't know the real difference between Green 1 and Green 2, either). 

If you try to run this code without any modifications you will output pitch black to the VGA. You have to set the gain settings (they are logic variables in the top level) and then hit KEY1 for the changes to take effect (this is also true for exposure). An easy way to change the gain settings quickly is by using the NIOS II's USB console. Here are sample values that should output a decent video. 

* BLUE: 0xF1CF
* RED: 0xF1C2
* GREEN 1: 0xF1B0
* GREEN 2: 0xF1B0

Have fun!
