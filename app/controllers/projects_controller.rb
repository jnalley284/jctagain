require "stripe"

class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  layout 'authenticated'

  def index
    @projects = params[:completed] ? current_user.projects.where(complete: params[:completed]) : current_user.projects.all

    respond_to do |format|
      format.html
      format.json { render json: @projects }
    end
  end

  def show
    @project = current_user.projects.where(id: params[:id]).first

    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def new
    # @project = Project.new
    @user = current_user
    @project = current_user.projects.build
    @project_address = @project.build_address
    @user_address = @user.addresses.build

    @project.name = session[:project_name] if session[:project_name]

    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def create
    if params[:user][:addresses_attributes]["0"][:same_as_billing_address]
      params[:user][:projects_attributes]["0"][:address_attributes] = params[:user][:addresses_attributes]["0"]
    end
    
    @user = current_user
    @project = current_user.projects.build(params[:user][:projects_attributes]["0"])
    @project_address = @project.build_address(params[:user][:projects_attributes]["0"][:address_attributes])
    @user_address = @user.addresses.build(params[:user][:addresses_attributes]["0"])

    

    begin
      create_stripe_customer
      # This needs to change
      authorise_payment
      @user.save!
      @project.save!
      AccountWorker.perform_async(@project.id)
      session[:project_name] = nil
      redirect_to dashboard_path, notice: 'Project was successfully created.'
    rescue Stripe::CardError => e
      logger.error e.class
      logger.error e.message
      @project.errors.add :base, e.message
      render action: "new"
    rescue Stripe::APIConnectionError => e
      logger.error e.class
      logger.error e.message
      @project.errors.add :base, "There was a problem with your credit card"
      render action: "new"
    rescue Stripe::StripeError => e
      logger.error e.class
      logger.error e.message
      @project.errors.add :base, "There was a problem with your credit card"
      render action: "new"
    rescue => e
      logger.error e.class
      logger.error e.inspect
      logger.error e.message
      @project.errors.add :base, e.message
      render action: "new"
    end
  end

private
  def create_stripe_customer
    Stripe.api_key = Rails.application.config.stripe_secret_key
    @customer = Stripe::Customer.create(
      email:       current_user.email,
      description: "project-#{@project.id}-#{@project.name}",
      card:        params[:user][:projects_attributes]["0"][:card_token]
    )

    @project.build_payment(stripe_customer_token: @customer[:id])
  end

  def authorise_payment
    Stripe::Charge.create(
      :amount => 500,
      :currency => "usd",
      :customer => @customer[:id],
      :description => "Authorisation for JCT",
      :capture => false
    )
  end
end
