(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment p q)
  (cons p q))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (define (average x y)
    (/ (+ x y) 2.0))
  (make-point 
    (average (x-point (start-segment s)) (x-point (end-segment s)))
    (average (y-point (start-segment s)) (y-point (end-segment s))))
  )

(print-point (midpoint-segment (make-segment (make-point 1 5) (make-point 10 4))))

