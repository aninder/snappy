ActiveSupport.on_load :active_record do
  ::ActiveRecord::Base.extend Pagination
  Rails.logger.debug "@@@@@@@@@@@active record loading@@@@@@@@@@@@@@@@@@@@"
end
