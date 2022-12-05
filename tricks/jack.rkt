(require pict
         pict/balloon
         racket/draw)

(define raw-text
  (cond
    [reply-contents reply-contents]
    [else string-args]))

(define jackfont (make-object font% 20 'decorative 'normal 'bold))

(define (combine-lines listofpicts) ; -> pict
  (apply vl-append listofpicts))

(define (blacktext raw-text) ; -> pict
  (colorize (text (string-replace raw-text "\n" " ") jackfont 20) "black"))

(define (text-to-pict raw-text) ; -> pict
  (combine-lines (map blacktext (string-split raw-text "\n"))))

(define txt (rotate (text-to-pict raw-text) (/ pi 16)))

(define w (pict-width txt))
(define h (pict-height txt))

(define a-pict (jack-o-lantern 71))

(define img-w
  (cond
    [(< w 70) 250]
    [else (+ w 150)]))

(define img-h
  (cond
    [(< h 70) 250]
    [else (+ h 100)]))
;;

((call-trick 'libshowpng #f)
 (pin-balloon (wrap-balloon txt 'sw 5 5)
              (lb-superimpose (blank img-w img-h) a-pict)
              a-pict
              rc-find))
