# The GitKit Activities

This repository contains the pretext source for the GitKit activities.

## Licensing

Licensing information for the GitKit activities can be found in the [LICENSE.md](LICENSE.md) file.

## Contributing

1. Fork the upstream repo.
2. Open your fork in a Codespace using the green "Code" button.
3. Edit and commit chagnes to a feature branch.
4. Push and make a Pull Request

## PreTeXt References

These are some helpful PreTeXt references:
- The PreTeXt guide:
  - https://pretextbook.org/doc/guide/html/guide-toc.html
    - Tip: Use the search feature!

- PreTeXt Sample Books:
  - A omprehensive set of exercise and media type exampeles with source:
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

## Authoring Section Files

### Typcial File Structure

The code below shows the skeleton of a prototypcial section:

```
<?xml version="1.0" encoding="UTF-8"?>

<section
  xml:id="topic-section-title"
  xmlns:xi="http://www.w3.org/2001/XInclude"
  >
  <title>...</title>
  <introduction>
    ...
  </introduction>
  <subsection>
    <exercises
      xml:id="ex-section-title">
      <title />
      ...
      <exercise
        xml:id="ex-description-of-exercise">
      </exercise>
      ...
    </exercises>
    <subsubsection>
      <exercises
        xml:id="ex-subsection-title">
        <title />
        ...
        <exercise
          xml:id="ex-description-of-exercise">
        </exercise>
        ...
      </exercises>
    </subsubsection>
    ...
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
- If a section is short and does not require subsections then the `<subsection>` division should be omitted.

### `xml:id` Naming Conventions

Every division/element can have an `xml:id` attribute and some elements are required to have one. 

The `xml:id`s are required to be unique across the entire text.  To help ensure that `xml:id`s are unique and discoverable they will be prefixed with the type of thing being linked to using the following previxes:
<dl>
  <dt>fig-</dt>
  <dd>for a Figure</dd>
  <dt>table-</dt>
  <dd>for a Table</dd>
  <dt>topic-</dt>
  <dd>A topic is a block of text at any level of abstraction. Thus it can be used for a section, a subsection, a paragraph, a chapter, or even a part.</dd>
  <dt>ex-</dt>
  <dd>An `<exercises>` division, an `<exercise>` element, or a `<task>` element.</dd>
</dl>

Other cases:
- If multiple chapters have the same section name (e.g. Appendix-A, Git Command Summary, etc) then append the `xml:id` of the chapter. For example `<section xml:id=”topic-appendix-a-chapter-name”>`
- If a division/element will appear only in the `linux` or `vscode` version of the text its `xml:id` should have a suffix indicating its version.  
- If two divisions/elements provide alternate content for the `linux` and `vscode` versions their `xml:ids` will be the same except for the suffix. 

Additional general suggestions:
1. Use meaningful names that name or describe the thing they name.
2. Use only lowercase letters and numbers.
3. Use only hyphens to separate words in multiword names: `this-is-an-example`
4. Avoid including information that may change (like its structural information: e.g., fig-sec1-subsec2-flow). This avoids having to rename it if you move it to another section.

The following elements will always have an `xml:id`:
- `<section xml:id="topic-section-title">`
- `<figure xml:id="fig-figure-descriptions">`
- `<exercises xml:id="ex-section-title">`
- `<exercise xml:id="ex-exercise-description" label="ex-exercise-description>`
- `<task xml:id="ex-task-description" label="ex-task-description>`
- Any division or element that needs to be cross referenced using an `xref`. 

In addition, `<exercise>` and `<task>` elements are recognized by Runestone and must have a `label` attribute. For simplicity and consistency if an element has both an `xml:id` attribute and a `label` attribute they will have the same value.

For example, an `<exercise>` element following the naming convention defined below might have the `xml:id` and `label` as follows:

```xml
  <exercise
    xml:id="ex-foss-community-principles-q1"
    label="ex-foss-community-principles-q1"
    >
```

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
- `"..." (quotations)
  - GitHub / VSCode / Linux UI elements (buttons / menus / text in output / etc)

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

##### Multiple Choice

- Multiple Choice [choose all that apply]: Do not give feedback on individual choices, but include a general hint.
- Multiple Choice [choose one]: prefer to give a general hint if it can be sufficiently helpful, otherwise provide feedback on individual options.

##### Multipart Questions

An `<exercise>` containing `<task>`s can be used to create a question with multiple parts.  For example:

```
<exercise
  xml:id="ex-sample-with-tasks"
  label="ex-sample-with-tasks">
  <title>Bold face next to question number.</title>
  <introduction>
    <p>Not boldface following title</p>
  </introduction>
  <task
    xml:id="ex-first-task-description"
    label="ex-first-task-description">
    ... content for an exercise ...
  </task>
  <task
    xml:id="ex-second-task-description"
    label="ex-second-task-description">
    ... content for an exsercise ...
  </task>
</exercise>
```

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

##### Adding KitClient Specific Content

Content specific to a given kit client is indicated by adding a `component` attribute to to divisions/elements as follows:

```
  <p 
    component="linuc-kit-client"
    xml:id="topic-some-stuff-linux">
    This text appears only in the Linux Kit Client versions.
  </p>

  <p 
    component="vscode-kit-client"
    xml:id="topic-some-stuff-vscode">
    This text appears only in the VSCode Kit Client versions.
  </p>
```

##### Defining a Version

The available versions are defined by the `<target>`s in the `project.ptx` file.  Each `<target>` references a `.ptx` file in the `publication` folder that indicates the content that will appear in the version.

