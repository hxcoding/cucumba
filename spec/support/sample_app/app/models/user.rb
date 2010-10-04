class User < ActiveRecord::Base

  validates_presence_of :name

  def self.method_with_args(name,args={})
    logger.info name
    logger.info args.inspect
  end
end
