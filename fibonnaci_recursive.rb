def fibRecursive(n)
  if (n == 0)
    return 0
  elsif (n == 1)
    return 1
  else
    return fibRecursive(n-1) + fibRecursive(n-2)
  end
end
