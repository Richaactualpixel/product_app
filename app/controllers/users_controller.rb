class UsersController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  #post/ create_user
  #Create a user 
  def create
    user = User.new(first_name: params['first_name'],last_name: params['last_name'],age: params['age'],dob: params['dob'],email: params['email'],phone_number: params['phone_number'],country_id: params['country_id'])

    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #GET /user_list
  #Get list of users with products
  #parameter :- search_text, page_number, page_size
  def index
    query = "%#{params[:search_text]}%"
    
    @user = User.where("first_name LIKE ? OR last_name LIKE ? OR age LIKE ? OR email LIKE ? OR phone_number LIKE ?", query, query, query, query, query)

    if @user
      @user_data = @user.paginate(page: params[:page_number] || 1, per_page: params[:page_size] || 20)

      render json: @user_data, each_serializer: UserSerializer
    else
      render json: {users: nil}
    end
  end

end
