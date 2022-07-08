class Rede < ApplicationRecord
  has_secure_token
  has_many :registros, dependent: :destroy

  #faz path helpers como edit_rede_path apontarem para o caminho /redes/:token
  def to_param
    token
  end
end
