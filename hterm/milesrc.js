/**
 * STEP 1: Setup
 * - Open Chrome Secure Shell settings
 * - Open JS Console (CTRL+SHIFT+J)
 * - Copy and paste the following:
 */
var theme = {
  "black": "#323232",
  "red": "#ff50aa",
  "green": "#50aa00",
  "yellow": "#ccaa50",
  "blue": "#507fff",
  "magenta": "#aa7fff",
  "cyan": "#50cccc",
  "white": "#cccccc",
  "light_black": "#505050",
  "light_red": "#ff7fff",
  "light_green": "#50cc50",
  "light_yellow": "#cccc50",
  "light_blue": "#50aaff",
  "light_magenta": "#aaaaff",
  "light_cyan": "#50eecc",
  "light_white": "#eeeeee",
  "cursor": "#eeeeee"
};

// Disable bold
term_.prefs_.set("enable-bold", false);
term_.prefs_.set("enable-bold-as-bright", false);

// Set TERM
term_.prefs_.set("environment", {"TERM": "xterm-256color"});

// Get some cool monospaced fonts
// term_.prefs_.set(
//     "user-css",
//     "http://fonts.googleapis.com/css?family=Ubuntu+Mono|Droid+Sans+Mono|Source+Code+Pro|Anonymous+Pro"
// );

/**
 * STEP 2:
 * - Copy / paste ONE of the blocks below to setup Light or Dark
 */

// Solarized Dark
term_.prefs_.set("background-color", theme.black);
term_.prefs_.set("foreground-color", theme.blue);
term_.prefs_.set("cursor-color", theme.cursor);
term_.prefs_.set(
    "color-palette-overrides",
    [
        theme.black,
        theme.red,
        theme.green,
        theme.yellow,
        theme.blue,
        theme.magenta,
        theme.cyan,
        theme.white,
        theme.light_black,
        theme.light_red,
        theme.light_green,
        theme.light_yellow,
        theme.light_blue,
        theme.light_magenta,
        theme.light_cyan,
        theme.light_white
    ]
);

/**
 * STEP 3:
 * - Copy / paste ONE of the blocks below to choose a font
 */

// Automagically loaded from Google Fonts
term_.prefs_.set("font-family", "monospace, monospace");
