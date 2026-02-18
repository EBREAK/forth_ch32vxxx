define launch
shell mingw32-make
target remote 127.0.0.1:3333
file forth.elf
monitor reset init
load forth.elf
monitor reset init
c
end

define reset
monitor reset init
c
end
