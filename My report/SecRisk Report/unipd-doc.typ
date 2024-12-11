

#let notes() = doc => {
  set text(font: "New Computer Modern")
  doc
}

#let unipd-doc(title: none, subtitle: none, author: none, date: none, bibliography-file: "bibliography.bib") = doc => {

  let unipd-red = rgb(180, 27, 33)

  set page(header: [
  _NIST CSF Assessment Report: Acme Healthcare Systems_
  #h(1fr)
], footer: [
  _Gabriel Rovesti_
  #h(1fr)
  #counter(page).display(
    "1/1",
    both: true,
  )
   
])

  set list(marker: ([•], [◦], [--]))
  set heading(numbering: "1.1.")
  show heading.where(level: 1): it => {
    set text(fill: unipd-red)
    it
  }

  align(center, {
    v(10em)
    figure(image("images/unipd-logo.png", width: 40%))
    v(3em)

    text(size: 18pt, weight: "bold", fill: unipd-red, smallcaps(title))
    v(5pt)
    text(size: 15pt, weight: "bold", fill: unipd-red, subtitle)
    parbreak()

    set text(size: 15pt)
    author
    parbreak()

    date
    pagebreak()
  })

  show outline.entry.where(level: 1): it => {
    v(0.5em, weak: true)
    strong(it)
  }

  outline(
    title: "Table of contents",
    indent: 2em,
  )
  pagebreak()

  doc

  if bibliography-file != none {
    show bibliography: set text(8pt)
  }
  
}
