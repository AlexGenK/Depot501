require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  fixtures :products

  setup do
    @sample_book = { title: 'Simple book',
                      author: 'Homer Simpson',
                      description: 'Bla, bla, bla!',
                      image_url: 'blank.jpg',
                      price: 9.99 }
  end

  test "Products attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "Products price must be positive" do
    product = Product.new(@sample_book)

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  test "Image URL must be correct" do
    good = %w{ cover.gif cover.jpg cover.png cover.JPG COVER.Png http://site.my/img/cover.gif }
    bad = %w{ cover cover.doc cover.jpg.1 cover.jpg/one }
    product = Product.new(@sample_book)

    good.each do |sample_image_url|
      product.image_url = sample_image_url
      assert product.valid?, "#{sample_image_url} shouldn't be invalid"
    end

    bad.each do |sample_image_url|
      product.image_url = sample_image_url
      assert product.invalid?, "#{sample_image_url} shouldn't be valid"
    end
  end

  test "product is not valid without a unique title" do
    @sample_book[:title] = products(:heinlein).title
    product = Product.new(@sample_book)
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test "product is not valid with too short description" do
    @sample_book[:description] = 'Too short'
    product = Product.new(@sample_book)
    assert product.invalid?
    assert_equal ["должно быть подлиннее"], product.errors[:description]
  end

end
