require 'twitter'
class TwitterScraper

# initialisation des clés d'API récupérées sur "https://developer.twitter.com/en/apps/"
# et enregistrés dans le fichier credential.yml.emc
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials[:thelille_config_key]
      config.consumer_secret     = Rails.application.credentials[:thplille_config_secret]
      config.access_token        = Rails.application.credentials[:thplille_token_key]
      config.access_token_secret = Rails.application.credentials[:thplille_token_secret]
    end
  end

  def followers #Méthode qui a pour but de récupérer les handles des followers de notre compte
    @users = [] #initiation d'un tableau vide qui sera destiné à acceuillir les handles
    essi = @client.followers() # affectation à une valeur d'un hash d'informations sur nos followers grâce à la fonction @client.followers
    j = essi.attrs[:users].count # Pour la boucle qui arrive juste après et qui permettra d'itérer sur les différents folllowers, on les comptes, pour pouvoir fixer une limite à notre boucle
    j.times do |i| #boucle qui va répeter l'action de recherche du screen_name j fois et qui va insérer chaque valeur dans le tableau @users
      @users << essi.attrs[:users][i][:screen_name]
    end
  end

# Pour cette méthode, c'est exactement la même que la précédente;
# mais celle-ci vise les following
  def following
    @following = []
    following = @client.friends()
    j = following.attrs[:users].count
    j.times do |i|
      @following << following.attrs[:users][i][:screen_name]
    end
  end

  # Cette méthode nous permet de tweeter un message grâce à notre compte
  def tweeter
    @client.update("Une école révolutionnaire qui permet d'acquérir les bases du code en un rien de temps ?
        https://bit.ly/2z6Mp2g #THP #coding #Ruby #Javascript")
  end

# Cette méthode nous permet d'envoyer un tweet à une personne en l'identifiant
# grâce à son screen_name présent dans le tablau @users crée plus haut
  def tweet_perso
    @users.each do |user|
      begin
          @client.update("@#{user} Une école révolutionnaire qui permet d'acquérir les bases du code en un rien de temps ?
              https://bit.ly/2z6Mp2g")
      rescue Exception, NotFound, Forbidden
        next
      end
    end
  end


  # Cette méthode regroupe les quatres dernières méthodes et permet de toutes les lancées
  # en executant dans le terminal (ou dans le fichier dans lequel on aura besoin de
  # ces informations) Twitter.new.perfom
  def perform
    followers
    following
    tweeter
    tweet_perso
  end

end
