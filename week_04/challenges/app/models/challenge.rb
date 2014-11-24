class Challenge < ActiveRecord::Base
	has_many :supporters
	validates :title , { uniqueness: true, presence: true , length: {maximum: 30} }
	validates :description , { presence: true , length: {minimum: 20 } }

	mount_uploader :poster, PosterUploader

	PER_PAGE = 10.0

	def self.paginate(page)
		num_pages = (Challenge.count / PER_PAGE).ceil
		offset = 0
		if page > num_pages
			page = num_pages
		elsif page < 1
			page = 1
		end

		if page
			offset = PER_PAGE * (page-1)
		end
		Challenge.limit(PER_PAGE).offset(offset)
	end

end
