class DemoController < ApplicationController

  layout false	

  def index
  	
  end
  def hello
	@array = [1,2,3,4,5]
  	@id = params['id'].to_i
	@page = params[:page].to_i
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end
  def other_api
    redirect_to("http://graph.facebook.com/youtube")
  end

end
