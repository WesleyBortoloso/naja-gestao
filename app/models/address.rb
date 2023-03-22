class Address < ApplicationRecord
  belongs_to :municipe
  validates :zip_code, :street, :neighborhood, :city, :state, presence: true

  def self.options_for_filter
    [
      %w[ ], %w[CEP zip_code], %w[Rua street], %w[Bairro neighborhood], %w[Cidade city],
      %w[Estado state], %w[Código IBGE ibge_code]
    ]
  end
end
