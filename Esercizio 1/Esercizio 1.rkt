;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define femminile?  ; val: boolean
  (lambda (s)     ; s: stringa
    (let ( (x (string-ref s (- (string-length s) 1))))
    (or (char=? x #\a) (char=? x #\e) )   
      )
    )
)

(define plurale?  ; val: boolean
  (lambda (s)        ; s: stringa
    (let ( (z (string-ref s (- (string-length s) 1))))
    (or (char=? z #\e) (char=? z #\i))
    )
   )  
)

(define articolo
  (lambda (s)
    (let ((f (femminile? s)) (p (plurale? s)))
(cond [(and f p) (string-append "le "  s)]
      [(and f (not p)) (string-append "la "  s)]
      [(and (not f) (not p)) (string-append "il " s)]
      [(and (not f) p) (string-append "i "  s)])
    )))

     
(define are?
  (lambda (s)
      (char=? (string-ref s (- (string-length s) 3)) #\a)
    )
  )

(define ere?
 (lambda (s)
      (char=? (string-ref s (- (string-length s) 3)) #\e)
   )
  )

(define ire?
 (lambda (s)
      (char=? (string-ref s (- (string-length s) 3)) #\i)
   )
  )
    

     
(define verbo
  (lambda (s sost)
(cond [(and (are? s) (plurale? sost)) (string-append (substring s 0(- (string-length s) 3))"ano")]
      [(and (are? s) (not(plurale? sost))) (string-append (substring s 0(- (string-length s) 3))"a")]
      [(and (ere? s) (plurale? sost)) (string-append (substring s 0(- (string-length s) 3))"ono")]
      [(and (ere? s) (not(plurale? sost))) (string-append (substring s 0(- (string-length s) 3))"e")]
      [(and (ire? s) (plurale? sost)) (string-append (substring s 0(- (string-length s) 3))"ono")]
      [(and (ire? s) (not(plurale? sost))) (string-append (substring s 0(- (string-length s) 3))"e")]
      )))

(define frase
  (lambda (s v c)
    (string-append (articolo s) " " (verbo v s) " " (articolo c))
    )
  )

(frase "gatto" "cacciare" "topi")
(frase "mucca" "mangiare" "fieno")
(frase "sorelle" "leggere" "novella")
(frase "bambini" "amare" "favole")
(frase "musicisti" "suonare" "pianoforti")
(frase "cuoco" "friggere" "patate")
(frase "camerieri" "servire" "clienti")
(frase "mamma" "chiamare" "figlie")













