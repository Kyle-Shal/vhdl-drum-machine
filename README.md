# DrumMachine
A Drum Machine that utilizes the DE1-SoC's audio CODEC written in VHDL

## Application Overview
A drum machine is a device used by music producers and DJs to create drum beats and other
musical patterns. Drum machines typically consist primarily of a grid of square buttons.
Using software, each button can be loaded with an audio sample which it will play upon
being pressed.
While drum noises (such as kicks, snares, hi-hats, etc.) are often loaded to these buttons
(hence the name drum machine), other samples such as synthesized or recorded music notes
can also be used. This makes the drum machine an exceptionally useful tool, allowing artists
of any music genre to come up with new ideas for songs by simply pressing different
combinations of buttons until they hear a pattern they like.

## Project Scope
Our drum machine primarily utilizes the 4 buttons included on the DE1-SoC board for the
user interface. Each button plays a different drum sample when pressed. SW9 is used to
toggle between the two modes our drum machine has: “Drums” mode, where pressing the
buttons plays the drum samples, and “Volume” mode, where pressing the buttons changes the
volume level. For the output device, an external speaker will be plugged into the output audio
port connected to the audio CODEC.

Created By:
- Ahmed Hassan
- Kamrin Murphy
- Kyle Shal

Demo Video:

https://www.youtube.com/watch?v=ih_G2Vd_vkE
