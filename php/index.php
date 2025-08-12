<?php

require_once __DIR__ . '/vendor/autoload.php';

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Matcher\UrlMatcher;
use Symfony\Component\Routing\RequestContext;
use Symfony\Component\Routing\Route;
use Symfony\Component\Routing\RouteCollection;
use GuzzleHttp\Client;
use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use Doctrine\DBAL\DriverManager;

// Set up logger
$logger = new Logger('sbom_test');
$logger->pushHandler(new StreamHandler('php://stderr', Logger::INFO));
$logger->info('SBOM Test PHP App starting');

// Set up routing
$routes = new RouteCollection();

// Home route
$routes->add('home', new Route('/', [
    '_controller' => function() use ($logger) {
        $logger->info('Home route accessed');
        return new Response('SBOM Test PHP App is running!');
    }
]));

// Users route
$routes->add('users', new Route('/api/users', [
    '_controller' => function() use ($logger) {
        $logger->info('Users route accessed');
        
        $users = [
            ['id' => 1, 'name' => 'Alice', 'email' => 'alice@example.com'],
            ['id' => 2, 'name' => 'Bob', 'email' => 'bob@example.com'],
            ['id' => 3, 'name' => 'Charlie', 'email' => 'charlie@example.com']
        ];
        
        $response = new Response(json_encode($users));
        $response->headers->set('Content-Type', 'application/json');
        
        return $response;
    }
]));

// External API route
$routes->add('external', new Route('/api/external', [
    '_controller' => function() use ($logger) {
        $logger->info('External API route accessed');
        
        $client = new Client();
        try {
            $response = $client->request('GET', 'https://jsonplaceholder.typicode.com/posts/1');
            $data = json_decode($response->getBody(), true);
            
            $apiResponse = new Response(json_encode($data));
            $apiResponse->headers->set('Content-Type', 'application/json');
            
            return $apiResponse;
        } catch (\Exception $e) {
            $logger->error('Error fetching external API: ' . $e->getMessage());
            return new Response('Error fetching external data', 500);
        }
    }
]));

// Database demo route
$routes->add('db', new Route('/api/db', [
    '_controller' => function() use ($logger) {
        $logger->info('Database route accessed');
        
        try {
            // Using in-memory SQLite for demo
            $connectionParams = [
                'driver' => 'pdo_sqlite',
                'memory' => true,
            ];
            
            $conn = DriverManager::getConnection($connectionParams);
            
            // Create a table
            $conn->executeStatement('CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, email TEXT)');
            
            // Insert data
            $conn->executeStatement('INSERT INTO users (name, email) VALUES (?, ?)', ['Alice', 'alice@example.com']);
            $conn->executeStatement('INSERT INTO users (name, email) VALUES (?, ?)', ['Bob', 'bob@example.com']);
            
            // Query data
            $users = $conn->fetchAllAssociative('SELECT * FROM users');
            
            $response = new Response(json_encode($users));
            $response->headers->set('Content-Type', 'application/json');
            
            return $response;
        } catch (\Exception $e) {
            $logger->error('Database error: ' . $e->getMessage());
            return new Response('Database error: ' . $e->getMessage(), 500);
        }
    }
]));

// Handle request
$request = Request::createFromGlobals();
$context = new RequestContext();
$context->fromRequest($request);

try {
    $matcher = new UrlMatcher($routes, $context);
    $parameters = $matcher->match($request->getPathInfo());
    
    $controller = $parameters['_controller'];
    $response = $controller();
} catch (\Exception $e) {
    $logger->error('Error processing request: ' . $e->getMessage());
    $response = new Response('Not found', 404);
}

// Send response
$response->send();
