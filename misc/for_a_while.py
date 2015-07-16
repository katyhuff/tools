from contextlib import contextmanager
from timeit import default_timer
import time

@contextmanager
def elapsed_timer():
    start = default_timer()
    elapser = lambda: default_timer() - start
    yield lambda: elapser()
    end = default_timer()
    elapser = lambda: end-start


with elapsed_timer() as elapsed:
    i = 0
    while i < 5 :
      time.sleep(i)
      i += 1

print( "all done at %.2f seconds" % elapsed() )
