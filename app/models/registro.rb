class Registro < ApplicationRecord
  belongs_to :rede
  enum tipo: [ :int, :float, :string, :boolean ]

  def to_param
    nome
  end

  def self.criar nome, v, rede
    case v.class
    when Integer
      rede.registros.create! tipo: :int, valor: v.to_s, nome:
    when Float
      rede.registros.create! tipo: :float, valor: v.to_s, nome:
    when String
      rede.registros.create! tipo: :string, valor: v, nome:
    when TrueClass, FalseClass
      rede.registros.create! tipo: :boolean, valor: v.to_s, nome:
    end
  end
end
