<<<<<<< HEAD
class LeadsController < ApplicationController
  skip_before_action :verify_authenticity_token
    
  
  def new
      @leads = Leads.new(leads_params)
  end

  def create
     
      @fullname = params[:fullname]
      @companyname = params[:companyname]
      @email = params[:email]
      @phone = params[:phone]
      @projectname = params[:projectname]
      @projectdescription= params[:projectdescription]
      @departmentincharge = params[:departmentincharge]
      @message = params[:message]
      @id = params[:id]

      @leads = Leads.new(
        fullname: @fullname, 
        companyname: @companyname, 
        email: @email, phone: @phone, 
        projectname: @projectname, 
        projectdescription: @projectdescription, 
        departmentincharge: @departmentincharge, 
        message: @message,
        customer_id: @id
      )
      @leads.attachment.attach(params[:attachment])
        if @leads.save
          create_customer
          redirect_to dropbox_authorize_path
        end
  end

  def create_customer
    customer = Customer.create!(
      customer_creation_date: Time.current,
      company_name: @companyname,
      full_name_company_contact: @fullname,
      company_contact_phone: @phone,
      email_company: @email,
      company_description: Faker::Company.bs,
      full_name_service_technical_authority: Faker::Name.name.gsub(/\W/, ''),
      technical_authority_phone: Faker::PhoneNumber.phone_number,
      technical_authority_email: Faker::Internet.email.gsub(/\W/, '')
    )
  end

  def leads_params
      params.require(:leads).permit(:fullname, :companyname, :email, :phone, :projectname, :projectdescription, :departmentincharge, :message, attachment:[])
  end

  def update

  end
end
=======
class LeadsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def new
        @leads = Leads.new(leads_params)
    end
    def create
       
        @fullname = params[:fullname]
        @companyname = params[:companyname]
        @email = params[:email]
        @phone = params[:phone]
        @projectname = params[:projectname]
        @projectdescription= params[:projectdescription]
        @departmentincharge = params[:departmentincharge]
        @message = params[:message]
        @question = params[:question]

        @leads = Leads.new(fullname: @fullname, companyname: @companyname, email: @email, phone: @phone, projectname: @projectname, projectdescription: @projectdescription, departmentincharge: @departmentincharge, message: @message, question: @question)
        @leads.attachment.attach(params[:attachment])
            if @leads.save
                redirect_to index_path
            end
    end
    def leads_params
        params.require(:leads).permit(:fullname, :companyname, :email, :phone, :projectname, :projectdescription, :departmentincharge, :message, attachment:[])
      end
end

>>>>>>> 590de5b65d3342aa05b46d9409d458c70ff39ad6
