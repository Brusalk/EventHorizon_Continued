require 'yaml'

# Since we use encrypted Travis ENV vars, this lets us abstract away dev/production differences
# We pull either from ENV, or we look it up in `.travis_env.yml` (not committed)
class TravisEnv

  def self.reload
    begin
      dev_env = YAML.load_file(".travis_env.yml")
    rescue Errno::ENOENT
      dev_env = {}
    end

    dev_env.each do |key, value|
      ENV[key] = value
    end
  end

end