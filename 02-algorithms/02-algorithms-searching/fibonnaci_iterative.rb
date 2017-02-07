def fibIterative(n)
  fib_0 = 0
  fib_1 = 1

  n.times do
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_1
  end

  return fib_0
end
