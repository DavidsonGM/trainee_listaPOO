class ContaBancaria
  def initialize(nome, cpf, telefone, idade, saldo, numero_conta, senha)
    @nome = nome
    @cpf = cpf
    @telefone = telefone
    @idade = idade
    @saldo = saldo
    @numero_conta = numero_conta
    @senha = senha
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

conta = ContaBancaria.new("David Mendes", "883.039.972-20", "(11) 4002-8922", 18, 322.93, "13579-X", "246810")
conta.depositar(317.24)
conta.sacar(40.69)
conta.mostra_saldo
conta.mudar_telefone("(11) 2308-3883")
conta.mostra_dados_pessoais
conta.mostra_dados_conta
