; calculates fibonacci terms until a single term exceeds an indicated (maxTerm)
(defun fibUnderX (maxTerm &optional (n (list 0)) (a 1) (b 1))
  (if (< (car (last n)) maxTerm)
    (fibUnderX maxTerm (append n (list a)) b (+ a b)); continue if under (maxTerm)
    (butlast n))); return the list of all terms less than (maxTerm)

; given a list of numbers, returns a list containing all even terms
(defun getEvens (numbers)
  (loop for x in numbers
	if (= (mod x 2) 0) collect x))

; returns the sum of a list
(defun sumList (numbers)
  (if (null numbers) 0 
    (+ (car numbers) (sumList (cdr numbers)))))

(defun main ()
  (setq
    fib<4mil (fibUnderX 4000000); calculate all fibonacci terms less than 4,000,000
    evenFib<4mil (getEvens fib<4mil); determine all the even terms
    sumEvenFib<4mil (sumList evenFib<4mil)); sum together the even terms
  (format t "
	  ~%List of all fibonacci terms less than 4,000,000: ~%~D
	  ~%List of all even fibonacci terms less than 4,000,000: ~%~D
	  ~%Sum of all even fibonacci terms less than 4,000,000: ~%~D"
	  fib<4mil evenfib<4mil sumEvenFib<4mil)); user-friendly output

(main)
