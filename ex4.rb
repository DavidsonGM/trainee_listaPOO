class Turma
  @@turmas = []
  @@alunos_aprovados = 0
  @@total_alunos = 0
  def initialize(materia, alunos)
    @materia = materia
    @alunos = alunos
    @n_aprovados = 0
    @@turmas << self
    @@total_alunos += @alunos.length
  end

  attr_reader :materia

  def self.turmas
    @@turmas
  end

  def self.alunos_aprovados
    @@alunos_aprovados
  end

  def self.total_alunos
    @@total_alunos
  end

  def aprovados
    @alunos.each do |a|
        if a["Nota"] >= 5
          @n_aprovados += 1
          @@alunos_aprovados += 1
      end
    end
    return @n_aprovados/@alunos.length.to_f
  end
end

materias = ["Cálculo 1", "Cáculo 2", "Cálculo 3", "Física 1", "Física 2", "Estrutura de Dados", "Algoritmos e Programação de Computadores", "Técnicas de Programação 1", "Sistemas Digitais", "Eletromagnetismo"]
print "Digite o número de turmas: "
n_turmas = gets.to_i
if n_turmas > 10 or n_turmas < 1
  puts "Entrada inválida."
  n_turmas = 0
end

for i in 1..n_turmas
  materia = materias.sample
  materias.delete(materia)
  alunos = []
  for i in 1..rand(5..20)
    alunos << {"Nota" => rand(0.0..10.0), "Matrícula" => rand(100000000..210000000)}
  end
  Turma.new(materia, alunos)
end

unless n_turmas == 0
  puts "\nPercentuais de aprovação:"
  Turma.turmas.each do |t|
    print t.materia + ": "
    percentual = t.aprovados*100
    print '%.2f' % percentual
    puts "%"
  end

  print "\nPercentual total: "
  percentual = 100 * Turma.alunos_aprovados.to_f/Turma.total_alunos.to_f
  print '%.2f' % percentual
  puts "%"
end