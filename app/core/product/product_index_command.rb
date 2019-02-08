class Product::ProductIndexCommand < Rectify::Command
  attr_reader :products, :scope

  def initialize(params)
    start_year = params[:start_year]
    end_year = params[:end_year]
    # two functions in one
    @scope = start_year && end_year ? 'with_range' : 'all'
    device = Device.find_by(os: params[:os], density: params[:density])

    @products = Product
      .available
      .released(start_year, end_year)
      .order(title: :asc)
      .joins("LEFT OUTER JOIN (SELECT images.* FROM images
             WHERE images.device_id = #{device.id} LIMIT 1) images
             ON images.product_id = products.id")
  end

  def call
    # that's a silly mistake i made knowing
    # that p is a Ruby operator :)
    products.map do |p|
      p ::ProductsSerializer.new(p).send(scope)
    end
  end
end
