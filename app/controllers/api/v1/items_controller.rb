module Api
	module V1
		class ItemsController < ApplicationController
			def index
				items = Item.order('created_at DESC');
				render json: {status: 'SUCCESS', msg: 'Loaded items', data:items}, status: :ok
			end
		end
	end
end