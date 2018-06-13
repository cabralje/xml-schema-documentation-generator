
<p class="title">XML Schema documentation generator</p>

# Building

1. ./configure 

  Set up the build process for your local environment.  Variables you can set include:
  
  * `install_dir`: directory to where files will be copied for `make install`
  * `xml_catalog`: An XML catalog file identifying the schemas to be processed.

2. make

  Process the schema files to produce indexes, diagrams, and pages for
  components. Results are put into diretory `build`.

3. make install

  Copy result files into directory for publication. You may want to set variable
  `install_dir` to be the directory for a git repository.

## notes

Documentation for a string is at:

https://www.w3.org/TR/xmlschema-2/#string

## todo

- replace resolve-component with attribute-get-qname
- rename f:get-href() to f:qname-get-href()
- eliminate use of f:xs-component-get-relative path
  - instead, use f:qname-get-href()
- Need landing pages for XML Schema types
  - right now the XSD types just point into the XSD specification.
  - We need to be able to see, e.g.,
    - What attributes are of type xs:boolean?
    - What simple types are extended from xs:string?


# Order

1. develop makefile dependencies
   1. get a list of namespaces
      1. one prefix per namespace
      2. one schemalocation per namespace

* Strategy:

1. One prefix per namespace.
2. Only reference schemas (for now) & profiles of reference schemas.
3. URI for a component looks like:

   ${root}/${prefix}/${component-local-name}

4. Each component is a single page. What we put on each page is TBD, as much detail as is useful, but no more.
5. Each page is a folder containing an index.md
6. Everything in Markdown, with images as PNGs via Graphviz.
7. Graphviz images use maps for hotlinks to other component pages.
8. Use Makefiles dependencies to build everything in parallel without rebuilding everything every time.
9. Every anchor needs to be semantically-based, not built with generate-id(), to be consistent across builds.

* Someday Maybe items:

1. Include in the source dir, or another dir, a set of pages that augment the documentation for a given component. This could be a pile of markdown and images that is somehow integrated with the generated pages. This might include, for example, specific examples of use of a component. That would be in a page within the hierarchy for the component, with a given name.
2. Provide sample JSON schema for a component as it appears in the XML schema.

* Issues
- How to narrow down visibility of components when viewing the full model? For example, PersonType has (1) a ton of properties, and (2) is the type of a ton of properties.
- Do we distinguish between attributes and elements?

* Page conventions

** Fonts
CSS fonts: https://www.w3.org/TR/css-fonts-3/
 ‘serif’, ‘sans-serif’, ‘cursive’, ‘fantasy’, and ‘monospace’

http://code.stephenmorley.org/html-and-css/the-myth-of-web-safe-fonts/

- sans-serif: font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
- mono: font-family:'Courier New',Courier,monospace;

* Graph conventions
** Lists
- e.g., lists of elements, lists of types, etc.
- order
  - structures
  - nc
  - everything else, in alphabetical order
** Cardinality examples

- 1 
- 0-1
- 0-n
- 1-n
- 2-n
- 3-5
- 4-n

* Resources

- see ~/working/test-gen-xsd-diagrams/
- see /Users/wr/r/by-topic/graphviz/graphics-nc-PersonType.gv

<style type="text/css"> 
body { counter-reset: i1 i2; }
.title { font-size: 150%; font-weight: bold; }
h1:before { 
  counter-increment: i1;
  content: counter(i1) ". ";
  counter-reset: i2;
}
h1 { font-size: 120%; }
h2:before { 
  counter-increment: i2;
  content: counter(i1) "." counter(i2) ". ";
}
h2 { font-size: 110%; }
</style>

