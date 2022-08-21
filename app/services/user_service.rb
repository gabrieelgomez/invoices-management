class UserService
  attr_accessor :name, :rfc, :type

  def initialize(user:, type:)
    @name = user['name']
    @rfc = user['rfc']
    @type = type
  end

  def call
    user(type:)
  end

  def user(type:)
    User.find_or_initialize_by(rfc:, type:).tap do |user|
      user.name = name
      user.email = FFaker::Internet.email(name.parameterize)
      user.save(validate: false)
    end
  end
end
