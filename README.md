# Multi-Language SBOM Test Project

This project contains runnable mini-projects with dependencies from various package managers across different ecosystems. It's designed to validate SBOM (Software Bill of Materials) orchestration tools by providing actual working code and clear run commands for each language component, ensuring comprehensive coverage of package ecosystems.

## Project Structure

The repository is organized by programming language, with each language having its own directory containing:
- Dependency manifest files specific to that ecosystem
- Runnable sample code that uses the dependencies
- Language-specific build configurations

## Language Components and Run Commands

### JavaScript/Node.js (NPM)

Dependencies in `package.json` include Express, Axios, Lodash, React, Moment, Jest, ESLint

```bash
# Install dependencies
cd javascript
npm install

# Run the application
node index.js
```

### Python (PyPI)

Dependencies in `requirements.txt` include Flask, NumPy, Pandas, Scikit-learn, SQLAlchemy, FastAPI, Uvicorn

```bash
# Create virtual environment
cd python
python -m venv venv

# Activate virtual environment
# On macOS/Linux:
source venv/bin/activate
# On Windows:
# venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Run the application
python app.py
```

### Java (Maven)

Dependencies in `pom.xml` include Spring Boot, Jackson, Apache Commons, Hibernate, JUnit, Lombok

```bash
# Install dependencies and run
cd java
mvn spring-boot:run

# Alternative: Build and then run
cd java
mvn clean package
java -jar target/sbom-test-0.0.1-SNAPSHOT.jar
```

### C#/.NET (NuGet)

Dependencies in `.csproj` file include Entity Framework, AutoMapper, FluentValidation, Serilog, Newtonsoft.Json

```bash
# Build and run
cd dotnet
dotnet run
```

### PHP (Composer)

Dependencies in `composer.json` include Symfony, Laravel, Guzzle, Monolog, Doctrine, PHPUnit

```bash
# Install dependencies
cd php
composer install

# Run with PHP built-in server
php -S localhost:8000 index.php
```

### Rust (Cargo)

Dependencies in `Cargo.toml` include Tokio, Serde, Reqwest, Actix-web, Diesel, Log

```bash
# Build and run
cd rust
cargo run
```

### Go (Go Modules)

Dependencies in `go.mod` include Gin, Prometheus, Zap, Logrus

```bash
# Run the application
cd go
go run main.go
```

### Ruby (RubyGems)

Dependencies in the code include Sinatra, Redis, Faraday, PG, Devise

```bash
# Install dependencies
cd ruby
bundle install

# Run the application
ruby app.rb
```

### Elixir (Hex)

Dependencies used include Plug, Cowboy, Jason, HTTPoison

```bash
# Install dependencies
cd elixir
mix deps.get

# Compile and run
mix compile
iex -S mix run
```

### Haskell (Cabal/Stackage)

Dependencies include Servant, Aeson, HTTP-Client, Warp, PostgreSQL-Simple

```bash
# Install dependencies and build
cd haskell
cabal update
cabal build

# Run the application
cabal run
```

### R (CRAN)

Dependencies include Shiny, dplyr, ggplot2, tidyr, stringr, lubridate, httr, jsonlite

```bash
# Install dependencies (if not already installed)
cd r
R -e "install.packages(c('shiny', 'dplyr', 'ggplot2', 'tidyr', 'stringr', 'lubridate', 'httr', 'jsonlite'), repos='http://cran.rstudio.com/')"

# Run the Shiny application
R -e "shiny::runApp('.')"
```

### Swift (Swift Package Manager)

Dependencies include Vapor, Logging, NIO

```bash
# Build and run
cd swift
swift build
swift run
```

## Purpose and Usage

This project is designed to:

1. Test SBOM generation tools against a diverse set of package managers and dependencies
2. Validate orchestration workflows that need to handle multiple language ecosystems
3. Provide a reference implementation for multi-language SBOM generation

To test an SBOM generator against this project, run it at the root of the project and check if it correctly identifies dependencies across all language components.

## Notes on SBOM Generation

When generating SBOMs for this project, consider:

- Each language component should be recognized by its respective dependency scanner
- Transitive dependencies should be properly tracked
- The resulting SBOM should include all direct and transitive dependencies
- The SBOM should correctly identify the ecosystem for each dependency

## Contributing

Feel free to add more language components or enhance existing ones with additional dependencies or more complex usage patterns.
# RepoWithMultipleLanguages
