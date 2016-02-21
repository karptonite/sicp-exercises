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
  (define (cont-frac-helper n d k count)
    (if (= k count)
      (/ (n k) (d k))
      (/ (n k) (+ (d k) (cont-frac-helper n d k (+ 1 count))))))
  (cont-frac-helper n d k 0))

(cont-frac-rec (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)
