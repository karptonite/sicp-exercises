(define zero 
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(lambda(f) (lambda(x) (f ((zero f) x))))

(lambda(f) (lambda(x) (f (((lambda (g) (lambda (y) y)) f) x))))

; one
(lambda(f) (lambda(x) (f x)))

(lambda(f) (lambda(x) (f ((one f) x))))
(lambda(f) (lambda(x) (f (((lambda(g) (lambda(y) (g y))) f) x))))
(lambda(f) (lambda(x) (f ((lambda(y) (f y)) x))))

; two
(lambda(f) (lambda(x) (f (f x))))

; add
(define (add n m)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))


