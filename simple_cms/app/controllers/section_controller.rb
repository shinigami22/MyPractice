class SectionController < ApplicationController
  layout "admin"
  def index
	@section=Section.order(params[:id])
  end

  def create
	@section=Section.new
	if @section.save
		flash[:notice]="Save section"
		redirect_to(:action => 'index')
	else
	
		render('new')
  	end
  end

  def edit
	@section=Section.find(params[:id])
  end

  def new
	@section=Section.new
  end

  def update
	@section=Section.find(params[:id])
 	if @section.update_attributes(section_params)
	flash[:notice]="Successfully Updated"
	redirect_to(:action => 'index')
	else
	render('edit')
	end
  end

  def show
	@section=Section.find(params[:id])
  end

  def delete
	@section=Section.find(params[:id])

  end

  def destroy
	@section=Section.find(params[:id]).destroy
	flash[:notice]="Delted '#{@section.name}' successfully"
	redirect_to(:action=>'index')
  end

	private
	
	def section_params
		params.require(:section).permit(:name, :position, :visible, :content_type, :content)
	end
end
