local tym = require('tym')

tym.set_config({
  shell = os.getenv('SHELL'),
  title = 'Terminal',
  font = 'Hack 12',
  --  cursor_blink = 'on',
  cjk_width = 'narrow',
})

tym.set_keymaps({
  ['<Ctrl><Shift>r'] = function()
    tym.reload()
    tym.notify('reload config')
  end,
})
