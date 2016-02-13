(define (inc n) (+ n 1))
(define (accumulator combine null-value term a next b)
  (if (> a b) 
    null-value
    (combine (term a)
       (accumulator combine null-value term (next a) next b))))

(define (sum term a next b)
  (accumulator + 0 term a next b))

(define (product term a next b)
  (accumulator * 1 term a next b))

(define (identity x) x)

  
(define (accumulator-iter combine null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combine result (term a)))))
  (iter a null-value))


(define (sum-iter term a next b)
  (accumulator-iter + 0 term a next b))

(define (product-iter term a next b)
  (accumulator-iter * 1 term a next b))
