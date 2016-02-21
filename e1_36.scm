(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define xx
  (fixed-point(lambda (x) (/ (log 1000.0) (log x))) 3.0))

(define xx-avg
  (fixed-point(lambda (x) (/ (+ x (/ (log 1000.0) (log x))) 2.0)) 3.0))
