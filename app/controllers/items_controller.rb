class ItemsController < InheritedResources::Base
before_action :authenticate_user!, except: [:index, :show]

def create
		@item =current_user.items.new(item_params)
		if @item.save
			redirect_to @item, notice: 'Item was succesfully created'
		else
			render :new
		end	
	 end
protected
	def begin_of_association_chain
		@current_user 
	end
	
  private

    def item_params
      params.require(:item).permit(:title, :url, :text)
    end
end

