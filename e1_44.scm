;haven't been able to test this code.
(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3)))


(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f times)
  (if (= 1 times)
    f
    (compose f (repeated f (- times 1)))))

(define (nsmooth f n)
  (repeated smooth n))


