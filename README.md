# Script for video compression automation using Handbrake CLI

This is a bash script I wrote to automate the compression process. I would usually render a video using [Davinci Resolve](https://www.blackmagicdesign.com/in/products/davinciresolve) and then have to manually put the video through Handbrake to compress the video into a smaller file size.

## How to use it

First, download the git repo by
``` sh
git clone https://github.com/Roshan-Thomas/handbrake-cli-script.git
```

And then run the script by
```sh
./cron-job.sh '<PARENT FOLDER>' <NUMBER OF SECONDS TO WAIT>
```

The *first argument* takes in the parent folder where the video file to be compressed exists. And, the *second argument* takes in the number of seconds to wait before running Handbrake CLI (default is 0 seconds). 

*Note: The waiting period was done so that the video can be completely rendered by Resolve and then be compressed*

**Here i am using a specific folder structure for my video editing process. You can choose to use the same structure or change the script accordingly**

```
project
└───01 Footage
│   │   footage.mov
│   
└───02 Titles
    │   title.png
|
└───03 Exports
│   │   Export 1.mov 
```

If you decide to change the file structure, then change `line 16` in the script to 
```sh
cd "$CURRENT_DIR/$1/<EXPORTS FOLDER NAME>/"
```

### Handbrake Preset

I have also included the `HandBrake` preset I use for compressing my videos in the git repo as well. 

If you want to change the preset to someother `.json` file then change `line 20` to
```sh
HandBrakeCLI --preset-import-file "$CURRENT_DIR/<YOUR CUSTOM PRESET>" -i 'Export 1.mov' -o 'Export 1 (Compressed).m4v' -a 1
```

# Contributions

This is a very rudimentary script I wrote so that it can speed up my editing process. If you would like to contribute to it, then fork the repo and make the neccessary changes and then create a pull request.

Thanks and Happy Editing 😊