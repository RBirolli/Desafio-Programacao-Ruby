class DelegateHash
  def initialize(target, method_hash)
    @target = target
    @method_hash = method_hash.dup
  end
  def [](k)
    @target.send(@method_hash[k])
  end
end

class Processor
  def initialize(item_type)
    @item_type_array = item_type
    @a = DelegateHash.new(self, item_type)
  end

  def execute_action(type)
    action = @item_type_array.index(type)
    @a[action]
  end

  def item_fisico()
    puts "Item Fisico - Gerar shipping label"
  end

  def assinatura()
    puts "Ativar assinatura - enviar email"
  end

  def livro_comum()
    puts "livro comum - Gerar shipping label"
  end

  def midia_digital()
    puts "Midia digital - enviar email com descricao"
    puts "Enviar voucher"
  end

  def carro()
    puts "Venda de carro - pegar na concesionaria"
  end

end

