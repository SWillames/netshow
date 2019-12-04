require 'faker'
namespace :dev do
  DEFAULT_PASSWORD = 123456

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") {%x(rails db:drop)}
      show_spinner("Criando BD...") {%x(rails db:create)}
      show_spinner("Migrando o BD...") {%x(rails db:migrate)}
      show_spinner("Cadastrando o usuario padrão...") {%x(rails dev:add_default_user)}
    else
      puts "Você não está no ambiente de desenvolvimento"
    end
  end

  desc "Adiciona o Usuario padrão"
  task add_default_user: :environment do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    u = User.new(
      email: 'user_default@example.com',
      first_name: first_name, 
      last_name: last_name,
      user_name: Faker::Internet.username(specifier: "#{first_name} #{last_name}", separators: %w(. _ -)),
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )

    u.save!
  end

  private
  def show_spinner(msg_start, msg_end = "Concluido")
    spinner = TTY::Spinner.new("[:spinner) #{msg_start}", format: :dots_9)
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end
end  
  
  