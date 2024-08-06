## How to run this

```sh
rails new sample_app \
  --database=postgresql \
  --asset-pipeline=propshaft \
  --skip-action-mailbox \
  --skip-action-text \
  --skip-active-storage \
  --skip-jbuilder \
  --skip-javascript \
  --skip-hotwire \
  --skip-test \
  --edge \
  -m ~/.dotfiles/tag-ruby/rails_template/template.rb
```
