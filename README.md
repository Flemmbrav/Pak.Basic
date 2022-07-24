# Pak.Basic
Pakset for Simutrans

## The idea
Pak.Basic's purpose is to have a pakset, that is streamlined for people discovering Simutrans.
Everything should be dumped down as much as possible to create an enviroment enabling new users to learn the basic game dynamics first, bevore starting to learn the more complicated game dynamics the other paksets bring.
Thus, there will only be so few ways, buildings, factories etc. Vehicles all will have the very same length. High use of player colour. Simple named objects.

## What's missing so far?
- Defining Buildings
- Working github action
- Adjusting content from Pak192.Comic to fit this pakset
- Pedestrians don't have a place to be
- Translations
- Scenario
- Loading screen image
- Proper documentation (this one is important! why is it at the very bottom of this list?)
- And far more…

## How can I contribute?
Just do it!
Either just start a pull request here on Github, or write me on the forums.

## Run the pakset

0. Install Simutrans
	1. Since this is a nightly pakset, it may not run with the Simutrans version you have already installed. Please go to https://www.simutrans-forum.de/nightly/ for the most recent Simutrans Nightlies.
	Note: Nightlies do not replace stable versions, especially if you intend to play a long game!
1. Get yourself the pakset from [the release page.](https://github.com/Flemmbrav/Pak192.Comic/releases)
	1. Additionally you can download an addonset from the same page. This addon set does not include all addons there are.
	2. Or download yourself an old version from [the forum.](https://forum.simutrans.com/index.php?board=120.0)
2. Unzip the pakset.
3. Copy the unzipped pakset in your Simutrans game folder.
	1. If you did download the addon set as well, put them in your addon folder in your user directionary. On Windows this folder appears at C:\Users\[User]\Documents\Simutrans\addons
	2. Remane the new folder in the addon directionary to the same name that you use for the folder in the game file directionary.
4. Start Simutrans the way you did before, and you'll see a menu asking you for a pakset to run. Select the new added folder to run this pakset.
	1. If you did install the addons as well, there should be a button to start the game with them as well.
5. Happy playing.

## Manual compile

1. Clone this repository using `git clone https://github.com/Flemmbrav/Pak.Basic.git`
2. Switch to Pak.Basic directory
3. Get yourself a new makeobj and put it in this folder.
3. Start compile with preconfigured compiler :
	1. To compile under windows, run the **`COMPILE.ps1`** via PowerShell.
	2. To compile under unix, run the **`COMPILE.sh`**.
4.Copy the folder named **compiled** in your usual Simutrans game folder and rename it to **Pak.Basic**.
5. Start Simutrans the way you did before, and you'll see a menu asking you for a pakset to run. Select **Pak.Basic** to run this pakset.
6. Happy playing.

## Bug reports

Feel free to create a issue to this repository when you encountered any technical errors.

## License

The content provided in this Git is published under CC-BY-SA 3.0, which is available in the `LICENSE.md`. If you want to credit the Git as a whole, or in case you can not identify the author, and only then, you may credit "pak.basic and pak192.comic teams" as author.
