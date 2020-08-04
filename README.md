# trivial-do

Additional dolist style macros for Common Lisp. Currently provides `doalist`, `dohash`, `dolist*`, `doplist`, `doseq` and `doseq*`.

## doalist

Iterates over the key value pairs of an alist.

```lisp
(doalist (key value alist &optional return-form)
  (format t "key: ~A, value: ~A~%" key value))
```

## dohash

Iterates over the key value pairs of a hash table.

```lisp
(dohash (key value hash-table &optional return-form)
  (format t "key: ~A, value: ~A~%" key value))
```

## dolist*

Iterates over a list with a position variable tracking the current index.

```lisp
(dolist* (position value list &optional return-form)
  (format t "position: ~A, value: ~A~%" position value))
```

## doplist

Iterates over the key value pairs of an plist.

```lisp
(doalist (key value plist &optional return-form)
  (format t "key: ~A, value: ~A~%" key value))
```

## doseq

Iterates over the values of a sequence.

```lisp
(doseq (value sequence &optional return-form)
  (format t "value: ~A~%" position value))
```

## doseq*

Iterates over a sequence with a position variable tracking the current index.

```lisp
(doseq* (position value sequence &optional return-form)
  (format t "position: ~A, value: ~A~%" position value))
```
