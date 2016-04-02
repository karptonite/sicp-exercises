(define (last-pair items)
  (if (null? (cdr items))
    items
    (last-pair (cdr items))))

(last-pair (list  2 3 4 19))
