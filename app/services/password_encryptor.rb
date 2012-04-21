class PasswordEncryptor
  # Return the password hash and salt that must be stored on
  # user's record.
  #
  #   PasswordEncryptor.encrypt("test")
  #   #=> {:hash => "abc...", :salt => "salt123"}
  #
  def self.encrypt(password)
    salt = encryptor.hexdigest(rand.to_s)
    hash = hasher(password, salt)

    {:salt => salt, :hash => hash}
  end

  # Password must the plain text version.
  # Salt must be the salt stored on the user record.
  #
  #   PasswordEncryptor.hasher("test", "salt123")
  #   #=>
  #
  def self.hasher(password, salt)
    encryptor.hexdigest("--#{salt}--#{password}--")
  end

  # Return the encryptor adapter. Must always respond to
  # the +hexdigest+ method.
  #
  def self.encryptor
    Digest::SHA1
  end
end
