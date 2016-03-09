(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f times)
  (if (= 1 times)
    f
    (compose f (repeated f (- times 1)))))

(define (square x) (* x x))
