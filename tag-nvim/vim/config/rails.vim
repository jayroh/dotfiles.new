" Rails.vim
augroup rails_shortcuts
  autocmd!

  let g:rails_projections = {
      \ "Gemfile": {
      \   "command": "gem",
      \   "alternate": "Gemfile.lock"
      \ },
      \ ".rubocop.yml": { "command": "rubocop" },
      \ "config/routes.rb": { "command": "routes" },
      \ "spec/factories.rb": { "command": "factories" },
      \ "spec/features/*_spec.rb": { "command": "feature" },
      \ "app/commands/*.rb": {
      \   "command": "command",
      \   "test": "spec/commands/%s_spec.rb"
      \ },
      \ "app/jobs/*_job.rb": {
      \   "command": "job",
      \   "template": "# frozen_string_literal: true\nclass %SJob < ActiveJob::Job\nend",
      \   "test": [
      \     "spec/jobs/%s_job_spec.rb"
      \   ]
      \ },
  \ }

  " custom settings for when Rails files are loaded. For more info:
  " :help rails-autocommands
  autocmd User Rails nnoremap <Leader>m :Emodel<Space>
  autocmd User Rails nnoremap <Leader>v :Eview<Space>
  autocmd User Rails nnoremap <Leader>c :Econtroller<Space>

  " Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
  let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
augroup END
