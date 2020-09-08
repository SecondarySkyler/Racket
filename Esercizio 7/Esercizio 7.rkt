;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define belong?
  (lambda (x s)
    (if (null? s) ;check lista vuota, se lista vuota => allora x non appartiene
        #false
        (if (= (car s) x) ; check per appartenenza
            #true
            (belong? x (cdr s))
            )
        )
    ))

(define position
 (lambda (x s)
   (if (= (car s) x)
       0
       (+(position x (cdr s))1)
       )
   ))
   
(define sorted-ins
  (lambda (x s)
    (if (null? s) ; check lista vuota
        (cons x s)
        (if (belong? x s) ; check appartenenza
            s
            (if (< x (car s)) ;sorting
                (cons x s)
                (cons (car s)(sorted-ins x (cdr s)))
                )
            )
        )
        ))


(define sorted-list
  (lambda (s)
    (let ( (x (car s)) (y (car (cdr s))) (smallest (find-smallest s)) )
    (cond [(null? (cdr (cdr s)))
           (if (< x y)
               s
               (cons y (cons x '() ))
               )]
          [(< x y) (cons smallest (sorted-list (drop-smallest smallest s)))]
          [(> x y) (sorted-list (cons y (cons x (cdr (cdr s))))) ]
        )
      )
    ))

(define drop-smallest
  (lambda (x s)
    (if (= x (car s))
        (cdr s)
        (cons (car s) (drop-smallest x (cdr s)))
        )))
    
(define find-smallest
  (lambda (s)
    (cond [(null? (cdr s)) (car s)]
          [(< (car s) (car (cdr s))) (find-smallest (cons (car s) (cdr (cdr s)))) ]
          [(> (car s) (car (cdr s))) (find-smallest (cons (car (cdr s)) (cons (car s) (cdr (cdr s)))))]
          )
    ))

(belong? 18 '() )
(belong? 18 '(5 7 10 18 23) )
(belong? 18 '(5 7 10 12 23) )

(position 7 '(7 8 24 35 41) )
(position 35 '(7 8 24 35 41) )
(position 41 '(7 8 24 35 41) )

(sorted-ins 24 '() )
(sorted-ins 5 '(7 8 24 35 41) )
(sorted-ins 24 '(7 8 24 35 41) )
(sorted-ins 27 '(7 8 24 35 41) )

(sorted-list '(35 8 41 24 7))
