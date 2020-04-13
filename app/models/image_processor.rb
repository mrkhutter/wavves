class ImageProcessor
  def initialize(water)
    @water = water
  end

  def call
    # The ".processed" call will
    # cause the image to be resized
    # and saved to storage
    @water.images.each do |image|
      image.variant(resize: "300x300").processed
    end
  end
end
