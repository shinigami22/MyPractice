class PagesController < ApplicationController
	layout "admin"
  def index
  	@pages=Page.order(params[:id])
  end

  def create
	@pages=Page.new(pages_params)
	if @pages.save
	flash[:notice]="Page created"
	redirect_to(:action => 'index')
	else
	render('new')
	end
  end

  def edit
	@pages=Page.find(params[:id])
  end

  def new
	@pages=Page.new(:name => "Page name")
  end

  def update
	   @pages=Page.find(params[:id])
        if @pages.update_attributes(pages_params)
        flash[:notice]="Page updated"
        redirect_to(:action => 'index')
        else
        render('edit')
        end

  end

  def show
	@pages=Page.find (params[:id])
  end

  def delete
	@pages=Page.find(params[:id])
  end

  def destroy
	@pages=Page.find(params[:id]).destroy
	flash[:notice]= "Page '#{@pages.name}' has been deleted"
	redirect_to(:action => 'index')
  end

	private

        def pages_params
        # same as using "params[:subject]", except that it:
        #  - raises an error if : subject is not present
        #   - allows listed attributes to be mass-assigned
                                       params.require(:pages).permit(:name,:position, :visible, :subject_id, :permalink)
        end
        

end
