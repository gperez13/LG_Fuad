module Api
	module V1
		class ItemsController < ApplicationController


			def index
				items = Item.order('created_at DESC');
				render json: {status: 'SUCCESS', msg: 'Loaded items', data:items}, status: :ok
			end

			def show
				item = Item.find(params[:id])
				render json: {status: 'SUCCESS', msg: 'Loaded item', data:item}, status: :ok

			end

			def create
				item = Item.new(item_params)

				if item.save
					render json: {status: 'SUCCESS', msg: 'Saved item', data:item}, status: :ok
				
				else
					render json: {status: 'ERROR', msg: 'Item Not Saved', 
					data:item.errors}, status: :unprocessable_entity
				end
			end

			private

			def item_params
				params.permit(:name, :description, :price)
			end



		end
	end
end