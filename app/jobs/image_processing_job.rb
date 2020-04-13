class ImageProcessingJob < ApplicationJob
  queue_as :default

  def perform(water_id)
    @water = Water.find(water_id)
    ImageProcessor.new(@water).call
  end
end
