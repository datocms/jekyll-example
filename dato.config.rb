directory "_data/" do
  create_data_file "homepage.yml", :yaml,
    site_name: dato.homepage.site_name,
    tag_line: dato.homepage.tag_line,
    description: dato.homepage.description
end

directory "_seasons" do
  dato.seasons.each do |season|
    create_post "#{season.slug}.md" do
      frontmatter :yaml,
        title: season.name,
        image_url: season.image.file.width(400).to_url,
        thumbnail_url: season.image.file.height(300).to_url,
        bg_url: season.image.file.width(5).to_url,
        weight: season.position

      content season.overview
    end
  end
end

directory "_episodes" do
  dato.episodes.sort_by { |e| [e.season.id.to_i, e.episode_number] }.each_with_index do |episode, i|
    create_post "#{episode.slug}.md" do
      frontmatter :yaml,
        title: episode.title,
        episode_number: episode.episode_number,
        palette_url: episode.image && episode.image.file.auto("enhance").palette("json").to_url,
        image_url: episode.image && episode.image.file.width(500).to_url,
        thumbnail_url: episode.image && episode.image.file.width(500).height(280).fit("crop").auto("enhance").format(:jpg).to_url,
        date: episode.first_aired.to_s,
        weight: i,
        rating: episode.rating,
        director: episode.director,
        category: episode.season.name

      content episode.description
    end
  end
end

directory "_characters" do
  dato.characters.each do |character|
    create_post "#{character.slug}.md" do
      frontmatter :yaml,
        title: character.name,
        actor_name: character.actor_name,
        episodes: character.episode,
        weight: character.position,
        thumbnail_url: character.image.file.fit('crop').crop('faces').width(200).height(200).to_url,
        image_url: character.image.file.width(500).format(:jpg).to_url

      content character.description
    end
  end
end
