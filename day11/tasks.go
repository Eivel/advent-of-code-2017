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
	distance, maxDistance := calculatePath(arr)
	fmt.Printf("Shortest path: %v steps\n", distance)
	fmt.Printf("Max distance: %v steps\n", maxDistance)
}

func calculatePath(arr []string) (int, int) {
	x := float64(0)
	y := float64(0)
	maxDistance := float64(0)
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
		maxDistance = math.Max(maxDistance, calculateDistance(x, y))
	}

	return int(calculateDistance(x, y)), int(maxDistance)
}

func calculateDistance(x float64, y float64) float64 {
	return math.Abs(y) - (math.Abs(x) / 2) + math.Abs(x)
}
