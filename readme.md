# EPUB KB policy testing

## Contents of this repository

Custom-made *EPUB* test files. The files were specifically created for the purpose of testing an automated procedure to validate *EPUB*s  against KB institutional policies. These policies require the following:

* Files must be valid *EPUB* (version 2 or 3)
* File may not contain DRM or encryption (edge case: font mangling, should be permitted)
* All resources in the container fall within the Core Media Types 
* No Digital Talking Book (DTB) content documents

As a result, most of the files in this repo deliberately violate one or more of the above requirements. 

## Directories

* **Content** - uncompressed contents of each test file
* **build** - actual epub builds
* **pubresources** - various resources (files) that were used for creating the epubs.


## Core Media Types in *EPUB* 2 and *3*

The following table lists all permitted Core Media Types of *EPUB* 3 (which is a superset of those in *EPUB* 2, but see below):

| Media Type                  | Description                                        |
|-----------------------------|----------------------------------------------------|
| image/gif                   | GIF Images                                         |
| image/jpeg                  | JPEG Images                                        |
| image/png                   | PNG Images                                         |
| image/svg+xml               | SVG documents                                      |
| application/xhtml+xml       | XHTML5 Content Documents, EPUB Navigation Document |
| application/x-dtbncx+xml    | NCX (superseded)                                   |
| application/vnd.ms-opentype | OpenType fonts                                     |
| application/font-woff       | WOFF fonts                                         |
| application/smil+xml        | EPUB Media Overlay documents                       |
| application/pls+xml         | Text-to-Speech Pronunciation lexicons              |
| audio/mpeg                  | MP3 audio                                          |
| audio/mp4                   | AAC LC audio using MP4 container                   |
| text/css                    | EPUB Style Sheets                                  |
| text/javascript             | Scripts                                            |


The table below indicates the support of these Core Media Types in *EPUB* 2 and 3:

| Media Type                  | EPUB 2 | EPUB 3 |
|-----------------------------|--------|--------|
| image/gif                   | ✓      | ✓      |
| image/jpeg                  | ✓      | ✓      |
| image/png                   | ✓      | ✓      |
| image/svg+xml               | ✓      | ✓      |
| application/xhtml+xml       | ✓      | ✓      |
| application/x-dtbncx+xml    | ✓      | ✓      |
| application/vnd.ms-opentype | -      | ✓      |
| application/font-woff       | -      | ✓      |
| application/smil+xml        | -      | ✓      |
| application/pls+xml         | -      | ✓      |
| audio/mpeg                  | -      | ✓      |
| audio/mp4                   | -      | ✓      |
| text/css                    | ✓      | ✓      |
| text/javascript             | -      | ✓      |


Most of the *EPUB* 3 Core Media Types are also supported by *EPUB* 2, with the exception of fonts (*OpenType* and *WOFF*), Media Overlay Documents, Text-to-Speech Overlay documents, *MP3* and *AAC LC* Audio and scripts. In addition, for Content Documents *EPUB* 2 allows the use of the *Digital Talking Book* format (DTBook) as an alternative to *XHTML1.1*. This is no longer the case in *EPUB* 3. However, Section 2.2 (Reading System Conformance) of *EPUB Publications* states that 

> [a]n EPUB Reading System (...) *should* process EPUB version 2 Publications (...)
> 
