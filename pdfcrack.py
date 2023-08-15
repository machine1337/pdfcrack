# Copyright 2023
#
# Authors:
#  * https://github.com/machine1337/
#  * https://github.com/jowagner/
#
# License: GPLv3, see LICENSE file

import importlib
import os
import platform
import subprocess
import sys
import time

auto_install = len(sys.argv) == 1 or '--auto-install-packages' in sys.argv

print("[*] Checking Requirements Module....")

def header():
    ascii_banner = pyfiglet.figlet_format("{PDF CRACKER}").upper()
    print(colored(ascii_banner.rstrip("\n"), 'cyan', attrs=['bold']))
    print(colored("                                <Coded By: Clay>     \n", 'yellow', attrs=['bold']))
    print(colored("                                <Version: 2.0>     \n", 'magenta', attrs=['bold']))
    return

if auto_install:
    # need to know how to call python to run pip
    python_exec = sys.executable
    if not python_exec:
        # Python doesn't know the path --> use platform to guess
        if platform.system().startswith("Windows"):
            python_exec = 'python'
        elif platform.system().startswith("Linux"):
            python_exec = 'python3'
        else:
            raise NotImplementedError('unsupported platform')

def my_import(module_name, auto_install = False):
    global python_exec
    if not auto_install:
        module = importlib.import_module(module_name)
    else:
        try:
            module = importlib.import_module(module_name)
        except ImportError:
            subprocess.run([
                python_exec, '-m', 'pip', 'install',
                module_name, '-q', '-q', '-q',
            ])
            module = importlib.import_module(module_name)
    # https://stackoverflow.com/questions/6347588/is-it-possible-to-import-to-the-global-scope-from-inside-a-function-python
    globals()[module_name] = module

for module_name in 'pikepdf tqdm termcolor pyfiglet'.split():
    my_import(module_name, auto_install)

from tqdm import tqdm
from termcolor import colored

def crack():
    os.system('cls' if os.name == 'nt' else 'clear')
    header()
    pdf_filename = input(termcolor.colored("[*] Enter Path Of Your PDF file:- ", 'cyan'))
    if not os.path.exists(pdf_filename):
        print(termcolor.colored("\n[ X ] File " + pdf_filename + " was not found, Provide Valid FileName And Path!",
                                'red'))
        exit()
    print(termcolor.colored("\n[*] Analyzing PDF File:- ", 'blue'), pdf_filename)
    time.sleep(1)
    if pdf_filename[-3:] == "pdf":
        print(termcolor.colored("\n[ ✔ ] Valid PDF File Found...", 'green'))
    else:
        print(termcolor.colored("\n[ X ] This is not a valid .pdf file...\n", 'red'))
        exit()
    pwd_filename = input(termcolor.colored("\nEnter Path Of Your Wordlist:- ", 'yellow'))
    if not os.path.exists(pwd_filename):
        print(termcolor.colored("\n[ X ] File " + pwd_filename + " was not found, Provide Valid FileName And Path!",
                                'red'))
        exit()
    hello = [line.strip() for line in open(pwd_filename)]
    for cra in tqdm(hello, f"Cracking PDF File->{pdf_filename}:-"):
        try:
            with pikepdf.open(pdf_filename, password=cra) as pdf:
                print(colored("\n[ ✔ ] PDF FILE Password Found:- ", 'cyan'), cra)
                break
        except pikepdf._qpdf.PasswordError as e:
            print()
            continue
crack()
