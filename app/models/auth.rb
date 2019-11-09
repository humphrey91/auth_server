class Auth

  ALGORITHM = 'HS256'

  def self.issue(payload)
    JWT.encode(
      payload,
      AUTH_SECRET_KEY,
      ALGORITHM)
  end

  def self.decode(token)
    begin
      JWT.decode(token, 
        AUTH_SECRET_KEY, 
        true, 
        { algorithm: ALGORITHM }).first
    rescue
      nil
    end
  end
end