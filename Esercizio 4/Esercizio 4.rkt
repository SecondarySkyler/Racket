;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define btr-digit-sum                    ; val:     carattere +/./-
  (lambda (u v c)                        ; u, v, c: caratteri +/./-
    (cond ((char=? u #\-)                ; u v c
           (cond ((char=? v #\-)
                  (cond ((char=? c #\-)  ; - - -
                         #\.)
                        ((char=? c #\.)  ; - - .
                         #\+)
                        ((char=? c #\+)  ; - - +
                         #\-)))
                 ((char=? v #\.)
                  (cond ((char=? c #\-)  ; - . -
                         #\+)
                        ((char=? c #\.)  ; - . .
                         #\-)
                        ((char=? c #\+)  ; - . +
                         #\.)))
                 ((char=? v #\+)         ; - + c
                  c)))
          ((char=? u #\.)
           (cond ((char=? v #\-)
                  (cond ((char=? c #\-)  ; . - -
                         #\+)
                        ((char=? c #\.)  ; . - .
                         #\-)
                        ((char=? c #\+)  ; . - +
                         #\.)))
                 ((char=? v #\.)         ; . . c
                  c)
                 ((char=? v #\+)
                  (cond ((char=? c #\-)  ; . + -
                         #\.)
                        ((char=? c #\.)  ; . + .
                         #\+)
                        ((char=? c #\+)  ; . + +
                         #\-)))))
          ((char=? u #\+)
           (cond ((char=? v #\-)         ; + - c
                  c)
                 ((char=? v #\.)
                  (cond ((char=? c #\-)  ; + . -
                         #\.)
                        ((char=? c #\.)  ; + . .
                         #\+)
                        ((char=? c #\+)  ; + . +
                         #\-)))
                 ((char=? v #\+)
                  (cond ((char=? c #\-)  ; + + -
                         #\+)
                        ((char=? c #\.)  ; + + .
                         #\-)
                        ((char=? c #\+)  ; + + +
                         #\.)))))
          )))

(define btr-carry
  (lambda (d1 d2 r)
    (cond ((char=? d1 #\-)                ; d1 -

           (cond ((char=? d2 #\-)
                  (cond ((char=? r #\-)  
                         #\-)
                        ((char=? r #\.)  
                         #\-)
                        ((char=? r #\+)  
                         #\.)))

                 ((char=? d2 #\.)
                  (cond ((char=? r #\-)  
                         #\-)
                        ((char=? r #\.)  
                         #\.)
                        ((char=? r #\+)  
                         #\.)))

                 ((char=? d2 #\+)
                  (cond ((char=? r #\-) 
                         #\.)
                        ((char=? r #\.)  
                         #\.)
                        ((char=? r #\+)  
                         #\.)))))

          ((char=? d1 #\.)      ; d1 .
                  
           (cond ((char=? d2 #\-)
                  (cond ((char=? r #\-)  
                         #\-)
                        ((char=? r #\.)  
                         #\.)
                        ((char=? r #\+)  
                         #\.)))

                 ((char=? d2 #\.) 
                  (cond ((char=? r #\-)  
                         #\-)
                        ((char=? r #\.)  
                         #\.)
                        ((char=? r #\+)  
                         #\.)))

                 ((char=? d2 #\+)
                  (cond ((char=? r #\-)  
                         #\.)
                        ((char=? r #\.)  
                         #\.)
                        ((char=? r #\+)  
                         #\+)))))

          ((char=? d1 #\+)     ;d1 +           

           (cond ((char=? d2 #\-)
                  (cond ((char=? r #\-)  
                         #\.)
                        ((char=? r #\.)  
                         #\.)
                        ((char=? r #\+)  
                         #\+)))

                 ((char=? d2 #\.)
                  (cond ((char=? r #\-)  
                         #\.)
                        ((char=? r #\.)  
                         #\.)
                        ((char=? r #\+)  
                         #\+)))

                 ((char=? d2 #\+)
                  (cond ((char=? r #\-)  
                         #\.)
                        ((char=? r #\.)  
                         #\+)
                        ((char=? r #\+)  
                         #\+)))))
          )))

(define head
  (lambda (s)
    (if (equal? s "")
        ""
    (substring s 0 (-(string-length s)1))
    )
  ))

(define normalized-btr
  (lambda (s)
    (if (and (char=? (string-ref s 0) #\.) (not (= (string-length s) 1)))
        (normalized-btr (substring s 1))
        s
        )
    ))

(define lsd
  (lambda (s)
    (if (equal? (string-length s) 0)
        #\.
        (string-ref s (-(string-length s)1))
        )
    ))

(define btr-carry-sum
  (lambda (s1 s2 r)
    (if (and (string=? s1 "") (string=? s2 ""))
        (make-string 1 r)
        (string-append (btr-carry-sum (head s1) (head s2) (btr-carry (lsd s1) (lsd s2) r)) (make-string 1 (btr-digit-sum (lsd s1) (lsd s2) r)))
    )
    ))
    

(define btr-sum ;funzione principale
  (lambda (s1 s2)
    (normalized-btr (btr-carry-sum s1 s2 #\.))
    ))
(btr-sum "-+--" "+") ;ok
(btr-sum "-+--" "-") ;ok
(btr-sum "+-.+" "-+.-") ;ok
(btr-sum "-+--+" "-.--");ok
(btr-sum "-+-+." "-.-+");ok
(btr-sum "+-+-." "+.+-") ;ok
    


    
    
