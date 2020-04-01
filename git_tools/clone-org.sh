for ACC in `cat csvfile`

func_printrange()
{
  for n in $(eval echo {$ACC}); do
    echo $n
  done
}

func_printrange
