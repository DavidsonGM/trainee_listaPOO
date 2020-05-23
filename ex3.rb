class Pessoa
  #Lista de todas as contas
  @@contas = []
  def initialize(nome, cpf, telefone, idade)
    @nome = nome
    @cpf = cpf
    @telefone = telefone
    @idade = idade
  end

  attr_reader :nome, :cpf, :telefone, :idade

  def self.contas
    @@contas
  end
end

class ContaCorrente < Pessoa
  #Lista de contas correntes
  @@cc = []
  def initialize(nome, cpf, telefone, idade, saldo, numero_conta, senha)
    super(nome, cpf, telefone, idade)
    @saldo = saldo
    @numero_conta = numero_conta
    @senha = senha
    @@contas << self
    @@cc << self
  end

  attr_reader :numero_conta

  def self.cc
    @@cc
  end

  def depositar(valor)
    @saldo += valor
    puts "\nValor depositado: R$#{'%.2f' % valor}\n"
  end

  def sacar(valor)
    if valor > @saldo
      valor = @saldo
    end
    @saldo -= valor
    puts "\nValor sacado: R$#{'%.2f' % valor}\n"
  end

  def mostra_saldo()
    puts "\nSaldo atual: R$#{'%.2f' % @saldo}\n"
  end

  def mudar_telefone(novo_numero)
    puts "\nNúmero de telefone alterado de #{@telefone} para #{novo_numero}\n"
    @telefone = novo_numero
  end

  def mostra_dados_pessoais()
    puts "\nNome: #{@nome}\nCPF: #{@cpf}\nTelefone: #{@telefone}\nIdade: #{@idade}\n"
  end

  def mostra_dados_conta()
    puts "\nNúmero da conta: #{@numero_conta}\nSenha: #{@senha}\n"
  end
end

class ContaPoupanca < Pessoa
  #Lista de contas poupança
  @@cp = []
  def initialize(nome, cpf, telefone, idade, saldo, numero_conta, senha)
    super(nome, cpf, telefone, idade)
    @saldo = saldo
    @numero_conta = numero_conta
    @senha = senha
    @@contas << self
    @@cp << self
  end

  attr_reader :numero_conta

  def self.cp
    @@cp
  end

  def depositar(valor)
    @saldo += valor
    puts "\nValor depositado: R$#{'%.2f' % valor}\n\n"
  end

  def sacar(valor)
    if valor > @saldo
      valor = @saldo
    end
    @saldo -= valor
    puts "\nValor sacado: R$#{'%.2f' % valor}\n\n"
  end

  def mostra_saldo()
    puts "\nSaldo atual: R$#{'%.2f' % @saldo}\n\n"
  end

  def mudar_telefone(novo_numero)
    puts "\nNúmero de telefone alterado de #{@telefone} para #{novo_numero}\n\n"
    @telefone = novo_numero
  end

  def mostra_dados_pessoais()
    puts "\nNome: #{@nome}\nCPF: #{@cpf}\nTelefone: #{@telefone}\nIdade: #{@idade}\n\n"
  end

  def mostra_dados_conta()
    puts "\nNúmero da conta: #{@numero_conta}\nSenha: #{@senha}\n\n"
  end
end


pessoa = Pessoa.new("David Mendes", "883.039.972-20", "(11) 4002-8922", 18)

#Menu 1
escolha = -1
while escolha != 0
  puts "\nDigite a opção desejada:
0 - Sair
1 - Listar contas corrente
2 - Listar contas poupança
3 - Criar contas corrente
4 - Criar contas poupança
5 - Acessar conta"
  escolha = gets.to_i

  case escolha
  when 0
    break

  when 1
    if ContaCorrente.cc.length == 0
      puts "Erro: Nenhuma conta corrente foi encontrada."
    else
      puts "\nContas corrente:"
      ContaCorrente.cc.each do |c|
        puts c.numero_conta
      end
    end

  when 2
    if ContaPoupanca.cp.length == 0
      puts "Erro: Nenhuma conta poupança foi encontrada."
    else
      puts "\nContas poupança:"
      ContaPoupanca.cp.each do |c|
        puts c.numero_conta
      end
    end

  when 3
    print "Número da nova conta: "
    numero_conta =  gets.chomp

    #verifica se número da conta já existe
    conta_existente = false
    ContaCorrente.cc.each do |n|
      if n.numero_conta == numero_conta
        conta_existente = true
      end
    end

    if !conta_existente
      print "Crie uma senha: "
      senha = gets.chomp
      ContaCorrente.new(pessoa.nome, pessoa.cpf, pessoa.telefone, pessoa.idade, 0, numero_conta, senha)
    else
      puts "Erro ao criar conta. Número de conta ja existente."
    end

  when 4
    print "Número da nova conta: "
    numero_conta =  gets.chomp

    #verifica se número da conta já existe
    conta_existente = false
    ContaPoupanca.cp.each do |n|
      if n.numero_conta == numero_conta
        conta_existente = true
      end
    end

    if !conta_existente
      print "Crie uma senha: "
      senha = gets.chomp
      ContaPoupanca.new(pessoa.nome, pessoa.cpf, pessoa.telefone, pessoa.idade, 0, numero_conta, senha)
    else
      puts "Erro ao criar conta. Número de conta ja existente."
    end

  when 5
    if Pessoa.contas.length == 0
      puts "Erro: Nenhuma conta foi encontrada."
    else
      puts "Selecione a conte a qual deseja acessar:"
      #Mostrando todas as contas
      i = 0
      Pessoa.contas.each do |c|
        print i + 1
        print " - "
        i += 1
        if c.is_a? ContaPoupanca
          puts c.numero_conta + " (Conta Poupança)"
        else
          puts c.numero_conta + " (Conta Corrente)"

        end
      end

      n = gets.to_i
      if n < 1 or n > Pessoa.contas.length
        puts "Opção inválida."
      else
        conta = Pessoa.contas[n - 1]

        escolha5 = 0
        puts "Digite sua opção:"
        while escolha5 != 7

          puts "1. Depositar"
          puts "2. Sacar"
          puts "3. Exibir Saldo"
          puts "4. Modificar telefone"
          puts "5. Exibir dados pessoais"
          puts "6. Exibir dados da conta"
          puts "7. Sair"
          escolha5 = gets.to_i

          #Menu 2
          case escolha5
          when 1
            print "Valor a ser depositado: "
            valor = gets.to_f
            if valor > 0
              conta.depositar(valor)
            else
              puts "Valor inválido!\n"
            end

          when 2
            print "Valor a ser sacado: "
            valor = gets.to_f
            if valor > 0
              conta.sacar(valor)
            else
              puts "Valor inválido!\n"
            end

          when 3
            conta.mostra_saldo

          when 4
            print "Novo número de telefone: "
            numero = gets.chomp
            conta.mudar_telefone(numero)

          when 5
            conta.mostra_dados_pessoais

          when 6
            conta.mostra_dados_conta

          when 7
            break

          else
            puts "Opção inválida.\n"
          end
        end
      end
    end
  else
    puts "Opção inválida.\n"
  end
end