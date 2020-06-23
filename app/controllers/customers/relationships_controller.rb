class Customers::RelationshipsController < ApplicationController

	def follow
	 current_customer.follow(params[:id])
	 redirect_back(fallback_location: root_path)
	end

	def unfollow
	 current_customer.unfollow(params[:id])
	 redirect_back(fallback_location: root_path)
	end

	def create
	 @customer = Customer.find(params[:relationship][:following_id])
	 current_customer.follow!(@customer)
	 redirect_to @customer
	end

	def destroy
	 @customer = Relationship.find(params[:id]).following
	 current_customer.unfollow!(@customer)
	 redirect_to @customer
	end

  def followers
   @customer = Customer.find(params[:customer_id])
   @customers = @customer.follower_customer
  end

  def follows
   @customer = Customer.find(params[:customer_id])
   @customers = @customer.following_customer
  end

  private
  def create_params
  	params.permit(:following_id).merge(follower_id: current_customer.id)
  end
end

