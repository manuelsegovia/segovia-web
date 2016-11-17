class ItemsController < InheritedResources::Base
before_action :authenticate_user!, except: [:index, :show]


protected
	def begin_of_association_chain
		current_user 
	end
	

  private

    def item_params
      params.require(:item).permit(:title, :url, :text)
    end
end

