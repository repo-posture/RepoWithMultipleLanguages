import Foundation
import Vapor
import Logging
import NIO

// Define models
struct User: Content {
    let id: Int
    let name: String
    let email: String
}

struct Status: Content {
    let status: String
    let timestamp: String
    let version: String
}

struct ExternalPost: Content {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

// Configure routes
func routes(_ app: Application) throws {
    // Basic route
    app.get { req -> String in
        "SBOM Test Swift App is running!"
    }
    
    // API routes group
    let api = app.grouped("api")
    
    // Users endpoint
    api.get("users") { req -> [User] in
        let logger = req.logger
        logger.info("Users endpoint accessed")
        
        return [
            User(id: 1, name: "Alice", email: "alice@example.com"),
            User(id: 2, name: "Bob", email: "bob@example.com"),
            User(id: 3, name: "Charlie", email: "charlie@example.com")
        ]
    }
    
    // Status endpoint
    api.get("status") { req -> Status in
        let logger = req.logger
        logger.info("Status endpoint accessed")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = dateFormatter.string(from: Date())
        
        return Status(
            status: "OK",
            timestamp: timestamp,
            version: "1.0.0"
        )
    }
    
    // External data endpoint
    api.get("external") { req -> EventLoopFuture<ExternalPost> in
        let logger = req.logger
        logger.info("External data endpoint accessed")
        
        let client = req.client
        
        return client
            .get("https://jsonplaceholder.typicode.com/posts/1")
            .flatMapThrowing { response -> ExternalPost in
                guard response.status == .ok else {
                    logger.error("Error fetching external data: \(response.status)")
                    throw Abort(.internalServerError, reason: "Failed to fetch external data")
                }
                
                return try response.content.decode(ExternalPost.self)
            }
    }
    
    // Secured endpoint example (using KeychainAccess in a real app)
    api.get("secured") { req -> String in
        req.logger.info("Secured endpoint accessed")
        return "This would be secured with KeychainAccess in a real app"
    }
}

@main
struct SBOMTestApp {
    static func main() throws {
        // Create and configure the application
        let app = Application(.development)
        defer { app.shutdown() }
        
        // Set up logging
        app.logger.logLevel = .info
        app.logger.info("Starting SBOM Test Swift application")
        
        // Register routes
        try routes(app)
        
        // Start the server
        try app.run()
    }
}
