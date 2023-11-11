using ApiHackathon.models;

namespace Api.models;

public class ProdutoRepositorio
{
    public ProdutoRepositorio()
    {
        using (var context = new ApiContext())
        {
            var funcionarios = new List<Funcionario>
                {
                new Funcionario
                {
                    Nome ="Jose",
                    Cpf = "555-555-555-08",
                    Password = "12883137",
                    Pontos = 0
                },
             };
            context.Funcionarios.AddRange(funcionarios);
            context.SaveChanges();
        }
    }
    public List<Funcionario> GetFuncionarios()
    {
        using (var context = new ApiContext())
        {
            var list = context.Funcionarios
                .ToList();
            return list;
        }
    }
}
