# app/controllers/api/v1/comments_controller.rb
module Api
    module V1
      class CommentsController < ApplicationController
        skip_before_action :verify_authenticity_token
  
        # GET /api/v1/comments
        def index
          comments = Comment.all
          render json: comments
        end
  
        # GET /api/v1/comments/:id
        def show
          comment = Comment.find(params[:id])
          render json: comment
        end
  
        # POST /api/v1/comments
        def create
          comment = Comment.new(comment_params)
          puts comment_params
          if comment.save
            render json: comment, status: :created
          else
            render json: comment.errors, status: :unprocessable_entity
          end
        end
  
        # PUT /api/v1/comments/:id
        def update
          comment = Comment.find(params[:id])
          if comment.update(comment_params)
            render json: comment
          else
            render json: comment.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/comments/:id
        def destroy
          comment = Comment.find(params[:id])
          comment.destroy
          head :no_content
        end
  
        private
  
        # Strong parameters to allow only permitted attributes
        def comment_params
          params.require(:comment).permit(:text, :user_id, :page_id)
        end
      end
    end
  end