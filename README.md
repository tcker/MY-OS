# VERSION TODAY OF THIS OS

10 - 27 - 2024
- This OS can boot up properly and it does nothing, exactly what we expected

10 - 29 - 2024
- This os can boot up and display/print a string "Hello, World! le User"

# My very first OS

- my Tutorial: https://www.youtube.com/watch?v=9t-SPC7Tczc
- now/current Tutorial: https://www.youtube.com/watch?v=srbnMNk7K7k&list=PLFjM7v6KGMpiH2G-kT781ByCNC_0pKpPN

--

### Steps to do to try run it

**Pre-requisites**
- QEMU - Must be installed on system
( I tried virtual box but no text or display has been outputted)

### Instructions

- First: cd to Root Directory then type in terminal "make" to create the .img file
- Second: (USING QEMU) cd to /build directory then put this in your terminal
[ Your MYSYS2 must be in the path variable of your computer for easy access in windows terminal ]

```

qemu-system-x86_64 -drive file=main_floppy.img,format=raw

```

- Third: Press enter then voila, your first running Operating System Booted in the disk
