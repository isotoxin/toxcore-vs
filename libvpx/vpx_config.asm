%ifdef WIN64
%include "./vpx_config_64.asm"
%else
%include "./vpx_config_32.asm"
%endif
