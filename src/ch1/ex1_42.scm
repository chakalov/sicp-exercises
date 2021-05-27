(define (compose f g)
  (lambda (x)
    (f (g x))))

((compose square inc) 6)
(square (inc 6))
(square 7)
49

