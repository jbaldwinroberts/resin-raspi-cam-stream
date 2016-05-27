# resin-raspi-cam-stream
Sets up a raspi-cam stream

## Acknowledgments
This repository makes use of the excellent RPi Cam Web Interface. Check out the [documentation](http://elinux.org/RPi-Cam-Web-Interface) and [Github repository](https://github.com/silvanmelchior/RPi_Cam_Web_Interface).

## Instructions
### Step 1
Sign up with [resin.io](http://resin.io). Create a Raspberry Pi app, download the image and make sure your device is online on the resin dashboard. You can find more detailed instructions [here](http://docs.resin.io/raspberrypi/nodejs/getting-started/). Ensure the camera module is properly fitted.

### Step 2
Add [environment variables](http://docs.resin.io/management/env-vars/) to your resin app to enable the Raspberry Pi camera module. There are three environment variables that need to be set, you can read more about them [here](http://docs.resin.io/hardware/i2c-and-spi/#raspberry-pi-camera-module). To set the variables you need to:

* Select you resin app in the resin [dashboard](https://dashboard.resin.io)
* Select `Fleet Configuration`
* Add three config variables:
 * `RESIN_HOST_CONFIG_fixup_file = fixup_x.dat`
 * `RESIN_HOST_CONFIG_gpu_mem = 128`
 * `RESIN_HOST_CONFIG_start_file = start_x.elf`
* Check your `Fleet Configuration` screen matches mine

![alt text](/Docs/env_vars.png)

### Step 3
Enable a [public URL](http://docs.resin.io/management/devices/#enable-public-device-url) on each device in your resin app so that it can be accessed from anywhere in the world.

### Step 4
Clone this repo by running the command `git clone https://github.com/josephroberts/resin-raspi-cam-stream.git`.

### Step 5
Once the repo is cloned, change directory into the newly created `resin-raspi-cam-stream` directory and add the `resin git remote endpoint` by running the command `git remote add` shown in the top-right corner of your application page, here's an example:
```
cd resin-raspi-cam-stream
git remote add resin charlie1@git.resin.io:charlie1/myfleet.git
```

### Step 6
Deploy the code to your resin app by running the command `git push resin master`.

### Step 7
Navigate to the public URL and enjoy watching your live camera stream!

![alt text](/Docs/camera.png)

## Notes
I have modified `index.php` so that it only shows the webcam stream. To show the full RPi Cam Web Interface you will need to rename `index_back.php` found in `resin-raspi-cam-stream/RPi_Cam_Web_Interface/www` to `index.php`.

Sometimes the camera does not start properly when new code is pushed - a simple reboot fixes this.