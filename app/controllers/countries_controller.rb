class CountriesController < ApplicationController
  
  #GET /countries_list
  #get list of countries from db
  #parameter :- search_text, page_number, page_size
  def countries_list
    @countries_list = Country.where("name LIKE ?", "%#{params[:search_text]}%")
    if @countries_list
      @countries_list_data = @countries_list.paginate(page: params[:page_number] || 1, per_page: params[:page_size] || 20)
      render json: {country: @countries_list_data}
    else
      render json: {country: nil}
    end
  end
  
end