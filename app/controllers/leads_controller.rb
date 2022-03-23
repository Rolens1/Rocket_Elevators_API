class LeadsController < ApplicationController
  skip_before_action :verify_authenticity_token
    
  
  def new
      @leads = Leads.new(leads_params)
  end
  def create
     
      @fullName = params[:fullName]
      @companyName = params[:companyName]
      @email = params[:email]
      @phone = params[:phone]
      @projectName = params[:projectName]
      @projectDescription= params[:projectDescription]
      @departmentInCharge = params[:departmentInCharge]
      @message = params[:message]

      @leads = Leads.new(fullName: @fullName, companyName: @companyName, email: @email, phone: @phone, projectName: @projectName, projectDescription: @projectDescription, departmentInCharge: @departmentInCharge, message: @message)
      @leads.attachment.attach(params[:attachment])
          if @leads.save
            redirect_to index_path
          end
  end
  def leads_params
      params.require(:leads).permit(:fullName, :companyName, :email, :phone, :projectName, :projectDescription, :departmentInCharge, :message, attachment:[])
  end

  def update

  end
end