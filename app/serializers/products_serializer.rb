class ProductsSerializer < ActiveModel::Serializer
  attributes :with_range, :all

  def with_range
    {
      title: object.title,
      url: object.url,
      released: object.released
    }
  end

  def all
    {
      title: object.title,
      url: object.url
    }
  end
end
