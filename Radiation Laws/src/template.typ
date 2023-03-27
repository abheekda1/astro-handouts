// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(paper: "us-letter", numbering: "1", number-align: end)
  set text(font: "Linux Libertine", lang: "en")
  set heading(numbering: "1.1", outlined: true)
  set math.equation(numbering: "(1)")

  // Title row.
  align(center + horizon)[
    #block(text(font: "DejaVu Serif", weight: 700, 2.75em, title))
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        *#author.name* \
        #author.affiliation
      ]),
    ),
  )

  pagebreak()
  
  outline(indent: true)

  pagebreak()

  // Main body.
  set par(justify: true)

  body

  pagebreak()

  bibliography("works.yml", title: "Works Cited", style: "ieee")
}
