module ListingsHelper
	def get_random_image
    image_path_prefix = "app/assets/images/"
    image_files = Dir.glob("#{image_path_prefix}backgrounds/*")
    image_files.sample.split(image_path_prefix)[1]
  end
end
