package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"time"
)

func main() {
	start := time.Now()
	arr := readLine("task_input")
	fmt.Println(stepRecursive(arr, 0, 0))
	elapsed := time.Since(start)
	log.Printf("Calculation took %s", elapsed)

}
func readLine(path string) []int {
	arr := make([]int, 0)
	inFile, _ := os.Open(path)
	defer inFile.Close()
	scanner := bufio.NewScanner(inFile)
	scanner.Split(bufio.ScanLines)

	for scanner.Scan() {
		i, _ := strconv.Atoi(scanner.Text())
		arr = append(arr, i)
	}
	return arr
}

func step(arr []int, position int, steps int) int {
	for position < len(arr) && position >= 0 {
		val := arr[position]
		arr[position] = processOffset(val)
		position = position + val
		steps = steps + 1
	}
	return steps
}

func stepRecursive(arr []int, position int, steps int) int {
	if position >= len(arr) || position < 0 {
		return steps
	}
	val := arr[position]
	arr[position] = processOffset(val)
	return step(arr, position+val, steps+1)
}

func processOffset(offset int) int {
	if (offset) >= 3 {
		return offset - 1
	}
	return offset + 1
}
