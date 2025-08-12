using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Serilog;
using Microsoft.EntityFrameworkCore;
using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SbomTest
{
    // Entity model
    public class User
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
    }

    // DTO model
    public class UserDto
    {
        public string Name { get; set; }
        public string Email { get; set; }
    }

    // DbContext using Entity Framework
    public class AppDbContext : DbContext
    {
        public DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseInMemoryDatabase("SbomTestDb");
        }
    }

    // AutoMapper profile
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<User, UserDto>();
            CreateMap<UserDto, User>();
        }
    }

    // FluentValidation validator
    public class UserValidator : AbstractValidator<UserDto>
    {
        public UserValidator()
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name is required");
            RuleFor(x => x.Email).NotEmpty().EmailAddress().WithMessage("Valid email is required");
        }
    }

    // Main program
    public class Program
    {
        static void Main(string[] args)
        {
            // Set up Serilog
            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Information()
                .WriteTo.Console()
                .CreateLogger();

            try
            {
                Log.Information("Starting SBOM Test .NET application");

                // Set up AutoMapper
                var mapperConfig = new MapperConfiguration(cfg => 
                {
                    cfg.AddProfile<MappingProfile>();
                });
                var mapper = mapperConfig.CreateMapper();

                // Create some user data
                var users = new List<User>
                {
                    new User { Id = 1, Name = "Alice", Email = "alice@example.com" },
                    new User { Id = 2, Name = "Bob", Email = "bob@example.com" }
                };

                // Serialize to JSON with Newtonsoft.Json
                var json = JsonConvert.SerializeObject(users, Formatting.Indented);
                Console.WriteLine("Users as JSON:");
                Console.WriteLine(json);

                // Map to DTOs with AutoMapper
                var userDtos = mapper.Map<List<UserDto>>(users);
                Console.WriteLine("\nMapped to DTOs successfully");

                // Validate with FluentValidation
                var validator = new UserValidator();
                var invalidUser = new UserDto { Name = "", Email = "invalid" };
                var validationResult = validator.Validate(invalidUser);

                Console.WriteLine("\nValidation errors:");
                foreach (var error in validationResult.Errors)
                {
                    Console.WriteLine($"- {error.PropertyName}: {error.ErrorMessage}");
                }

                Console.WriteLine("\nSBOM Test .NET application completed successfully");
            }
            catch (Exception ex)
            {
                Log.Fatal(ex, "Application terminated unexpectedly");
            }
            finally
            {
                Log.CloseAndFlush();
            }
        }
    }
}
