class DbFixing
  # -----------------------------------------------------------------------------------------------------------
  # ordered_models = ["Party", "Profile", "User", "Product", "InventoryItem", "Sale", "Transaction", "Client"]
  # get_db ordered_models
  # -----------------------------------------------------------------------------------------------------------
  def get_db (ordered_models, file_name)
    Rails.application.eager_load!
    models = ordered_models || ActiveRecord::Base.subclasses.map(&:name)

    File.open("#{Rails.root}/app/raton-sales-system/usecases/db_fixing/#{file_name}.json","w") do |f|
      models.each do |model|
        data = model.constantize.all

        f.puts(model)

        data.each do |object|
            f.puts(object.to_json.gsub('null', 'nil'))
        end
        f.puts('###')
      end
    end 
  end

  def post_db (file_name)
    text = File.open("#{Rails.root}/app/raton-sales-system/usecases/db_fixing/#{file_name}.json").read

    replacements = [ ["\n", ""], ["nil", "null"] ]

    db = []
    h = {model: nil, data: []}
    model = true
    text.each_line do |line|
      replacements.each {|replacement| line.gsub!(replacement[0], replacement[1])}
      if model == true
        h[:model] = line
        model = false
      else
        if line == "###"
          model = true
          db << h
          h = {model: nil, data: []}
        else
          h[:data] << line
        end
      end
    end

    db.each do |data|
      model = data[:model].constantize
      data[:data].each do |object|
        object = JSON.parse object
        model.create(object)
      end
    end
  end
end