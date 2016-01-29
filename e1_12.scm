(define (pascal row position)
  (cond ((or (= position 1) (= position row)) 1)
        (else (+ (pascal (- row 1) position)
                 (pascal (- row 1) (- position 1))))))
