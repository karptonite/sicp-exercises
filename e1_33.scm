(define (inc n) (+ n 1))
(define (filtered-accumulate filter? combine null-value term a next b)
  (cond ((> a b) null-value)
        ((filter? a)
         (filtered-accumulate filter? combine null-value term (next a) next b))
        (else
         (combine (term a)
           (filtered-accumulate filter? combine null-value term (next a) next b)))))

(define (filtered-sum filter? term a next b)
  (filtered-accumulate filter? + 0 term a next b))

(define (identity x) x)

(define (even? n)
  (= (remainder n 2) 0))
