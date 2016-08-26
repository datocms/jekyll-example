directory "_data/" do
  create_data_file "home.yml", :yaml,
    site_name: dato.homepage.site_name,
    tag_line: dato.homepage.tag_line,
    description: dato.homepage.description
end


directory "_seasons" do
  dato.seasons.each do |season|
    create_post "#{season.slug}.md" do
      frontmatter :yaml,
        title: season.name,
        imageurl: season.image.file.to_url,
        weight: season.position

      content season.overview
    end
  end
end

directory "_episodes" do
  dato.episodes.each do |episode|
    create_post "#{episode.slug}.md" do
      frontmatter :yaml,
        title: episode.title,
        episodenumber: episode.episode_number,
        imageurl: episode.image && episode.image.file.to_url,
        date: episode.first_aired.to_s,
        rating: episode.rating,
        season: [episode.season.name]

      content episode.description
    end
  end
end

directory "_characters" do
  dato.characters.each do |character|
    create_post "#{character.slug}.md" do
      frontmatter :yaml,
        title: character.name,
        actorname: character.actor_name,
        imageurl: character.image && character.image.file.to_url,
        weight: character.position

      content character.description
    end
  end
end