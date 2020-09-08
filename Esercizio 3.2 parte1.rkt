;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 3.2 parte1|) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss.txt" "installed-teachpacks")) #f)))
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
  (lambda (s)
    (conv-rec s 0 0)
    ))
(define conv-rec
  (lambda (s val c)
    (cond [(string=? s "") val]
          [(or (char=? (string-ref s 0) #\+) (char=? (string-ref s 0) #\-)) (conv-rec (substring s 1) 0 0)]
          [(char=? (string-ref s (- (string-length s) 1)) #\0) (conv-rec (substring s 0 (- (string-length s)1)) (+ val (* 0 (expt 2 c))) (+ c 1))]
          [(char=? (string-ref s (- (string-length s) 1)) #\1) (conv-rec (substring s 0 (- (string-length s)1)) (+ val (* 1 (expt 2 c))) (+ c 1))]
          [(char=? (string-ref s (- (string-length s) 1)) #\.) (conv-rec (substring s 0 (- (string-length s)1)) val c)]
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

(define bin-rep->number ; funzione principale
  (lambda (s)
    (if (isPunto s)
        (* (segno s) (/ (conv s) (expt 2 (posPunto s 0))))
        (* (segno s) (conv s))
        )
    ))


(bin-rep->number "1101")
(bin-rep->number "0")
(bin-rep->number "10110.011")
(bin-rep->number "-0.1101001")