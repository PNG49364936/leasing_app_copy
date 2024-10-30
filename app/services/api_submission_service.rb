# frozen_string_literal: true

# app/services/api_submission_service.rb
require 'net/http'
require 'uri'
require 'json'
require 'base64'

  class ApiSubmissionService
    def initialize(demande)
      @demande = demande
      @username = 'FWSBAIL'
      @password = 'PKsw_2,xdPV'
      @api_url = 'https://www-homo.flashlease.com/ws_acq/services/acquerirDemande' # URL complète de l'API
    end

    def call
			# case @demande.banque
			# when 'franfinance'
			# 	call_franfinance_api
			# when 'grenke'
			# 	call_grenke_api
			# end

      url = URI.parse('https://www-homo.flashlease.com/ws_acq/services/acquerirDemande')
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      # Pour debug
      puts "URL: #{@api_url}"
      puts "Host: #{url.host}"
      puts "Port: #{url.port}"
      puts "Full URL: #{url}"
      puts "Path: #{url.request_uri}"

      request = Net::HTTP::Post.new(url.path)
      request['Content-Type'] = 'application/json'
      request['Authorization'] = "Basic #{basic_auth_token}"
     
      request.body = payload.to_json

      # Pour debug
      puts "Request headers: #{request.to_hash}"
      puts "Request body: #{request.body}"

      response = http.request(request)
      puts "Response code: #{response.code}"
      puts "Response body: #{response.body}"

			response_data = JSON.parse(response.body)

      byebug

      if response.code.to_i == 201
				# Sauvegarder la réponse
				@demande.create_demande_response(
					numero_demande: response_data["numeroDemande"],
					message: response_data["message"],
					code: response_data["code"]
				)
				{ success: true, message: response_data["message"] }
      else
        @demande.create_demande_response(message: JSON.parse(response.body)["message"])
				{ success: false, message: "Erreur : #{response.body}" }
			end
    rescue StandardError => e
      puts "Error: #{e.class} - #{e.message}"
      { success: false, message: "Erreur de connexion: #{e.message}" }
    end

    private

    def basic_auth_token
      Base64.strict_encode64("#{@username}:#{@password}")
    end

    def payload
      {
        'media' => @demande.media || 'WSFL',
        'loginVendeur' => 'FWSBAIL',
        'referenceDemande' => @demande.reference_demande,
        'demande' => {
          'duree' => (@demande.duree_value.present? ? @demande.duree_en_mois.to_s : '26'), # valeur par défaut si nil
          'montant' => @demande.montant || '5000', # valeur par défaut si nil
          'nature' => 'LF',
          'numeroSiren' => @demande.numero_siren || '326300167', # valeur par défaut si nil
          'blocPlanFinancement' => {
            'premierLoyer' => @demande.bloc_plan_financement&.premier_loyer || '15',
            'codeAmortissement' => @demande.bloc_plan_financement&.code_amortissement || 'L',
            'vr' => @demande.bloc_plan_financement&.vr || '10'
          },
          'blocMateriel' => {
            'codeInseeMateriel' => @demande.bloc_materiel&.code_insee_materiel || '361212',
            'materielOccasion' => (@demande.bloc_materiel&.materiel_occasion || true).to_s,
            'anneeMateriel' => @demande.bloc_materiel&.annee_materiel || '2010',
            'codeNiveauUtilisationMateriel' => 'NEU',
            'codeNiveauOptionsMateriel' => 'NEU',
            'nombreMateriel' => (@demande.bloc_materiel&.nombre_materiel || 1).to_s
          },
          'blocDirigeant' => {
            'nomNaissance' => (@demande.bloc_dirigeant&.nom_naissance || 'GAUTHIER').upcase,
            'prenom' => @demande.bloc_dirigeant&.prenom || 'Inaki',
            'nomUsuel' => (@demande.bloc_dirigeant&.nom_usuel || 'GAUTHIER').upcase,
            'dateNaissance' => (@demande.bloc_dirigeant&.date_naissance || Date.new(1992, 7, 15)).strftime('%d/%m/%Y')
          }
        }
      }
    end
  end
