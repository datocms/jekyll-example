# Jekyll example website

This repository contains a Jekyll website integrated with a DatoCMS site. The site is deployed on Netlify, and can be seen at this URL: https://datocms-jekyll-example.netlify.com/

Content stored in a DatoCMS site gets translated into local Jekyll files using a Ruby gem called `dato` you need to add to your Jekyll project. The translation rules are defined in file placed in your project root folder called [dato.config.rb](https://github.com/datocms/jekyll-example/blob/master/dato.config.rb).

To read more about the `dato` gem, please refer to [its documentation](https://github.com/datocms/ruby-datocms-client/blob/master/docs/dato-cli.md).

## Usage

Click the following button to set up a project on DatoCMS with the schema and data that you need to run this example.

[![Deploy with DatoCMS](https://dashboard.datocms.com/deploy/button.svg)](https://dashboard.datocms.com/deploy?repo=datocms/jekyll-example)


```
# install dependencies
bundle install

# fill the .env file with your API token
echo 'DATO_API_TOKEN=abc123' >> .env

# download latest data from DatoCMS site
bundle exec dato dump

# build Jekyll site
bundle exec jekyll build
```

## Website preview

![Website screenshot](https://raw.githubusercontent.com/datocms/jekyll-example/master/screenshot.png)
