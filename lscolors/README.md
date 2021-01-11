This config is based on [trapd00r/LS_COLORS](https://github.com/trapd00r/LS_COLORS).

# How to configure LS_COLORS easily(somewhat)

### 1. Open LS_COLORS
### 2. Modify/add new colors:
  - To add an RGB **FOREGROUND** color, use the escape code `38;2;` and then add the RGB values:
    ```sh
    .ts 38;2;1;255;255 # this means set the foreground color for all ts files to R1 G255 B255
    ```
  - To add an RGB **BACKGROUND** color, use the escape code `48;2;` and then add the RGB values:
    ```sh
    .ts 48;2;255;255;0 # this means set the background color for all ts files to R255 G255 B0
    ```
  - To make the text bold, use `1` outside of any escape sequence(e.g. outside of `38;2;r;g;b`):
    ```sh
    .ts 1 # this means make all ts files bold
    .js 38;2;0;255;0;1 # this means make all js files bold and set their color to R0 G255 B0
    ```
  - To make the text italic, use `3` outside of any escape sequence(e.g. outside of `38;2;r;g;b`):
    ```sh
    .ts 3 # this means make all ts files italic
    .js 38;2;0;255;0;3 # this means make all js files italic and set their color to R0 G255 B0
    ```
  - To make the text underline, use `4` outside of any escape sequence(e.g. outside of `38;2;r;g;b`):
    ```sh
    .ts 4 # this means make all ts files underline
    .js 38;2;0;255;0;4 # this means make all js files underline and set their color to R0 G255 B0
    ```
    > Order of parameters does not matter as long as escape sequences are respected.  
    > [More info on escape codes](https://en.wikipedia.org/wiki/ANSI_escape_code)
### 3. Save and exit
### 4. Update `lscolors.sh`:
  ```sh
  dircolors -b LS_COLORS > lscolors.sh
  ```
