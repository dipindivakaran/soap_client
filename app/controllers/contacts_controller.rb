class ContactsController < ApplicationController

 before_filter :init_soap_client

  private
  def init_soap_client
        wsdl_url = "http://localhost:3003/contacts/wsdl"
        @client = Savon::Client.new(wsdl: wsdl_url)
  end


  public
  def index
    @soap_response = @client.call(:get_all_contacts)
    render :json => @soap_response
  end

  def search_name
     @search_result = @client.call(:search_name,message: {name: params[:name]})
     render :json => @search_result
  end

end
