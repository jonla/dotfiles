" Snippets

autocmd FileType c,cpp nnoremap <buffer> <leader>sp ma"ayiWostd::cout << "<esc>"apa: " << <esc>"apa << std::endl;<esc>`a
autocmd FileType c,cpp vnoremap <buffer> <leader>sp ma"ayostd::cout << "<esc>"apa: " << <esc>"apa << std::endl;<esc>`a

autocmd FileType python nnoremap <leader>sm maGo<enter><esc>iif __name__ == '__main__':<enter>main()<esc>`a
autocmd FileType python nnoremap <leader>sd maoimport pdb; pdb.set_trace()<esc>`a
autocmd FileType python nnoremap <buffer> <leader>sp ma"ayiWoprint("<esc>"apa: ", <esc>"apa)<esc>`a
autocmd FileType python vnoremap <buffer> <leader>sp ma"ayoprint("<esc>"apa: ", <esc>"apa)<esc>`a
