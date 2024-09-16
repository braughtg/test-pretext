# The GitKit Text

This repository contains the pretext source for the GitKit Runestone texts.  

If you are interested in using the GitKit Text please see the Instructor Guide in the text on Runestone by using one of the following links:
- [GitKit (Linux Desktop Edition)](https://runestone.academy/ns/books/published/gitkitlinux/the-gitkit-book.html?mode=browsing) - students work in a full Linux desktop environment in this edition.
- [GitKit (VSCode Edition)](https://runestone.academy/ns/books/published/gitkitvscode/the-gitkit-book.html?mode=browsing) - students work within the VSCode IDE in this edition.

## Licensing

Licensing information for the GitKit activities can be found in the [LICENSE.md](LICENSE.md) file.

## Contributing

1. Fork the upstream repo.
2. Open your fork in a Codespace using the green "Code" button.
3. Edit and commit changes to a feature branch.
4. Push and make a Pull Request

## PreTeXt References

These are some helpful PreTeXt references:
- The PreTeXt guide:
  - https://pretextbook.org/doc/guide/html/guide-toc.html
    - Tip: Use the search feature!

- PreTeXt Sample Books:
  - A comprehensive set of exercise and media type examples with source:
    - https://pretextbook.org/examples/sample-book/annotated/rune.html
      - The same book running on Runestone w/o annotations but useful for seeing some features that do not work outside of Runestone:
        - https://runestone.academy/ns/books/published/PTXSB/rune.html
  - A complete book with source and helpful authoring commentary
    - https://pretextbook.org/examples/sample-article/annotated/derivatives.html

- The PreTeXt Schema Browser - indicates which divisions/elements nest within others.
  - https://pretextbook.org/doc/schema/

## Overall Repository Structure

The files and folders in `source` include:

- `main.ptx`
  - This file contains the outline for the whole book by importing other `.ptx` files.
- `ch-abc-def` folders
  - Each chapter is contained in a folder.
  - The file in the folder with the same name and the `.ptx` file is an outline of the chapter. 
  - This file gives some introductory text and then includes the `.ptx` files for the sections of the chapter.
- `sec-ghi-jkl.ptx`
  - This file contains the markup and text for the section, subsections, exercises, etc.
  - Section titles should be Title Case
  - Use an “ing” word for sections that are actions tied to concepts (e.g. Forking the Upstream).

## Terminology

Use standard preTeXt terminology when refering to elements in the text.  For example:
- Chapter
- Section
- Exercises
- Exercise
- Task

## Authoring Section Files

### Typcial File Structure

The code below shows the skeleton of a prototypcial section:

```
<?xml version="1.0" encoding="UTF-8"?>

<section
  xml:id="topic-section-title"
  xmlns:xi="http://www.w3.org/2001/XInclude"
  >
  <title>Section Title</title>
  <introduction>
    ...
  </introduction>
  <exercises>
    <title />
    ...
    <exercise
      xml:id="ex-some-exercise"
      label="ex-some-exercise">
    </exercise>
    ...
  </exercises>
  <conclusion>
    ...
  </conclusion>
</section>
```

### Including a Subsection

If a section contains subsections then each `<subsection>` gets its own `<exercises>` division as follows:

```
<?xml version="1.0" encoding="UTF-8"?>

<section
  xml:id="topic-section-title"
  xmlns:xi="http://www.w3.org/2001/XInclude"
  >
  <title>Section Title</title>
  <introduction>
    ...
  </introduction>
  <subsection>
    <title>Subsection Title</title>
    <introduction>
      ...
    </introduction>
    <exercises>
      <title />
      ...
      <exercise
        xml:id="ex-some-exercise"
        label="ex-some-exercise">
      </exercise>
      ...
    </exercises>
    <conclusion>
    ...
    </conclusion>
  </subsection>
  <conclusion>
    ...
  </conclusion>
</section>
```

Notes:
- Format code by right clicking in document and choosing "Format document with..." and then the “preTeXt-tools” formatter.
- `<exercises>` has an empty `<title \>` to prevent an "Exercises" heading from appearing.
- The `...` can be most any content.

### `xml:id`s and `label`s

`xml:id`s and `label`s are attributes assigned divisions/elements that help to identify them.  Both `xml:id`s and `labels` are required to be unique across the entire text.

A division/element in the preTeXt document will have an `xml:id` attribute if:
  - We want to create a link (`xref`) to it from somewhere else in the document.
  - The division/element is an `<exercise>` and `<task>`.
   
Every `<exercise>` and `<task>` will have both an `xml:id` and a `label` attribute with the same value.
  - The `label` attribute is required by Runestone to generate database identifiers for the questions and student responses.  
  - Including an `xml:id` with the same value ensures that the `labels` will be unique becasue the preTeXt build checks for duplicate labels.

#### Naming Conventions

To help ensure that `xml:id` and `label` values are unique across the entire text and are also discoverable they will follow a set of rules:
- Use only lowercase letters and numbers.
- Use only hyphens to separate words in multiword names: `this-is-an-example`
- Prefix the name with the type of thing being linked to using the following previxes:
- `fig-` for a Figure
- `table-` for a Table
- `topic-` for a block of text at any level of abstraction. Thus it can be used for a section, a subsection, a paragraph, a chapter, or even a part.
- `ex-` for an `<exercises>` division, an `<exercise>` element, or a `<task>` element.
- Avoid including information that may change (like its structural information: e.g., fig-sec1-subsec2-flow). This avoids having to rename it if you move it to another section.

Some examples follow:
```
<section 
  xml:id="topic-section-title">
  ...
</section>

<figure 
  xml:id="fig-figure-description">
  ...
</figure>

<exercises>
  <exercise 
    xml:id="ex-exercise-description" 
    label="ex-exercise-description>
    <task 
      xml:id="ex-task-description" 
      label="ex-task-description>
      ...
    </task>
    ...
  </exercise>
</exercises>
```

#### Other Cases

- If multiple chapters have the same section name (e.g. Appendix-A, Git Command Summary, etc) then append the `xml:id` of the chapter. For example:
```
  <section 
    xml:id=”topic-appendix-a-chapter-name”>
    ...
  </section>
```

#### Creating Links

Any division/element with an `xml:id` can then be linked to by using an `xref` as follows:

```xml
<xref ref="ex-foss-community-principles-q1"/>
```

#### Tip for Discovering Existing `xml:id`s for `xref`s

Use `grep` to find existing labels to link to. For example:

```bash
$ grep -R 'xml:id' .        # All
$ grep -R 'xml:id="fig-' .  # Figures
```

### Section Content

#### Text Styling 

Use text styling consistently throughout the document as follows:
- `<c>` for monospace type
  - git commands
  - main and any other specific branch names.
- `<em>` for italics
  - Specific file names or directory names.
- `<term>` for bold italics
  - The first use of a new term.
- `"..."` (quotations)
  - GitHub / VSCode / Linux UI elements (buttons / menus / text in output / etc)

#### Escaping Characters

The `<` symbol is the start of a tag and must be escaped as `&lt;` when used in preText.  For consistency and readability is it generally a good idea to escape both `<` and `>`.  For example:
```
git branch &lt;branchName&gt;
```
which will render as:
```
git branch <name>
```

Similarly the `&` character can be escaped as `&amp;`.

#### Adding Images

Each chapter folder has an `images` folder to contain the images used in that chapter.  In addition, there is a `shared-images` directory in the `source` folder that can be used for any images that appear in multiple chapters.

If a new chapter is added:
- Crearte an `images` folder in that chapter.
- Add a text file to that directory as a placeholder because git does not allow empty directories to be committed.
- Edit the `assets/link-images.bash` script to add a links to the new `images` folder.
- Run `assets/link-images.bash` from the root of the repository.

Images contained in one of the chapter's images folder can be placed in the text by using the chapter name in the `source`. For example:

```xml
  <image source="images/ch-community-collaboration/basic-foss-workflow.png" width="75%">
    <description>The main project repo is forked into your GitHub space to create your remote copy.  Your remote copy is then cloned into your local development environment to create your local copy. Changes to your local copy are pushed to your remote copy and a pull request is made to the main project.
    </description>
  </image>
```

#### Adding Exercises

The following subsections give general guidelines for adding `<exercise>`s.

#### General Rules

- `<exercise>` elements should use the `<introduction>` to state the context/question.
- An `<exercise>` or a `<task>` that requests that students do something without requiring a response are okay.


##### Multiple Choice

- Multiple Choice [choose all that apply]: Do not give feedback on individual choices, but include a general hint.
- Multiple Choice [choose one]: prefer to give a general hint if it can be sufficiently helpful, otherwise provide feedback on individual options.

##### Multipart Questions

An `<exercise>` containing `<task>`s can be used to create a question with multiple parts.  For example:

```
<exercise
  xml:id="ex-sample-with-tasks"
  label="ex-sample-with-tasks">
  <introduction>
    <p>Text introducing the set of questions.</p>
  </introduction>
  <task
    xml:id="ex-sample-with-tasks-a"
    label="ex-sample-with-tasks-a">
    ... task content ...
  </task>
  <task
    xml:id="ex-sample-with-tasks-b"
    label="ex-sample-with-tasks-b">
    ... task content ...
  </task>
</exercise>
```

Note:
- Fill-in questions are not currently suported within a `<task>`.  A [free response question](https://runestone.academy/ns/books/published/PTXSB/rune-20.html) (with [source](https://runestone.academy/ns/books/published/PTXSB/rune-20.html)) should be used instead. Note that the free response box only renders when running in Runestone.  This is because free response must be hand graded and cannot be auto checked in a static web deploy.  See [Using a fill in the blank exercise in a task](https://groups.google.com/g/pretext-support/c/VWLb_W0AT18) for updates on this issue.

#### Adding Version Specific Content

There are 10 versions of the text that can be built:

- `student-web-linux` and `student-print-linux` - The Linux KitClient book as students will see it.
- `student-web-vscode` and `student-print-vscde` - The VSCode KitClient book as students will see it.

- `instructor-web-linux` and `instructor-print-linux` - The Linux KitClient book including notes to the instructor (see below).
- `instructor-web-vscode` and `instructor-print-vscode` - The VSCode KitClient book including notes to the instructor (see below).

- `web` and `print` - same as the instructor Linux version.  This is included for the CodeChat preview.

##### Building a Specific Version

Any of these versions can be built using "Build another target..." option on the `PreTeXt` menu or by using terminal commands similar to:

```text
pretext build instructor-web-linux
pretext view instructor-web-linux
```

##### Adding KitClient Specific Content

Content specific to a given kit client is indicated by adding a `component` attribute to to divisions/elements as follows:

```
  <p 
    component="linux-kit-client"
    xml:id="topic-some-stuff-linux">
    This text appears only in the Linux Kit Client versions.
  </p>

  <p 
    component="vscode-kit-client"
    xml:id="topic-some-stuff-vscode">
    This text appears only in the VSCode Kit Client versions.
  </p>
```

- If a division/element will appear only in the `linux` or `vscode` version of the text its `xml:id` should have a suffix indicating its version.  
- If two divisions/elements provide alternate content for the `linux` and `vscode` versions their `xml:ids` will be the same except for the suffix. 

##### Instructor Version Content

A `commentary` element with the `component="instructor"` attrribute is used to add instructor guide information directly to the source text as follows:

```xml
 <commentary component="instructor">
    <tabular top="major" bottom="major" left="major" right="major">
      <col width="100%" />
      <row>
        <cell>
          <p>
            <alert>Instructor Note:</alert>: Information for the instructor appears here.
          </p>
        </cell>
      </row>
    </tabular>
  </commentary>
```

Note:
- The `<tabular>` is included to place all comments for the instructor into a box.

##### Defining a Version

The available versions are defined by the `<target>`s in the `project.ptx` file.  Each `<target>` references a `.ptx` file in the `publication` folder that indicates the content that will appear in the version.

##### Publishing a Version

Runestone does not currently support the publication of different versions of a text from a single repository. Instead, the solution is to create a fork of this repository. Then in that repository change the `publication` file that is the `target` of the `runestone` target to point to the `publication` file for the version that you would like to publish.  Then create a new Runestone text using that repository.

See the [GitKit-VSCode Repository](https://github.com/HFOSSedu/GitKit-VSCode) for an example.  That repository also includes information about how to update it from this repository when edits are made.
