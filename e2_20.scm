(define (parity? x)
  (remainder x 2))

(define (same-parity . numbers)
  (define (sp remaining-numbers cond-parity)
    (cond ((null? remaining-numbers) '())
          ((not (= cond-parity (parity? (car remaining-numbers))))
           (sp (cdr remaining-numbers) cond-parity))
          ((= cond-parity (parity? (car remaining-numbers)))
           (cons (car remaining-numbers)
                 (sp (cdr remaining-numbers) cond-parity)))))
  (sp numbers (parity? (car numbers))))

