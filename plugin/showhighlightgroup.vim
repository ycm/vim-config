vim9script
def ShowHighlightGroupRecursive()
  var synID = synID(line('.'), col('.'), 1)
  var group = synIDattr(synID, 'name')
  var trans_group = synIDattr(synIDtrans(synID), 'name')

  echo "Highlight Group: " .. group
  if group != trans_group
    echo " -> Linked to: " .. trans_group
    while group != trans_group
      group = trans_group
      trans_group = synIDattr(synIDtrans(hlID(group)), 'name')
      if group == trans_group
        break
      endif
      echo " -> Linked to: " .. trans_group
    endwhile
  endif
enddef

command! ShowHighlightGroup call ShowHighlightGroupRecursive()
