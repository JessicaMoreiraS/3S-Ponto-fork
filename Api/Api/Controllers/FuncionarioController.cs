

using ApiHackathon.Interfaces;
using ApiHackathon.models;
using Microsoft.AspNetCore.Mvc;
namespace ApiHackathon.Controllers;

[Route("api/[controller]")]
[ApiController]
public class FuncionarioController : ControllerBase
{
    readonly IFuncionario _funcionarioRepositorio;
    public FuncionarioController(IFuncionario funcionarioRepositorio)
    {
        _funcionarioRepositorio = funcionarioRepositorio;
    }
    [HttpGet]
    public ActionResult<List<Funcionario>> Get()
    {
        return Ok(_funcionarioRepositorio.GetFuncionarios());
    }
}
