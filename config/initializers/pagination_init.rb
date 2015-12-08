ActiveSupport.on_load :active_record do
  ::ActiveRecord::Base.extend Pagination

  klasses = [::ActiveRecord::Relation]
  if defined? ::ActiveRecord::Associations::CollectionProxy
    klasses << ::ActiveRecord::Associations::CollectionProxy
  else
    klasses << ::ActiveRecord::Associations::AssociationCollection
  end
  # support pagination on associations and scopes
  klasses.each { |klass| klass.send(:include, Pagination) }

  Rails.logger.debug "@@@@@@@@@@@active record loading@@@@@@@@@@@@@@@@@@@@"
end
