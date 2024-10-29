# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require_relative '../services/api_submission_service'

class DemandesController < ApplicationController
  def index
    @demandes = Demande.all
  end

  def show
    @demande = Demande.find(params[:id])
  end

  def new
    @demande = Demande.new
    @demande.build_bloc_plan_financement
    @demande.build_bloc_materiel
    @demande.build_bloc_dirigeant
  end

  def create
    @demande = Demande.new(demande_params)
    if @demande.save
      redirect_to @demande, notice: 'Demande créée avec succès.'
    else
      render :new
    end
  end

  def edit
    @demande = Demande.find(params[:id])
  end

  def update
    @demande = Demande.find(params[:id])
    byebug
    if @demande.update(demande_params)
      redirect_to @demande, notice: 'Demande mise à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @demande = Demande.find(params[:id])
    @demande.destroy
    redirect_to demandes_url, notice: 'Demande supprimée avec succès.'
  end

  def submit_to_api
    @demande = Demande.find(params[:id])
    result = ApiSubmissionService.new(@demande).call

    if result[:success]
      redirect_to @demande, notice: result[:message]
    else
      redirect_to @demande, alert: result[:message]
    end
  end

  private

  def demande_params
    # Ajoutez cette ligne pour debugger
    puts "Banque params: #{params[:demande][:banque]}"

    params.require(:demande).permit(
      { banque: [] },  # Assurez-vous que c'est bien un tableau
      :media,
      :login_vendeur,
      :reference_demande,
      :duree,
      :montant,
      :nature,
      :numero_siren,
      bloc_plan_financement_attributes: %i[premier_loyer code_amortissement vr],
      bloc_materiel_attributes: %i[code_insee_materiel materiel_occasion annee_materiel
                                code_niveau_utilisation_materiel code_niveau_options_materiel nombre_materiel],
      bloc_dirigeant_attributes: %i[nom_naissance prenom nom_usuel date_naissance]
    )
  end
end
