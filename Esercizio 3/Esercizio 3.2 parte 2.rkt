;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 3.2 parte 2|) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss.txt" "installed-teachpacks")) #f)))
(define isPunto ; indica la presenza del '.' nella stringa
  (lambda (s)
    (if (> (searchPunto s 0 0) 0)
        #t
        #f
        )
    ))
(define searchPunto ; boolean 0 = no punto   1 = si punto
  (lambda (s c val)
    (cond [(= (string-length s) c) val]
          [(char=? (string-ref s c) #\.) (+ val 1)]
          [else (searchPunto s (+ c 1) val)]
          )
    ))

(define conv
  (lambda (a s)
    (conv-rec a s 0 0)
    ))

(define conv-rec
  (lambda (a s val c)
    (cond [(string=? s "") val]
          [(or (char=? (string-ref s 0) #\+) (char=? (string-ref s 0) #\-)) (conv-rec a (substring s 1) 0 0)]
          [(char=? (string-ref s (- (string-length s) 1)) #\.) (conv-rec a (substring s 0 (- (string-length s) 1)) val c)]
          [else (conv-rec a (substring s 0 (- (string-length s) 1)) (+ val (* (pos-let a s 0) (expt (string-length a) c))) (+ c 1))]
          )
    ))

(define posPunto ; torna la posizione partendo da destra
  (lambda (s c)
    (let ((l (- (string-length s) 1)))
      (cond [(= l c) c]
            [(char=? (string-ref s (- l c)) #\.) c]
            [else (posPunto s (+ c 1))]
            )
      )
    ))

(define segno
  (lambda (s)
    (if (char=? (string-ref s 0) #\-)
        -1
        1
        )
    ))

(define lsb ; torna il bit meno significativo della stringa da convertire
  (lambda (s)
    (string-ref s (- (string-length s) 1))
    ))

(define pos-let ; torna la posizione (intero) di lsb all'interno dell'alfabeto (a)
  (lambda (a s c)
    (cond [(= (string-length a) c) c]
          [(char=? (string-ref a c) (lsb s)) c]
          [else (pos-let a s (+ c 1))]
          )
    ))



(define rep->number
  (lambda (a s)
    (if (isPunto s)
        (* (segno s) (/ (conv a s) (expt (string-length a) (posPunto s 0))))
        (* (segno s) (conv a s))
        )
    ))

(rep->number "zu" "-uuzz")
(rep->number "0123" "+21.1")
(rep->number "01234" "-10.02")
(rep->number "0123456789ABCDEF" "0.A")
(rep->number "0123456789ABCDEF" "1CF.0")

