package main

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	"github.com/sirupsen/logrus"
	"github.com/spf13/viper"
	"go.uber.org/zap"
)

// User represents user data
type User struct {
	ID    int    `json:"id"`
	Name  string `json:"name"`
	Email string `json:"email"`
}

// Status represents API status
type Status struct {
	Status    string    `json:"status"`
	Timestamp time.Time `json:"timestamp"`
}

// Initialize Prometheus counter
var apiHits = prometheus.NewCounterVec(
	prometheus.CounterOpts{
		Name: "api_requests_total",
		Help: "Total number of API requests",
	},
	[]string{"endpoint"},
)

func init() {
	// Register Prometheus metrics
	prometheus.MustRegister(apiHits)

	// Configure Viper
	viper.SetDefault("server.port", "8080")
	viper.SetDefault("server.mode", "debug")
}

func main() {
	// Configure logger
	logger, _ := zap.NewProduction()
	defer logger.Sync()
	sugar := logger.Sugar()

	// Use logrus for additional logging
	log := logrus.New()
	log.SetFormatter(&logrus.JSONFormatter{})
	log.Info("Starting SBOM Test Go application")

	// Set Gin mode
	gin.SetMode(gin.DebugMode)
	router := gin.Default()

	// Home route
	router.GET("/", func(c *gin.Context) {
		apiHits.WithLabelValues("home").Inc()
		sugar.Info("Home route accessed")
		c.String(http.StatusOK, "SBOM Test Go App is running!")
	})

	// Users route
	router.GET("/api/users", func(c *gin.Context) {
		apiHits.WithLabelValues("users").Inc()
		sugar.Info("Users route accessed")

		users := []User{
			{ID: 1, Name: "Alice", Email: "alice@example.com"},
			{ID: 2, Name: "Bob", Email: "bob@example.com"},
			{ID: 3, Name: "Charlie", Email: "charlie@example.com"},
		}

		c.JSON(http.StatusOK, users)
	})

	// Status route
	router.GET("/api/status", func(c *gin.Context) {
		apiHits.WithLabelValues("status").Inc()
		log.Info("Status route accessed")

		status := Status{
			Status:    "OK",
			Timestamp: time.Now(),
		}

		c.JSON(http.StatusOK, status)
	})

	// Metrics endpoint for Prometheus
	router.GET("/metrics", gin.WrapH(promhttp.Handler()))

	// Start server
	sugar.Infof("Server starting on port %s", viper.GetString("server.port"))
	router.Run(":" + viper.GetString("server.port"))
}
