#!/usr/bin/python3
from sys import argv
import os
import os.path as op


def main():
	# os.system("git key") # TODO check agent existance and key already added
	for entry in os.listdir(scanpath):
		fullpath = op.realpath(op.join(scanpath, entry))
		if op.isdir(fullpath):
			if op.isdir(op.join(fullpath, ".git")):
				os.chdir(fullpath)
				print(f"\nUpdating git repo : {entry}")
				os.system("git fetch") # TODO try rebase ?
				os.chdir(currdir)
			else: # TODO full recursive (+ depth argument)
				subscanpath = scanpath + "/" + entry
				for subentry in os.listdir(subscanpath):
					subpath = op.realpath(op.join(subscanpath, subentry))
					if op.isdir(subpath):
						if op.isdir(op.join(subpath, ".git")):
							os.chdir(subpath)
							print(f"\nUpdating git repo : {subentry}")
							os.system("git fetch")
							os.chdir(currdir)
						else:
							print(f"{subentry} is not a git repo")


if __name__ == "__main__":
	currdir = op.realpath(os.curdir)
	print(currdir)
	if len(argv) > 1:
		scanpath = argv[1]
	else:
		scanpath = currdir
	main()

