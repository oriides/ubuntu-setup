set rtp+=/usr/lib/python3/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set number
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set scrolloff=4
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup