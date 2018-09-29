# pistol_Basic
Pi SDL (PiSDoL = pistol) Basic with GPIO (incl. IchigoJam Pi), forked from SDL_Basic before SDL2 transition

# GPIO Basic
Not specifically for Raspbery Pi, except that Pistol Basic also impliments the GPIO pins from [IchigoJam Basic for Rpi](https://ichigojam.github.io/RPi/), but rather any SBC or computer that has GPIO pins that at least support the standard RPi GPIO layout or WiringPi layout, which should include most well supported SBC's, none just RPi and 100% clones.

# SDL 1.2
I have some older platforms which do support SDL 1.2, but just dont have enough RAM to even consider static builds with SDL2. We are talking the diference between 250Kb for static builds of full SDL 1.2 with all lib extensions, compared to minimum of 2Mb just for SDL2 main lib. So SDL 1.2 static builds will work comforatbly on 1Mb platforms (like Atari ST 1040 and Amiga 1200), and with some _judicious coding_, will also work on 512Kb platforms. 

# On Raspberry Pi you can built pistol_Basic (and SDL_Basic) using the baremetal repo found [here](https://github.com/maccasoft/raspberry-pi).

# WYABI
Why _Yet Another BASIC Implimentation_ when there are already alot available. Well I prefer to use an 68000 STe or 68040 ARAnyM system, and they (now both) support various BASIC's, STOS is the ST version of AMOS, and there is GFA-BASIC. They both do grapics, sounds, music and system GUI intergration right out of the box. They also BOTH support an Interpreter, and a Compiler.

There is not one single basic available for Linux (specifically Raspberry Pi) that does all the above in one single package. SDL makes adding such support easier, it works on a console at fullscreen, and also windowed under X or MS Windows, and on most systems SDL is one of the first graphics and sound libraries to be ported, especially on new systems.

I now have an ARM based GEM/TOS ROM system, which of coarse wont run 680x0 software, so I need a way to get preliminary apps up and running as fast as possible, enter _Pi SDL Basic_, which was renamed to _Pistol_ just to simplify things.

# BASIC
For BASIC language usage, read the original [README](README.SDL_Basic) from [SDL_Basic](https://github.com/dashxdr/SDL_basic). I intend add a minimum level of MSX-BASIC compatability by implimenting as much of [IchigoJam Basic](https://github.com/paulwratt/IchigoJam-BASIC) as possible, in particular their GPIO for RPi.

That will cover most STOS and AMOS basic commands and function, as well as GFA-BASIC. Between all of those what should als be alot of GW-BASIC as well. The next step for the language is to allow QuickBasic and VisualBasic (or at least vbScript) style programming (without compulsary line numbers), and a comipler. Fortunately this is already available with [sdlBasic](http://sdlbasic.sourceforge.net) (not SDL_Basic). There will be some work needed to _mesh_ the two Basic's into one langauge.

By supporting MSX-BASIC (through IchogoJam Basic) we can also support [cbmbasic](https://github.com/mist64/cbmbasic) as used on the Commodore C64, and therefore alot of other 6502 and 6800/6809 BASIC programming styles as well.

At the moment I am not sure how this is all going to integrate, at least into a single interpreter, but the idea is to have graphics, fonts, sound and music available up front, in the Interpreter, which is why SDL_Basic was chosen as the base, because it almost has all this already.

# Future

> Oh, not again. There is already plenty of modern languages avaliable. Why on earth would you want to program in such an archaic language as BASIC?

Some of you may be thinking something similar to the above. BASIC is called that for a reason, its _BASIC_, its easy to learn, read and figure out, and most of all, for advanced programming it does not require to learn another language or framework (like JavaScript with DOM and Canvas) in order to _do cool stuff_. Even psuedo code is written is basic english, even though it adds {} structure and often ; end of commands, it is still basic for a reason.

For this reason it also makes buying and learning, or using old, obsolite and otherwise outdated retro computers and platforms, of practical real world use. Which has a similar effect to reading paper books: it is healthy for society, and it makes it easier to remember _our_ roots, and thus not fall into the same pattern of mistakes in the future.

That said, the idea is to make certain modern machines boot directly into a usable system in the same way home computers did in the 1970's and 1980's, without the clutter of a modern OS. And that means much less assistance, controls and security are required, all of which promotes creativity and independance.

