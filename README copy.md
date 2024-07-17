# The GitKit Activities

This repository contains the pretext source for the GitKit activities.

## Licensing

Licensing information for the GitKit activities can be found in the [LICENSE.md](LICENSE.md) file.

## Contributing

1. Fork the upstream repo.
2. Open your fork in a Codespace using the green "Code" button.
3. Run `assets/link-images.bash`
4. Edit and commit chagnes to a feature branch.
5. Push and make a Pull Request

## Overall Structure

The files and folders in `source` include:

- `main.ptx`
  - contains the outline for the whole book by importing other `.ptx` files.
- `ch-abc-def` folders
  - each chapter is contained in a folder
  - the file in the folder with the same name and the `.ptx` file is an outline of the chapter.
    - gives some introductory text and then includes the `.ptx` files for the sections of the chapter.
- `sec-ghi-jkl.ptx`
  - contains the markup and text for the section, sub-sections, exercises, etc.

## Images

Each chapter folder should have an `images` folder to contain the images used in that chapter.

When a new chapter is added, edit and run the `assets/link-images.bash` script to update the links to the images folders.

Images can be placed in the text by using the chapter name in the `source`:

```xml
  <image source="images/ch-community-collaboration/basic-foss-workflow.png" width="75%">
    <description>The main project repo is forked into your GitHub space to create your remote copy.  Your remote copy is then cloned into your local development environment to create your local copy. Changes to your local copy are pushed to your remote copy and a pull request is made to the main project.
    </description>
  </image>
```

## Section File Structure

```
<section>
  <title>...</title>
  <introduction>
    ...
  </introduction>
  <subsection>
    ...
    <exercise>
    </exercise>
    ...
    <subsubsection>
      <exercise>
      </exercise>
      ...
    </subsubsection>
  </subsection>
  <conclusion>
    ...
  </conclusion>
</section>
```

Notes:

- The `...` can be most any content.
- If a section is short and does not require sub-sections then the `<subsection>` division should be omitted.

## Naming Conventions

Every XML element that needs to be cross referenced using an `xref` must have an `xml:id` attribute.

In addition any elements that are recognized by Runestone (e.g `<exercise.`) must have a `label`. For simplicity and consistency if an element has both an `xml:id` attribute and a `label` attribute they will have the same value.

For example, an `<exercise>` division following the naming convention defined below might have the `xml:id` and `label` as follows:

```xml
  <exercise
    xml:id="ex-foss-community-principles-q1"
    label="ex-foss-community-principles-q1"
    >
```

This element can then be linked to using the following:

```xml
<xref ref="ex-foss-community-principles-q1"/>
```

__Basics__

1. Use only lowercase letters and numbers.
2. Use only hyphens to separate words in multiword names: `this-is-an-example`
3. Prefix each `xml:id` with the type of thing being linked to. Here is an initial list of prefixes:
    <dl>
      <dt>fig-</dt>
      <dd>Figure</dd>
      <dt>table-</dt>
      <dd>Table</dd>
      <dt>topic-</dt>
      <dd>A topic is a block of text at any level of abstraction. Thus it can be used for a section, a subsection, a paragraph, a chapter, or even a part.</dd>
      <dt>ex-</dt>
      <dd>An exercise or set of exercises.</dd>
    </dl>

__Advice__

1. Use meaningful names that name or describe the thing they name.
2. Avoid including information that may change (like its structural information: e.g., fig-sec1-subsec2-flow). This avoids having to rename it if you move it to another section.
3. Only add `xml:id` and `label` attributes to elements that need them.
    * If PreTeXt or Runestone require it, then do so.
    * If you need to link to something from another section, then do so.

__Tip for finding IDs to link to__

Try using a tool like `grep`...

```bash
$ grep -R 'xml:id' .        # All
$ grep -R 'xml:id="fig-' .  # Figures
```

## Versions

The `<target>`s defined in the `project.ptx` file define the different versions of the book that can be built. How each version appears in defined by the `.ptx` files in the `publication` folder that are referenced by the `<target>`

There are 12 versions defined at the moment:

- `student-web-linux` and `student-print-linux` - The Linux KitClient book as students will see it.
- `student-web-vscode` and `student-print-vscde` - The VSCode KitClient book as students will see it.

- `instructor-web-linux` and `instructor-print-linux` - The Linux KitClient book including notes to the instructor (see below).
- `instructor-web-vscode` and `instructor-print-vscode` - The VSCode KitClient book including notes to the instructor (see below).

- `web-linux` and `print-linux` - same as the instructor versions. Included for the CodeChat preview.
- `web-VSCode` and `print-VSCode` - same as the instructor versions. Included for the CodeChat preview.

The versions can be built using the `PreTeXt` menu or using terminal commands similar to:

```text
pretext build instructor-web-linux
pretext view instructor-web-linux
```

**Note:** In order to build the print versions it is necessary to open the `.devcontainer.json` file and uncomment the line:
```
  // "image": "oscarlevin/pretext:small",
```
Leaving this uncommented will consume space in the CodeSpace and may exhaust the free allocation.

### Adding Comments to the Instructor Versions

Information for the instructor can be added directly in the source text at the appropriate location and then an instructor version of the full document can be built.

Content for the instructor is added as:

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

### Adding KitClient Specific Content

Content specific to a given kit client should be in a division/attribute with the attribute:
- `components="linux-kit-client"`
- `components="vscode-kit-client"`

For example:
```
  <p component="vscode-kit-client">
    This text appears only in the VSCode Kit Client version.
  </p>
```