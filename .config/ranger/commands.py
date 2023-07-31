from __future__ import (absolute_import, division, print_function)

# You always need to import ranger.api.commands here to get the Command class:
from ranger.ext.img_display import ImageDisplayer, register_image_displayer
from subprocess import Popen, PIPE, run
from os import _exit
import time

@register_image_displayer("chafa")
class ChafaImageDisplayer(ImageDisplayer):
    def draw(self, path, start_x, start_y, width, height):
        run(['chafa', path, '-s', '{}x{}'.format(width, height)])


