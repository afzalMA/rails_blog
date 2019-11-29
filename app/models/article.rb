class Article < ApplicationRecord
	
	has_many :comments, dependent: :delete_all

	validates :headline, presence: true

	before_save :generate_friendly_id


	# scope :active_articles, -> { where (active: true) }
	# scope :user_active_articles, ->(user_id) > { where (active: true) }

	#write a scopet to get articles form oarticular date to now
	scope :current_date_article, -> { where(created_at:Time.now.beginning_of_day-1.day..Time.now-1.day) }

	#writing a scope in form of methods
	# def self.article_between_date(start_date, end_date)
	# 	where(created_at: Time.parse(start_date).begining_of_day..Time.parse(end_date).end_of_day)
	# end


	private

	def generate_friendly_id
		self.friendly_id = self.headline.downcase.gsub(/\s/,'-')
	end



end
