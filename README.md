# Mandelbrot-Multithread
A highly efficient, multithread mandelbrot set visualizer written in C.

## Compilation
`gcc mandel-multithread.c -o mandel-multithread -lpthread`

## Execution
`./mandel-multithread <width> <height> <threads> <number of simultaneous threads> > filename.bmp`

## Results
The application outputs its image data to `stdout`, which is in bitmap format. Piping in a file like above makes it possible to save the results as a file. Depending on the width and height of your desired image, file size can get really large (multiple GB), because bmp is uncompressed.

### Compression
You can use ImageMagick to compress your results like so:
`convert out.bmp out.png`
Easy, isn't it?

#### Optimisation
You can check the limits of ImageMagick by typing
`identify -list resource`
Make sure that the memory limit is at least 1GB below your RAM size, otherwise your system will freeze and the process will be killed. Make sure to have the other limits big enough. Make sure to have the disk cache set to some writable location. Setting these values works as follows:
```
MAGICK_TEMPORARY_PATH=/home/lukas/
MAGICK_MEMORY_LIMIT=25GiB
...
```
Refer to [Command line options @ ImageMagick #limits](https://imagemagick.org/script/command-line-options.php#limit) for further reference.

**IMPORTANT:** unlike documented, ImageMagick's environment variable for setting the temporary file path is not MAGICK_TMPFILE, but MAGICK_TEMPORARY_PATH.

Check `convert-bmp-png.sh` in this repository.

## Limits
Since the BMP file type only specifies 4 byte of information for the file size in it's header, the maximum file size of a BMP is 4 GiB. Many applications, including Ocular and GIMP, stop reading BMPs way below that limit. ImageMagick supports BMPs up to 4 GiB. The maximum possible resolution at 1:1 ratio is
```
sqrt(4294967295 Bytes / 3 Bytes per Pixel) = 37837,2272372 Pixels width / height
```
I generated an image at 43500x3200px, since the mandelbrot set visualization is a bit wider than high, and this comes fairly close to the 4 GiB limit (`4176000000 bytes`).
