(define (enumerate-interval i j)
  (if (> i j)
    '()
    (cons i (enumerate-interval (+ 1 i) j))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                     new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())

(define (make-position row column)
  (list row column))

(define (get-row position)
  (car position))

(define (get-column position)
  (cadr position))

(define (adjoin-position row column rest-of-queens)
  (cons (make-position row column) rest-of-queens))

(define (get-position-by-column positions k)
  (car (filter (lambda (position)
                 (= k (get-column position)))
               positions)))

(define (positions-not-in-column positions k)
  (filter (lambda (position)
            (not(= k (get-column position))))
          positions))

(define (safe? column-num positions)
  (let ((new-queen (get-position-by-column positions column-num)))
    (accumulate (lambda (old-queen acc)
                  (and acc (queen-is-safe new-queen old-queen)))
                #t
                (positions-not-in-column positions column-num))))


(define (queen-is-safe queen1 queen2)
  (and (queens-in-different-rows queen1 queen2)
       (queens-in-different-diagonals queen1 queen2)))

(define (queens-in-different-rows queen1 queen2)
  (not (= (get-row queen1) (get-row queen2))))

(define (queens-in-different-diagonals queen1 queen2)
  (not (= (abs (- (get-row queen1) (get-row queen2)))
          (abs (- (get-column queen1) (get-column queen2))))))
