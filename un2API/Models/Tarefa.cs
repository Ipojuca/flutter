namespace un2API.Models
{
    public class Tarefa
    {
        public int Id { get; set; }
        public string? Descricao { get; set; }
        public Usuario? usuario { get; set; }
    }
}
