class Auth

  ALGORITHM = 'HS256'

  def self.issue(payload)
    JWT.encode(
      payload,
      AUTH_SECRET_KEY,
      ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, 
      AUTH_SECRET_KEY, 
      true, 
      { algorithm: ALGORITHM }).first.with_indifferent_access
  end
end