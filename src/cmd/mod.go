package cmd

import (
	"fmt"
	"os"

	"xtool.app/src/constants"
)

func Cli() {
	args := os.Args

	if len(args) == 1 {
		show_description()
		fmt.Println("Show help in `" + constants.BIN_NAME + " help`")
	} else if len(args) == 2 {
		if args[1] == "help" {
			show_help()
		} else if args[1] == "--version" {
			show_version()
		} else {
			show_help()
		}
	} else {
		show_help()
	}
}

func show_version() {
	fmt.Println(constants.APP_NAME + " version: " + constants.VERSION)
}

func show_description() {
	fmt.Println(constants.APP_NAME + " is a tool for convenience")
}

func show_help() {
	fmt.Println("Usage: " + constants.BIN_NAME + " [command | parameter]")
	fmt.Println("")
	fmt.Println("  help: show this help")
	fmt.Println("")
	fmt.Println("  --version: show the version")
	fmt.Println("")
}
