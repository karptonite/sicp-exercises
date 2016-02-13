(define (inc n) (+ n 1))
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (product-rec term a next b)
  (if (> a b) 
    1
    (* (term a)
       (product-rec term (next a) next b))))

(define (cube n) (* n n n))
(define (identity x) x)
(define (factorial n)
  (product-iter identity 1 inc n))

(define (pi-calc n)
  (define (inc n) (+ n 2.0))
  (define (term n) (/ (* n (inc n)) (* (+ n 1.0) (+ n 1.0))))
  (* 4.0 (product-iter term 2.0 inc (* n 2.0))))


