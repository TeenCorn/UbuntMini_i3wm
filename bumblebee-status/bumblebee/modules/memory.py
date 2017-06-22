# pylint: disable=C0111,R0903

"""Displays available RAM, total amount of RAM and percentage available.

Parameters:
    * ram.warning : Warning threshold in % of memory used (defaults to 80%)
    * ram.critical: Critical threshold in % of memory used (defaults to 90%)
    * ram.usedonly: Only show the amount of RAM in use.
"""

try:
    import psutil
except ImportError:
    pass

import bumblebee.util
import bumblebee.input
import bumblebee.output
import bumblebee.engine

class Module(bumblebee.engine.Module):
    def __init__(self, engine, config):
        super(Module, self).__init__(engine, config,
            bumblebee.output.Widget(full_text=self.memory_usage)
        )
        self._mem = psutil.virtual_memory()
        engine.input.register_callback(self, button=bumblebee.input.LEFT_MOUSE,
            cmd="gnome-system-monitor")

    def memory_usage(self, widget):
        used = self._mem.total - self._mem.available
        if bool(self.parameter("usedonly", 0)) == 1:
            return bumblebee.util.bytefmt(used)
        return "{}/{} ({:05.02f}%)".format(
            bumblebee.util.bytefmt(used),
            bumblebee.util.bytefmt(self._mem.total),
            self._mem.percent
        )

    def update(self, widgets):
        self._mem = psutil.virtual_memory()

    def state(self, widget):
        if self._mem.percent > float(self.parameter("critical", 90)):
            return "critical"
        if self._mem.percent > float(self.parameter("warning", 80)):
            return "warning"
        return None

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
