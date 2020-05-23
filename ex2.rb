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

escolha = 0
print "Digite sua opção:"
while escolha != 7

  puts "
1. Depositar
2. Sacar
3. Exibir Saldo
4. Modificar telefone
5. Exibir dados pessoais
6. Exibir dados da conta
7. Sair"
    escolha = gets.to_i

    case escolha
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