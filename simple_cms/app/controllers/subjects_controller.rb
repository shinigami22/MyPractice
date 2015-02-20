class SubjectsController < ApplicationController
	layout false
  def index
	#using a named scope or customised Query sorted defined in the model: sorted
  	@subjects = Subject.sorted
  end

  def show
	#finds the relevant record according to id
  	@subject=Subject.find(params[:id])
  end

  def edit
     @subject=Subject.find(params[:id])
  end

  def create
	#Instantiate a new object using form parameters
	@subject=Subject.new(subject_params)
	# Save the object
	if @subject.save
	#if save suceeds, redirect to the index action
	redirect_to(:action => 'index')
	else
	#if save fails, redisplay the form so user can fix problems
	render('new')
	end
  end
  def new
  	@subject = Subject.new({:name => "Default"})
  end
  def update
	#existing object using form parameters
	@subject=Subject.find(params[:id])
	# Update the object
	if @subject.update_attributes(subject_params)
	#if update suceeds, redirect to the index action
	redirect_to(:action => 'show', :id =>@subject.id)
	else
	#if update fails, redisplay the form so user can fix problems
	render('edit')
	end  
   end
 	def delete
 		 @subject=Subject.find(params[:id])
 	end

	def destroy
	
		@subject = Subject.find(params[:id]).destroy
		redirect_to(:action => 'index')
	end
	
	#Strong Params are decleared as private for secure accessibilty

	private
	
	def subject_params
	# same as using "params[:subject]", except that it:
	#  - raises an error if : subject is not present
	#   - allows listed attributes to be mass-assigned
		params.require(:subject).permit(:name,:position, :visible)
	end 

end
