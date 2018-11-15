require 'gmail'

class MailSender

  def initialize
      @adresse_mail         = Rails.application.credentials[:adresse_mail]
      @mdp                  = Rails.application.credentials[:mdp]
      @contacts = Target.all
  end


  def send_email_to_townhall(contact)
    gmail = Gmail.connect!(@adresse_mail, @mdp)
    gmail.deliver do
      to  contact[:email]
      subject " Présentation de The Hacking Project "
      html_part do
        content_type 'text/html; charset=UTF-8'
         body " Bonjour,</br></br>

          Le developpement du numérique et du digital est incontournable aujourd'hui. <br></br>
          Nous sommes actuellement étudiant au sein d'une grande école numérique:</br></br><strong> The Hacking Project </strong> <br></br>
          Une formation au code informatique, gratuite et sans locaux qui peut préparer à ces métiers d'avenirs. </br></br>
          Nous avions tous des problématiques différentes : trouver un emploi, se reconvertir ou acquerir des compétences professionelles supplémentaires.</br></br>
          Nous vous envoyons ce mail afin que vous puissiez diffuser ce type de formation qui sera accessible à vos concitoyens et leurs permettrons de se former à ces métiers d'avenir.</br></br>
          Si vous désirez plus d'informations, cliquez sur ce lien : <a href='https://the-hacking-project-59.herokuapp.com/home/mairie'> The Hacking Project</a> </br></br>


          Bonne journée."
      end
    end
  end



  def send_email_to_student(contact)
    gmail = Gmail.connect!(@adresse_mail, @mdp)
    gmail.deliver do
      to  contact[:email]
      subject " Présentation de The Hacking Project Student "
      html_part do
        content_type 'text/html; charset=UTF-8'
         body "<h3>Salut à toi jeune padawan ! </h3> </br></br>
         Tu aimes Mr Robot ? </br></br>
         Tu te demandes comment hacker la Banque de France ? </br></br>
         Tu ne sais pas ce qu'est un 'bot' et tu rêves de le savoir ? </br></br>
         Tu voudrais créer ton appli tinder ? </br></br>
         <strong>Voici la solution</strong> => <a href='https://the-hacking-project-59.herokuapp.com/home/mairie'> The Hacking Project</a>"
      end
    end
  end

  def send_email
    @contacts.each do |contact|
      if contact[:status] == "student"
        send_email_to_student(contact)
      else
        send_email_to_townhall(contact)
      end
      sleep(0.5)
    end
  end

  def perform
    send_email
  end

end
