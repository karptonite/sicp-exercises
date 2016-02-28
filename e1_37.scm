(define (cont-frac n d k)
  (define (cont-frac-helper n d k carry)
    (let ((next (/ (n k) (+ (d k) carry))))
      (if (= k 1)
        next
        (cont-frac-helper n d (- k 1) next))))
  (cont-frac-helper n d k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)

(define (cont-frac-rec n d k)
  (define (cont-frac-helper n d k i)
    (if (= k i)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (cont-frac-helper n d k (+ 1 i))))))
  (cont-frac-helper n d k 1))

(cont-frac-rec (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)

(define e-minus-2 
  (cont-frac-rec (lambda (i) 1.0)
             (lambda (i)
               (if (= (remainder (+ i 1) 3) 0) 
                 (* 2.0 (/ (+ i 1.0) 3.0))
                 1.0))
             50))

(define (tan-cf x k)
  (cont-frac-rec (lambda (i)
               (if (= i 1) x
                 (- (* x x))))
             (lambda (i) (- (* i 2.0) 1))
             k))

