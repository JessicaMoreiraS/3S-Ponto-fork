using Microsoft.EntityFrameworkCore;

namespace ApiHackathon.models
{
    public class ApiContext : DbContext
    {
        protected override void OnConfiguring
       (DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseInMemoryDatabase(databaseName: "3sDb");
        }
        public DbSet<Funcionario> Funcionarios { get; set; }
    }
}
