class RecipeService

  def recipes
    begin
      client.entries(content_type: 'recipe')
    rescue StandardError => error
      puts error
    end
  end

  def recipe(id)
    begin
      client.entries('sys.id[in]' => id).last
    rescue StandardError => error
      puts error
    end
  end

  private
  def client
    Contentful::Client.new(
        access_token: ENV['ACCESS_TOKEN'],
        space: ENV['SPACE_ID'],
        dynamic_entries: :auto,
        raise_for_empty_fields: false
    )
  end
end