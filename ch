#!/usr/local/bin/python
from sys import argv

ALL_OPTIONS = ("ft", "co", "cz", "nv")

if __name__ == "__main__":
    if len(argv) == 3:
        choice = argv[1]
        item = argv[2]
        if choice not in ALL_OPTIONS:
            print("Invalid choice of", choice, f"{ALL_OPTIONS} only!")
    else:
        print(f"Wrong number of arguments. Expected 1 following one of {ALL_OPTIONS}.")
        exit(1)
    with open("/Users/liujingyu/.wezterm.lua", "r") as readfile:
        rawlines = readfile.readlines()
    for i in range(len(rawlines)):
        if choice == "co":
            if rawlines[i].startswith("config.color_scheme"):
                rawlines[i] = f'config.color_scheme = "{item}"\n'
                break
        elif choice == "ft":
            if rawlines[i].startswith("config.font"):
                rawlines[i] = f'config.font = wezterm.font("{item}")\n'
                break
        elif choice == "cz":
            if rawlines[i].startswith("config.font_size"):
                rawlines[i] = f'config.font_size = {item}\n'
                break
    with open("/Users/liujingyu/.wezterm.lua", "w") as writefile:
        writefile.writelines(rawlines)
    print(choice, "changed to", item)

