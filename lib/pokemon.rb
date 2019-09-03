class Pokemon
  attr_accessor :id, :name, :type, :db
  #attr_reader

  def initialize(hash)

    #fix. make hash because keyword arguments are actually passed as a single hash


    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]

  end

  def self.save(name, type, db)

      #update
      hash = { :name => name, :type => type, :db => db }

      sql = <<-SQL
      SELECT * FROM pokemon WHERE name = ? AND type = ?;
      SQL


      row = db.execute(sql, name, type)[0]
      puts row
      puts hash
      hash[:id] = row[0]
      puts hash
      #puts row
      pokemon = self.new(hash)

      pokemon




  end

  def self.find(id)
    sql = "SELECT * FROM pokemon WHERE id = ?;"
    row = DB[:conn].execute(sql, id)[0]
    self.new(row[1])
  end

end
