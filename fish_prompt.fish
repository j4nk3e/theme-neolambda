function fish_prompt

  # Cache exit status
  set -l last_status $status

  # Set color for variables in prompt
  set -l normal (set_color normal)
  set -l white (set_color FFFFFF)
  set -l turquoise (set_color 5fdfff)
  set -l orange (set_color df5f00)
  set -l hotpink (set_color df005f)
  set -l blue (set_color blue)
  set -l limegreen (set_color 87ff00)
  set -l purple (set_color af5fff)
  set -l red (set_color e70e0e)

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color 5fdfff
  set -g __fish_git_prompt_color_flags df5f00
  set -g __fish_git_prompt_color_prefix white
  set -g __fish_git_prompt_color_suffix white
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true 

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    if [ (id -u) -eq 0 ]
      set -g __fish_prompt_char (set_color red)'λ'(set_color normal)
    else  
      set -g __fish_prompt_char 'λ'
    end
  end
  
  # change `at` to `ssh` when an interactive ssh session is present
  if [ "$SSH_TTY" = "" ]
    set -g location at
  else
    if [ "$TERM" = "xterm-256color-italic" -o "$TERM" = "tmux-256color" ]
      set -g location "\e[3m ssh \e[23m"
    else
      set -g location ssh
    end
  end

  if [ (id -u) -eq 0 ]
    # Line 1 -- Superuser
    echo -n $red'╭─'$hotpink$USER $red$location $orange$__fish_prompt_hostname$red' in '$limegreen(pwd)$turquoise
    __fish_git_prompt " (%s)"
    echo
    # Line 2 -- Superuser
    echo -n $red'╰'
    echo -n $red'─'$__fish_prompt_char $normal
  else # check - everyone else
    # Line 1
    echo -n $white'╭─'$hotpink$USER $white$location $orange$__fish_prompt_hostname$white' in '$limegreen(pwd)$turquoise
    __fish_git_prompt " (%s)"
    echo
    # Line 2
    echo -n $white'╰'
    echo -n $white'─'$__fish_prompt_char $normal
  end
  
  # NOTE: disable `VIRTUAL_ENV_DISABLE_PROMPT` in `config.fish`
  # see:  https://virtualenv.pypa.io/en/latest/reference/#envvar-VIRTUAL_ENV_DISABLE_PROMPT
  # support for virtual env name
  if set -q VIRTUAL_ENV
      echo -n "($turquoise"(basename "$VIRTUAL_ENV")"$white)"
  end
end

