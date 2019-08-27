# frozen_string_literal: true

module RequestHelpers
  def authenticate(user)
    @authenticated_user = user
  end

  def get(url, options={})
    super(url, authenticated_options(options))
  end

  def post(url, options={})
    super(url, authenticated_options(options))
  end

  def put(url, options={})
    super(url, authenticated_options(options))
  end

  def delete(url, options={})
    super(url, authenticated_options(options))
  end

  def authenticated_options(options={})
    return options if @authenticated_user.blank?

    options[:headers] ||= {}
    options[:headers].merge!('Authorization' => "Bearer #{@authenticated_user.token}")

    options
  end
end