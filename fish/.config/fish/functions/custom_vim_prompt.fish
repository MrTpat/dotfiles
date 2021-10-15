function fish_mode_prompt
  set_color --bold
  switch $fish_bind_mode
    case default
      echo 'NORMAL '
    case insert
      echo 'INSERT '
    case replace_one
      echo 'REPLACE '
    case visual
      echo 'VISUAL '
    case '*'
      echo '? '
  end
  set_color normal
end

