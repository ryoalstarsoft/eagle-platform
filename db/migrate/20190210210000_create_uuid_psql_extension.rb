class CreateUuidPsqlExtension < ActiveRecord::Migration[5.2]
  self.execute <<-EOF
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
  EOF
end
