syntax match ButanoLog /\<BN_LOG\>/
syntax match ButanoAssert /\<BN_ASSERT\>/
syntax match ButanoError /\<BN_ERROR\>/

highlight ButanoLog ctermbg=green cterm=bold,italic
highlight ButanoAssert ctermbg=yellow cterm=bold,italic 
highlight ButanoError ctermbg=red cterm=bold,italic

