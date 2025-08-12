use actix_web::{web, App, HttpServer, Responder, HttpResponse};
use serde::{Deserialize, Serialize};
use log::{info, error};
use chrono::Utc;
use reqwest;

// Struct for user data
#[derive(Serialize, Deserialize)]
struct User {
    id: u32,
    name: String,
    email: String,
}

// Struct for status response
#[derive(Serialize)]
struct Status {
    status: String,
    timestamp: String,
    version: String,
}

// Struct for external API data
#[derive(Deserialize, Serialize)]
struct Post {
    id: u32,
    userId: u32,
    title: String,
    body: String,
}

// Home route handler
async fn index() -> impl Responder {
    info!("Home route accessed");
    HttpResponse::Ok().body("SBOM Test Rust App is running!")
}

// Users route handler
async fn get_users() -> impl Responder {
    info!("Users route accessed");
    
    let users = vec![
        User { id: 1, name: "Alice".to_string(), email: "alice@example.com".to_string() },
        User { id: 2, name: "Bob".to_string(), email: "bob@example.com".to_string() },
        User { id: 3, name: "Charlie".to_string(), email: "charlie@example.com".to_string() },
    ];
    
    HttpResponse::Ok().json(users)
}

// Status route handler
async fn get_status() -> impl Responder {
    info!("Status route accessed");
    
    let status = Status {
        status: "OK".to_string(),
        timestamp: Utc::now().to_string(),
        version: env!("CARGO_PKG_VERSION").to_string(),
    };
    
    HttpResponse::Ok().json(status)
}

// External API call handler
async fn get_external_data() -> impl Responder {
    info!("External API route accessed");
    
    match reqwest::get("https://jsonplaceholder.typicode.com/posts/1").await {
        Ok(response) => {
            match response.json::<Post>().await {
                Ok(post) => HttpResponse::Ok().json(post),
                Err(e) => {
                    error!("Failed to parse response: {}", e);
                    HttpResponse::InternalServerError().body("Failed to parse response")
                }
            }
        },
        Err(e) => {
            error!("Failed to fetch external data: {}", e);
            HttpResponse::InternalServerError().body("Failed to fetch external data")
        }
    }
}

// Main function
#[actix_web::main]
async fn main() -> std::io::Result<()> {
    // Initialize logger
    env_logger::init_from_env(env_logger::Env::default().default_filter_or("info"));
    
    info!("Starting SBOM Test Rust application");
    
    // Start HTTP server
    HttpServer::new(|| {
        App::new()
            .route("/", web::get().to(index))
            .route("/api/users", web::get().to(get_users))
            .route("/api/status", web::get().to(get_status))
            .route("/api/external", web::get().to(get_external_data))
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
