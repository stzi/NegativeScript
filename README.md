# NegativeScript
Convert negatives to positives with parallel processing

This script helps converting photographs of analog negatives into positives.

**Please note, the script is quickly hacked together and is shared here 'as is'!**

Feel free to clone, modify. Contributions, suggestions and improvements are welcome. 

## What you need

You need a way to execute a bash-script. And you need to have `ImageMagick` and `ufraw` installed. On macOS you can install it with homebrew. 

`#brew install imagemagick`
 
`#brew install ufraw`
  
At the moment, the script assumes you have a directory full of RAW files from a Canon DSLR (*.CR2). 
  
## Known to be working

The script runs fine on my old 2013 MacBook Pro under Mojave with ImageMagick 7.0.8-59 installed from homebrew.

## Missing

* Not tested under Linux
* Not tested under Windows
* No real error handling is done
* No support for color negatives. If you use this script to convert color negatives, you will get bad results!
* No support for input files that are not of type *.CR2

## Input

You need a directory full of RAW files from your DSLR. 

## Output

Inside of your input directory, the script generates a new directory called TIFF. It generates one *.tif file (with the same name) file per input file and puts it into that subdirectory.

## Usage

`./negativescript.sh ~/Desktop/negative 3`

The script awaits two parameters:
* first you specify the path to your negatives
* second you specify how many processes are run in parallel

