package main

import "fmt"

func main() {
	fmt.Println("vim-go")

	s := Student{Name: "John"}
	fmt.Println(s.GetName())
}

type Student struct {
	Name string
}

func (s Student) GetName() string {
	return s.Name
}
