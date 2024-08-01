// Simple REST backend server for to do list
//
// AK, 1/08/2024

package main

import (
	//"fmt"
	"net/http"
	"strconv"

	"database/sql"
	"github.com/gin-gonic/gin"
	_ "github.com/mattn/go-sqlite3"
)

// Structure of a task
type Task struct {
	Id          int    `json:"id"`
	Name        string `json:"name"`
	Description string `json:"description"`
	Done        bool   `json:"done"`
}

func main() {

	// Define routes
	router := gin.Default()
	router.GET("/tasks", getTasks)
	router.GET("/task/:id", getTaskByID)
	//router.POST("/add_task", addTask)
	// update task
	// delete task

	// Start server
	router.Run("localhost:8080")
}

// Return a list of all tasks
func getTasks(c *gin.Context) {

	// Connect to database
	db := dbConnect()
	defer db.Close()

	// Execute query to get all tasks
	rows, err := db.Query("select id, name, description, done from task order by name")
	if err != nil {
		panic("getTasks query: " + err.Error())
	}
	defer rows.Close()

	// Collect into a list
	tasks := []Task{}
	for rows.Next() {
		t := Task{}
		err := rows.Scan(&t.Id, &t.Name, &t.Description, &t.Done)
		if err != nil {
			panic("getTasks next: " + err.Error())
		}
		//e.SDate = cleanDate(e.SDate)
		tasks = append(tasks, t)
	}
	if rows.Err() != nil {
		panic("getTasks exit: " + err.Error())
	}

	// Return list in JSON format
	c.IndentedJSON(http.StatusOK, tasks)
}

// Return one task, by id
func getTaskByID(c *gin.Context) {

	// Get the id to find
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.IndentedJSON(http.StatusNotFound, gin.H{"message": "Invalid task id"})
	}

	// Connect to database
	db := dbConnect()
	defer db.Close()

	// Find task and return it, or error if not found
	t := Task{}
	q := "select id, name, description, done from task where id = $1"
	err = db.QueryRow(q, id).Scan(&t.Id, &t.Name, &t.Description, &t.Done)
	if err != nil {
		c.IndentedJSON(http.StatusNotFound, gin.H{"message": "Task not found"})
	}
	c.IndentedJSON(http.StatusNotFound, gin.H{"task": t})
}

// Connect to database
// Don't forget to "defer db.Close() after calling this
func dbConnect() *sql.DB {
	db, err := sql.Open("sqlite3", "./data.db")
	if err != nil {
		panic("dbConnect: " + err.Error())
	}
	return db
}
