augroup AfterWritingBuffer
	autocmd!
	autocmd BufWritePost * silent! Neomake
augroup END
