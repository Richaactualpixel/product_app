class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone_number, :dob, :age, :country_id, :country, :product

  def country
    country = Country.where(id: object.country_id).first
    if country
      return country.name
    else
      return nil
    end
  end

  def product
    product = Product.select(:id, :name, :price, :product_type).where(user_id: object.id)
    if product
      return product
    else
      return nil
    end
  end
end
