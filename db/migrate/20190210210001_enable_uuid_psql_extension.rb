class EnableUuidPsqlExtension < ActiveRecord::Migration[5.2]
  def change
    def self.up
      enable_extension "uuid-ossp"
    end

    def self.down
      disable_extension "uuid-ossp"
    end
  end
end
