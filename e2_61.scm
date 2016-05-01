(define (adjoin-set x set)
  (cond
    ((= x (car set)) set)
    ((> x (car set)) (cons (car set) (adjoin-set x (cdr set))))
    (else
      (cons x set))))
