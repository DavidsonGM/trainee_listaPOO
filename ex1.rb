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
    puts "Valor depositado: R$#{'%.2f' % valor}\nNovo saldo: R$#{'%.2f' % @saldo}\n--------------------------------------"
  end

  def sacar(valor)
    if valor > @saldo
      valor = @saldo
    end
    @saldo -= valor
    puts "Valor sacado: R$#{'%.2f' % valor}\nNovo saldo: R$#{'%.2f' % @saldo}\n--------------------------------------"
  end

  def mostra_saldo()
    puts "Saldo atual: R$#{'%.2f' % @saldo}\n--------------------------------------"
  end

  def mudar_telefone(novo_numero)
    puts "Número antigo: #{@telefone}"
    @telefone = novo_numero
    puts "Número novo: #{@telefone}\n--------------------------------------"
  end

  def mostra_dados_pessoais()
    puts "Nome: #{@nome}\nCPF: #{@cpf}\nTelefone: #{@telefone}\nIdade: #{@idade}\n--------------------------------------"
  end

  def mostra_dados_conta()
    puts "Número da conta: #{@numero_conta}\nSenha: #{@senha}\n--------------------------------------"
  end
end

conta = ContaBancaria.new("David Mendes", "883.039.972-20", "(11) 4002-8922", 18, 322.93, "13579-X", "246810")
conta.depositar(317.24)
conta.sacar(40.69)
conta.mostra_saldo
conta.mudar_telefone("(11) 2308-3883")
conta.mostra_dados_pessoais
conta.mostra_dados_conta
