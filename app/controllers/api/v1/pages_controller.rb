# app/controllers/api/v1/pages_controller.rb
module Api
    module V1
      class PagesController < ApplicationController
        skip_before_action :verify_authenticity_token
        # GET /api/v1/pages
        def index
          pages = Page.all
          render json: pages
        end
  
        # GET /api/v1/pages/:id
        def show
          page = Page.find(params[:id])
          render json: page
        end
  
        # POST /api/v1/pages
        def create
          page = Page.new(page_params)
          puts page_params
          if page.save
            render json: page, status: :created
          else
            render json: page.errors, status: :unprocessable_entity
          end
        end
  
        # PUT /api/v1/pages/:id
        def update
          page = Page.find(params[:id])
          if page.update(page_params)
            render json: page
          else
            render json: page.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/pages/:id
        def destroy
          page = Page.find(params[:id])
          page.destroy
          head :no_content
        end
  
        private
  
        # Strong parameters to allow only permitted attributes
        def page_params
          params.require(:page).permit(:name, :description, :users_id)
        end
      end
    end
  end
  