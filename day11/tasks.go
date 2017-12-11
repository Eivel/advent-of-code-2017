package main

import (
	"fmt"
	"io/ioutil"
	"math"
	"strings"
)

func main() {
	b, err := ioutil.ReadFile("task_input")
	if err != nil {
		fmt.Print(err)
	}
	str := strings.TrimSpace(string(b))
	arr := strings.Split(str, ",")
	steps := calculateSteps(arr)
	fmt.Println(steps)
}

func calculateSteps(arr []string) int {
	x := float64(0)
	y := float64(0)
	for _, el := range arr {
		switch el {
		case "n":
			y++
		case "ne":
			x++
			y += 0.5
		case "se":
			x++
			y -= 0.5
		case "s":
			y--
		case "sw":
			x--
			y -= 0.5
		case "nw":
			x--
			y += 0.5
		}
	}
	x = math.Abs(x)
	y = math.Abs(y)
	return int(y - (x / 2) + x)
}
