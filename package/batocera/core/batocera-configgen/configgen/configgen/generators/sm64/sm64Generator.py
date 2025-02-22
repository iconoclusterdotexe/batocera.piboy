#!/usr/bin/env python

import Command
import os
import shutil
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

eu_dir = '/userdata/saves/sm64/eu'
jp_dir = '/userdata/saves/sm64/jp'
us_dir = '/userdata/saves/sm64/us'

class Sm64Generator(Generator):

    if not os.path.exists(eu_dir):
        os.mkdir(eu_dir)

    if not os.path.exists(jp_dir):
        os.mkdir(jp_dir)

    if not os.path.exists(us_dir):
        os.mkdir(us_dir)

    def generate(self, system, rom, playersControllers, guns, wheels, gameResolution):
        if (rom.lower()).endswith('e64'):
            os.chdir(rom)
            commandArray = ["sm64.eu", "--gamedir", "./", '--savepath', eu_dir]
        elif (rom.lower()).endswith('j64'):
            os.chdir(rom)
            commandArray = ["sm64.jp", "--gamedir", "./", '--savepath', jp_dir]
        elif (rom.lower()).endswith('u64'):
            os.chdir(rom)
            commandArray = ["sm64.us", "--gamedir", "./", '--savepath', us_dir]

        # Skip Intro
        if system.isOptSet('nointro') and system.getOptBoolean('nointro'):
            commandArray.extend(['--skip-intro'])

        # Cheat Menu
        if system.isOptSet('cheatsmenu') and system.getOptBoolean('cheatsmenu'):
            commandArray.extend(['--cheats'])

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
