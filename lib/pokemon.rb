class Pokemon
  attr_accessor :id, :name, :type, :db
  #attr_reader

  def initialize(hash)

    #fix. make hash because keyword arguments are actually passed as a single hash
    puts hash
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?;"
    row = db.execute(sql, id)
    hash = {:id => row[0], :name => row[1], :type => row[2],:db => db}
    self.new(hash)
  end

end
