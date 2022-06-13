namespace un2API.Models
{
    public class Tarefa
    {
        public int Id { get; set; }
        public int ProjetoId { get; set; }
        public string? Descricao { get; set; }
        public int UsuarioId { get; set; }
    }
}
