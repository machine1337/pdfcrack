import os
import platform
import time
print("[*] Checking Requirements Module....")
def header():
    ascii_banner = pyfiglet.figlet_format("{PDF CRACKER}").upper()
    print(colored(ascii_banner.rstrip("\n"), 'cyan', attrs=['bold']))
    print(colored("                                <Coded By: Clay>     \n", 'yellow', attrs=['bold']))
    print(colored("                                <Version: 2.0>     \n", 'magenta', attrs=['bold']))
    return
if platform.system().startswith("Windows"):
    try:
        import pikepdf
    except ImportError:
        os.system("python -m pip install pikepdf -q -q -q")
        import pikepdf
    try:
        from tqdm import tqdm
    except ImportError:
        os.system("python -m pip install tqdm -q -q -q")
        from tqdm import tqdm
    try:
        import termcolor
    except ImportError:
        os.system("python -m pip install termcolor -q -q -q")
        import termcolor
    from termcolor import colored
    try:
        import pyfiglet
    except ImportError:
        os.system("python -m pip install pyfiglet -q -q -q")
        import pyfiglet
elif platform.system().startswith("Linux"):
    try:
        import pikepdf
    except ImportError:
        os.system("python3 -m pip install pikepdf -q -q -q")
        import pikepdf
    try:
        from tqdm import tqdm
    except ImportError:
        os.system("python3 -m pip install tqdm -q -q -q")
        from tqdm import tqdm
    try:
        import termcolor
    except ImportError:
        os.system("python3 -m pip install termcolor -q -q -q")
        import termcolor
    from termcolor import colored
    try:
        import pyfiglet
    except ImportError:
        os.system("python3 -m pip install pyfiglet -q -q -q")
        import pyfiglet



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
