(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (is-pos? x )
   (> x (- 1)))
(define (make-rat n d)
  (let ((g (gcd n d))
        (np (if (is-pos? d) n (- n)))
        (dp (if (is-pos? d) d (- d))))
    (cons (/ np g) (/ dp g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(print-rat (make-rat  6  (- 9)))



