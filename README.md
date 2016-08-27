# Jekyll example website

This repository contains a Jekyll website integrated with a DatoCMS site. The site is deployed on Netlify, and can be seen at this URL: https://datocms-jekyll-example.netlify.com/

Content stored in a DatoCMS site gets translated into local Jekyll files using a Ruby gem called `dato` you need to add to your Jekyll project. The translation rules are defined in file placed in your project root folder called [dato.config.rb](https://github.com/datocms/jekyll-example/blob/master/dato.config.rb).

To read more about the `dato` gem, please refer to [its documentation](https://github.com/datocms/ruby-datocms-client/blob/master/docs/dato-cli.md).

## Usage

```
# install dependencies
bundle install

# download latest data from DatoCMS site
bundle exec dato dump --token=6d71de8571ec5a8d925c83b4a5087813db3242233d187758b6

# build Jekyll site
bundle exec jekyll build
```
