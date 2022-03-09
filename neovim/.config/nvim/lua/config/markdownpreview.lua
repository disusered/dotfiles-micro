-- set to 1, nvim will open the preview window after entering the markdown buffer
-- default: 0
G('mkdp_auto_start', 0)

-- set to 1, the nvim will auto close current preview window when change
-- from markdown buffer to another buffer
-- default: 1
G('mkdp_auto_close', 0)

-- set to 1, the vim will refresh markdown when save the buffer or
-- leave from insert mode, default 0 is auto refresh markdown as you edit or
-- move the cursor
-- default: 0
G('mkdp_refresh_slow', 0)

-- set to 1, the MarkdownPreview command can be use for all files,
-- by default it can be use in markdown file
-- default: 0
G('mkdp_command_for_global', 0)

-- set to 1, preview server available to others in your network
-- by default, the server listens on localhost (127.0.0.1)
-- default: 0
G('mkdp_open_to_the_world', 0)

-- use custom IP to open preview page
-- useful when you work in remote vim and preview on local browser
-- more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
-- default empty
G('mkdp_open_ip', '')

-- specify browser to open preview page
-- default: ''
-- function! g:Open_browser(url)
--   silent exe 'silent !open -a --Google Chrome Canary-- ' . a:url
-- endfunction
-- G('mkdp_browser', 'Google Chrome Canary')

-- set to 1, echo preview page url in command line when open preview page
-- default is 0
G('mkdp_echo_preview_url', 0)

-- a custom vim function name to open preview page
-- this function will receive url as param
-- default is empty
G('mkdp_browserfunc', '')

-- preview page title
-- ${name} will be replace with the file name
G('mkdp_page_title', '${name}')
