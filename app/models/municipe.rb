class Municipe < ApplicationRecord
  validates :name, :cpf, :cns, :email, :birthdate, :phone, :status, presence: true
  validates :cpf, format: { with: /\A\d{3}(\.| |-)?\d{3}(\.| |-)?\d{3}(\.| |-)?\d{2}\z/ }
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/ }
  validates :cns, format: { with: /\A[0-9]{15}\z/ }
  validate :birthdate_validation

  has_many :addresses

  has_one_attached :photo

  after_save :send_welcome_notification
  after_update :send_update_data_notification

  enum status: {
    ativo: 'ativo',
    inativo: 'inativo'
  }

  def self.options_for_filter
    [
      %w[ ], %w[ID id], %w[Nome name], %w[CPF cpf], %w[CNS cns], %w[Email email],
      %w[Telefone phone], %w[Status status]
    ]
  end

  def birthdate_validation
    return if birthdate.nil?

    return unless birthdate > Date.today || birthdate < 130.years.ago.to_date

    errors.add(:birthdate, 'A data de nascimento não condiz com a realidade.')
  end

  def send_welcome_notification
    EmailSender.send_email(
      to: email,
      subject: 'Bem-vindo ao Meu Site!',
      body: 'Olá! Obrigado por se cadastrar no Meu Site.'
    )
  end

  def send_update_data_notification
    EmailSender.send_email(
      to: email,
      subject: 'Atualização de dados!',
      body: 'Olá! Notamos que houve uma atualização nos seus dados, por favor verifique se foi você mesmo!'
    )
  end

  def photo_as_thumbnail
    photo.variant(resize_to_limit: [300, 300]).processed
  end
end
