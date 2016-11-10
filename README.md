# toxcore-vs 

All necessary libs to build static toxcore using Visual Studio 2013/2015

<h4>Differences from the original toxcore</h4>

Current version of toxcore is toktok based, but has some advatages.

Main advantage is *PERSISTEN GROUPCHATS* compatible with current groupchats.

`Tox_Options` has addition `const char *` parameter:<br>
`const char * client_capabilities`<br>
if `client_capabilities` is NULL, toxcore-vs works identically to original one. You can provide non-NULL static string with `TOX_CLIENT_CAPS_SIZE` maximum length, and this string will be sent to another contact whenever the state of the contact becomes online. Other client can read this string with `tox_friend_get_client_caps`. This is way, that clients can identify clients to enable client-scpecific features.

There are some addition api functions in toxcore-vs:<br>
- `const uint8_t *tox_friend_get_client_caps(const Tox *tox, uint32_t friend_number);`<br>
- `void tox_callback_cryptpacket_before_send(Tox *tox, tox_friend_cryptpacket_before_send_cb *callback, void *user_data);`<br>
- `bool tox_friend_send_lossless_packet2(Tox *tox, uint32_t friend_number, const uint8_t *data1, size_t length1, const uint8_t *data2, size_t length2);`<br>

<h4>Build</h4>
1. Install Visual Studio 2013/2015 any desktop version (if not yet)<br />
2. run `build_libs_[2013/2015].cmd` to build 32 bit libs; run `build_libs_2015.cmd 64` to build 64 bit libs<br />

Another way - create solution and add project (*.vcxproj) files, then build from msvs gui

PS. There are yasm.exe in vpx folder - it necessary to build asm files of vpx lib.
If you don't want to run exe from untrusted source, you can download yasm.exe here: http://yasm.tortall.net/Download.html
