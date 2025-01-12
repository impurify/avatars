# TODO

- [ ] Report bug that Github undoes the compression at https://github.com/impurify/avatars/blob/06ed0fa3495c491d208787520c3f2c4c3bb55663/Makefile#L12C8-L12C54 with a filesize increase of \>36% for my avatar.

- [ ] Coerce `zopflipng` to keep PNG’s Adam7 interlacing, and experiment with adding `-interlace PNG` to the `convert` invocations in the Makefile.

	Even if that makes the images slightly larger (as I guess it well may in this case), this type of avatar image is an excellent use case for progressive image loading and rendering.
