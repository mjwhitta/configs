#!/usr/bin/env python

from gimpfu import *

import time

def plugin_main(img, drawable):
    gimp.progress_init("Creating coloring-book page...")
    pdb.gimp_undo_push_group_start(img)

    # Remove colors and reduce size as much as possible
    w = 0
    h = 0
    while ((w != drawable.width) and (h != drawable.height)):
        w = drawable.width
        h = drawable.height
        pdb.gimp_desaturate_full(drawable, 0)
        pdb.plug_in_laplace(img, drawable)
        pdb.gimp_invert(drawable)
        pdb.plug_in_cartoon(img, drawable, 7.0, 0.2)
        pdb.plug_in_autocrop(img, drawable)
        time.sleep(0.5)

    # Get resolution
    wr, hr = pdb.gimp_image_get_resolution(img)

    # If height is larger than width
    if (drawable.height > drawable.width):
        # Scale to 6 inches wide
        s = 6 * wr / drawable.width
        # If height is now too big, scale down
        if (drawable.height * s > 9.5 * hr):
            s = 9.5 * hr / drawable.height
    # If height is smaller than width
    else:
        # Scale to 6 inches high
        s = 6 * hr / drawable.height
        # If width is now too big, scale down
        if (drawable.width * s > 9.5 * wr):
            s = 9.5 * wr / drawable.width

    # Scale to a page size
    pdb.gimp_image_scale(img, drawable.width * s, drawable.height * s)

    # If height is smaller than width
    if (drawable.height < drawable.width):
        # Rotate
        pdb.gimp_image_rotate(img, 0)

    pdb.gimp_undo_push_group_end(img)

register(
    "coloring_book",
    "Creates an image that can be colored like a coloring book",
    "Creates an image that can be colored like a coloring book",
    "Miles Whittaker",
    "Miles Whittaker",
    "2016",
    "<Image>/Image/Make coloring-book...",
    "RGB*, GRAY*",
    [],
    [],
    plugin_main
)

main()
